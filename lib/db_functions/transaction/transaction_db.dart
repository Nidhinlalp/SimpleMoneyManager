import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:simplemoneymanager/models/cetegory/cetegory_models.dart';
import 'package:simplemoneymanager/models/transaction/transaction_model.dart';

class TransactionDb with ChangeNotifier {
  static const transactionDbName = 'transaction-db';
  String showCategory = ("All");
  String dateFilterTitle = "All";

  List<TransactionModel> transactionListNotifire = [];
  List<TransactionModel> overviewGraphTransactions = [];
  List<TransactionModel> overviewTransactions = [];

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
    incomeandexpense(transactionListNotifire);
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

  double incomtotel = 0;
  double expensetotel = 0;
  double totalbalanse = 0;

  void incomeandexpense(List<TransactionModel> listofModel) {
    incomtotel = 0;
    expensetotel = 0;
    totalbalanse = 0;

    final List<TransactionModel> value = listofModel;

    for (int i = 0; i < value.length; i++) {
      if (CategoryType.income == value[i].category.type) {
        incomtotel = incomtotel + value[i].amount;
      } else {
        expensetotel = expensetotel + value[i].amount;
      }
    }
    totalbalanse = incomtotel - expensetotel;
    notifyListeners();
  }
}
