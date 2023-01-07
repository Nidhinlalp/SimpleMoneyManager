
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:simplemoneymanager/models/transaction/transaction_model.dart';

const TRANSACTION_DB_NAME = 'transaction-db';

abstract class TransactionDbFunctions{
  Future <void> addTransaction (TransactionModel obj);
  Future<List<TransactionModel>> getAllTransaction();
  Future <void>deleteTransaction (String id);
}


  ValueNotifier<List<TransactionModel>>transactionListNotifire = ValueNotifier([]);
class TransactionDb implements TransactionDbFunctions{
  TransactionDb._internal();

  static TransactionDb instance =TransactionDb._internal();

  factory TransactionDb(){
    return instance;
  }
  


  @override
  Future<void> addTransaction(TransactionModel obj)async {
    final db = await Hive.openBox<TransactionModel>(TRANSACTION_DB_NAME);
    await db.put(obj.id, obj); 
   
  }

  Future<void> refresh() async{
    final list = await getAllTransaction();
    list.sort((first, second)=>second.date.compareTo(first.date));
    transactionListNotifire.value.clear();
    transactionListNotifire.value.addAll(list);
    transactionListNotifire.notifyListeners();
  }
  
  @override
  Future<List<TransactionModel>> getAllTransaction() async{
    final db = await Hive.openBox<TransactionModel>(TRANSACTION_DB_NAME);
    return db.values.toList();
  }
  
  @override
  Future<void> deleteTransaction(String id)async {
       final db = await Hive.openBox<TransactionModel>(TRANSACTION_DB_NAME);
       await db.delete(id);
       refresh();

  }

}