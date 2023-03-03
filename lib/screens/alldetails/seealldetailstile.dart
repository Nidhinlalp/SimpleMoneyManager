import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:simplemoneymanager/db_functions/transaction/transaction_db.dart';
import 'package:simplemoneymanager/models/cetegory/cetegory_models.dart';
import 'package:simplemoneymanager/models/transaction/transaction_model.dart';
import 'package:simplemoneymanager/screens/hometransactions/transaction_slidable.dart';

class SeeAllDetailsTiles extends StatelessWidget {
  const SeeAllDetailsTiles({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TransactionDb>(
      builder: (context, transactionDb, widget) {
        var displayList = [];
        if (transactionDb.showCategory == "Income") {
          List<TransactionModel> allincometransaction = [];
          allincometransaction = transactionDb.overviewTransactions
              .where((element) => element.type == CategoryType.income)
              .toList();
          displayList = allincometransaction;
        } else if (transactionDb.showCategory == "Expense") {
          List<TransactionModel> allincometransaction = [];
          allincometransaction = transactionDb.overviewTransactions
              .where((element) => element.type == CategoryType.expense)
              .toList();

          displayList = allincometransaction;
        } else {
          displayList = transactionDb.overviewTransactions;
        }
        return displayList.isEmpty
            ? Center(child: Lottie.asset('assets/images/empty.json'))
            : ListView.builder(
                itemCount: displayList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20, bottom: 5, top: 10),
                    child: TransactionSlidable(value: displayList[index]),
                  );
                },
              );
      },
    );
  }
}
