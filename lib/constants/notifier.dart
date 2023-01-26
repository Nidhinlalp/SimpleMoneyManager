import 'package:flutter/material.dart';
import 'package:simplemoneymanager/db_functions/transaction/transaction_db.dart';
import 'package:simplemoneymanager/models/transaction/transaction_model.dart';
import '../models/cetegory/cetegory_models.dart';

ValueNotifier<CategoryType> selectCategorytype =
    ValueNotifier(CategoryType.income);

ValueNotifier showCategory = ValueNotifier("All");

ValueNotifier<List<TransactionModel>> overviewTransactions =
    ValueNotifier(TransactionDb.transactionListNotifire.value);

ValueNotifier<CategoryType> selectCategoryNotifire =
    ValueNotifier(CategoryType.income);

ValueNotifier<List<TransactionModel>> overviewGraphTransactions =
    ValueNotifier(TransactionDb.transactionListNotifire.value);
