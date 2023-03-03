import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:simplemoneymanager/models/transaction/transaction_model.dart';

// abstract class TransactionDbFunctions {
//   Future<void> addTransaction(TransactionModel obj);
//   Future<List<TransactionModel>> getAllTransaction();
//   Future<void> deleteTransaction(String id);
// } //includer class

class TransactionDb with ChangeNotifier {
  static const transactionDbName = 'transaction-db';
  // TransactionDb._internal();
  String showCategory = ("All");
  String dateFilterTitle = "All";

  List<TransactionModel> transactionListNotifire = [];
  List<TransactionModel> overviewGraphTransactions = [];
  // TransactionDb.instance.transactionListNotifire;
  List<TransactionModel> overviewTransactions = [];
  // (TransactionDb.instance.transactionListNotifire);

  // static TransactionDb instance = TransactionDb._internal();

  // factory TransactionDb() {
  //   return instance;
  // }

  set setOverviewTransactions(List<TransactionModel> overviwnewList) {
    overviewTransactions = overviwnewList;

    notifyListeners();
  }

  set setoverviewGraphTransactions(
      List<TransactionModel> overviewGraphTransactionsnewList) {
    overviewGraphTransactions = overviewGraphTransactionsnewList;

    notifyListeners();
  }

  set setdateFilterTitle(String dateFilterTitlenewList) {
    dateFilterTitle = dateFilterTitlenewList;

    notifyListeners();
  }

  set setshowCategory(String overshowCategory) {
    showCategory = overshowCategory;
    notifyListeners();
  }

  set settransactionListNotifire(List<TransactionModel> transactionnewList) {
    transactionListNotifire = transactionnewList;
    notifyListeners();
  }

  Future<void> addTransaction(TransactionModel obj) async {
    final db = await Hive.openBox<TransactionModel>(transactionDbName);
    await db.put(obj.id, obj);
    refresh();
  }

  Future<void> refresh() async {
    final list = await getAllTransaction();
    list.sort((first, second) => second.date.compareTo(first.date));
    transactionListNotifire.clear();
    transactionListNotifire.addAll(list);
    overviewTransactions = transactionListNotifire;

    // context.read<IncomeAndExpence>().incomeandexpense(transactionListNotifire);
    notifyListeners();
  }

  Future<List<TransactionModel>> getAllTransaction() async {
    final db = await Hive.openBox<TransactionModel>(transactionDbName);
    return db.values.toList().reversed.toList();
  }

  Future<void> deleteTransaction(String id) async {
    final db = await Hive.openBox<TransactionModel>(transactionDbName);
    await db.delete(id);
    refresh();
  }

  Future<void> dbEditTransaction(TransactionModel value) async {
    final db = await Hive.openBox<TransactionModel>(transactionDbName);
    await db.put(value.id, value);
    refresh();
  }
}
