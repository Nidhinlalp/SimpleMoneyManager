import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:simplemoneymanager/models/transaction/transaction_model.dart';

const transactionDbName = 'transaction-db';

abstract class TransactionDbFunctions {
  Future<void> addTransaction(TransactionModel obj);
  Future<List<TransactionModel>> getAllTransaction();
  Future<void> deleteTransaction(String id);
} //includer class

class TransactionDb implements TransactionDbFunctions {
  TransactionDb._internal();

  static ValueNotifier<List<TransactionModel>> transactionListNotifire =
      ValueNotifier([]);

  static TransactionDb instance = TransactionDb._internal();

  factory TransactionDb() {
    return instance;
  }

  @override
  Future<void> addTransaction(TransactionModel obj) async {
    final db = await Hive.openBox<TransactionModel>(transactionDbName);
    await db.put(obj.id, obj);
  }

  Future<void> refresh() async {
    final list = await getAllTransaction();
    list.sort((first, second) => second.date.compareTo(first.date));
    transactionListNotifire.value.clear();
    transactionListNotifire.value.addAll(list);
    transactionListNotifire.notifyListeners();
  }

  @override
  Future<List<TransactionModel>> getAllTransaction() async {
    final db = await Hive.openBox<TransactionModel>(transactionDbName);
    return db.values.toList().reversed.toList();
  }

  @override
  Future<void> deleteTransaction(String id) async {
    final db = await Hive.openBox<TransactionModel>(transactionDbName);
    await db.delete(id);
    refresh();
  }

  Future<void> editTransaction(TransactionModel value) async {
    final db = await Hive.openBox<TransactionModel>(transactionDbName);
    await db.put(value.id, value);
    refresh();
  }
}
