import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:simplemoneymanager/db_functions/category/category_db.dart';
import 'package:simplemoneymanager/db_functions/transaction/transaction_db.dart';
import 'package:simplemoneymanager/models/transaction/transaction_model.dart';
import '../screens/Hometransactions/transaction_slidable.dart';

class OverViewSeeAll extends StatelessWidget {
  const OverViewSeeAll({super.key});

  @override
  Widget build(BuildContext context) {
    TransactionDb.instance.refresh();
    CategoryDb.instance.refreshUI();
    return ValueListenableBuilder(
        valueListenable: transactionListNotifire,
        builder: (BuildContext ctx, List<TransactionModel> newList, Widget? _) {
          return ListView.separated(
            padding: const EdgeInsets.all(20.0),
            itemBuilder: (ctx, index) {
              final value = newList[index];
              return TransactionSlidable(value: value);
            },
            separatorBuilder: (ctx, index) {
              return const SizedBox(
                height: 10,
              );
            },
            itemCount: newList.length,
          );
        });
  }

  String parseDate(DateTime date) {
    final _date = DateFormat.MMMd().format(date);
    final splitedDate = _date.split(' ');
    return '${splitedDate.last}\n${splitedDate.first}';
  }
}
