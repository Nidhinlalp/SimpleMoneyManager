import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:simplemoneymanager/models/transaction/transaction_model.dart';

const TRANSACTION_DB_NAME = 'transaction-db';

abstract class TransactionDbFunctions{
  Future <void> addTransaction (TransactionModel obj);
  Future<List<TransactionModel>> getAllTransaction();
  Future <void>deleteTransaction (String id);
}


class TransactionDb implements TransactionDbFunctions{
  TransactionDb._internal();

  static TransactionDb instance =TransactionDb._internal();

  factory TransactionDb(){
    return instance;
  }
  
  ValueNotifier<List<TransactionModel>>transactionListNotifire = ValueNotifier([]);


  @override
  Future<void> addTransaction(TransactionModel obj)async {
    final _db = await Hive.openBox<TransactionModel>(TRANSACTION_DB_NAME);
    await _db.put(obj.id, obj); 
   
  }

  Future<void> refresh() async{
    final _list = await getAllTransaction();
    _list.sort((first, second)=>second.date.compareTo(first.date));
    transactionListNotifire.value.clear();
    transactionListNotifire.value.addAll(_list);
    transactionListNotifire.notifyListeners();
  }
  
  @override
  Future<List<TransactionModel>> getAllTransaction() async{
    final _db = await Hive.openBox<TransactionModel>(TRANSACTION_DB_NAME);
    return _db.values.toList();
  }
  
  @override
  Future<void> deleteTransaction(String id)async {
       final _db = await Hive.openBox<TransactionModel>(TRANSACTION_DB_NAME);
       await _db.delete(id);
       refresh();

  }

}