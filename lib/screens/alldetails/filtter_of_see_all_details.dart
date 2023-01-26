import 'package:flutter/material.dart';
import 'package:simplemoneymanager/constants/notifier.dart';
import 'package:simplemoneymanager/db_functions/transaction/transaction_db.dart';
import 'package:simplemoneymanager/screens/alldetails/seeall_details.dart';

class FiltterSeeAllDetails extends StatelessWidget {
  const FiltterSeeAllDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15.0),
      child: PopupMenuButton<int>(
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(
            50,
          ),
        ),
        child: const Icon(
          Icons.filter_list_rounded,
          size: 30,
          shadows: <Shadow>[Shadow(color: Colors.white, blurRadius: 15.0)],
          color: Colors.black,
        ),
        itemBuilder: (conext) => [
          PopupMenuItem(
            value: 1,
            child: const Text(
              "All",
            ),
            onTap: () {
              overviewTransactions.value =
                  TransactionDb.transactionListNotifire.value;
            },
          ),
          PopupMenuItem(
            value: 2,
            child: const Text(
              "Today",
            ),
            onTap: () {
              overviewTransactions.value =
                  TransactionDb.transactionListNotifire.value;
              overviewTransactions.value = overviewTransactions.value
                  .where((element) =>
                      element.date.day == DateTime.now().day &&
                      element.date.month == DateTime.now().month &&
                      element.date.year == DateTime.now().year)
                  .toList();
            },
          ),
          PopupMenuItem(
              value: 2,
              child: const Text(
                "Yesterday",
              ),
              onTap: () {
                overviewTransactions.value =
                    TransactionDb.transactionListNotifire.value;
                overviewTransactions.value = overviewTransactions.value
                    .where((element) =>
                        element.date.day == DateTime.now().day - 1 &&
                        element.date.month == DateTime.now().month &&
                        element.date.year == DateTime.now().year)
                    .toList();
              }),
          PopupMenuItem(
              value: 2,
              child: const Text(
                "Month",
              ),
              onTap: () {
                overviewTransactions.value =
                    TransactionDb.transactionListNotifire.value;
                overviewTransactions.value = overviewTransactions.value
                    .where((element) =>
                        element.date.month == DateTime.now().month &&
                        element.date.year == DateTime.now().year)
                    .toList();
              }),
        ],
      ),
    );
  }
}
