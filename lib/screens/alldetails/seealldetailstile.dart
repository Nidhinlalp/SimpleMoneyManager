import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:simplemoneymanager/models/cetegory/cetegory_models.dart';
import 'package:simplemoneymanager/models/transaction/transaction_model.dart';
import 'package:simplemoneymanager/screens/alldetails/seeall_details.dart';
import 'package:simplemoneymanager/screens/hometransactions/transaction_slidable.dart';

class SeeAllDetailsTiles extends StatelessWidget {
  const SeeAllDetailsTiles({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: overviewTransactions,
      builder: (context, newList, _) {
        return ValueListenableBuilder(
          valueListenable: showCategory,
          builder: (context, showCategory, widget) {
            var displayList = [];
            if (showCategory == "Income") {
              List<TransactionModel> allincometransaction = [];
              allincometransaction = newList
                  .where((element) => element.type == CategoryType.income)
                  .toList();
              displayList = allincometransaction;
            } else if (showCategory == "Expense") {
              List<TransactionModel> allincometransaction = [];
              allincometransaction = newList
                  .where((element) => element.type == CategoryType.expense)
                  .toList();
              displayList = allincometransaction;
            } else {
              displayList = newList;
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
      },
    );
  }
}
