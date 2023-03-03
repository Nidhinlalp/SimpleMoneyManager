import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simplemoneymanager/db_functions/transaction/transaction_db.dart';

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
              context.read<TransactionDb>().setOverviewTransactions =
                  context.read<TransactionDb>().transactionListNotifire;
            },
          ),
          PopupMenuItem(
            value: 2,
            child: const Text(
              "Today",
            ),
            onTap: () {
              context.read<TransactionDb>().setOverviewTransactions =
                  context.read<TransactionDb>().transactionListNotifire;
              context.read<TransactionDb>().setOverviewTransactions = context
                  .read<TransactionDb>()
                  .overviewTransactions
                  .where((element) {
                log('Date: ${element.date.day}');
                return (element.date.day == DateTime.now().day &&
                    element.date.month == DateTime.now().month &&
                    element.date.year == DateTime.now().year);
              }).toList();
              log('Current OverviewTransactionLength: ${context.read<TransactionDb>().overviewTransactions.length}');
            },
          ),
          PopupMenuItem(
              value: 2,
              child: const Text(
                "Yesterday",
              ),
              onTap: () {
                context.read<TransactionDb>().overviewGraphTransactions =
                    context.read<TransactionDb>().transactionListNotifire;

                context.read<TransactionDb>().setOverviewTransactions = context
                    .read<TransactionDb>()
                    .overviewTransactions
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
                context.read<TransactionDb>().setOverviewTransactions =
                    context.read<TransactionDb>().transactionListNotifire;
                context.read<TransactionDb>().setOverviewTransactions = context
                    .read<TransactionDb>()
                    .overviewTransactions
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
