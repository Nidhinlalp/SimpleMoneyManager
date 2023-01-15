import 'package:flutter/material.dart';
import 'package:simplemoneymanager/models/cetegory/cetegory_models.dart';
import '../../db_functions/category/category_db.dart';
import '../../db_functions/transaction/transaction_db.dart';
import '../../models/transaction/transaction_model.dart';
import '../Hometransactions/transaction_slidable.dart';

class ExpenseSeeAll extends StatelessWidget {
  const ExpenseSeeAll({super.key});

  @override
  Widget build(BuildContext context) {
    TransactionDb.instance.refresh();
    CategoryDb.instance.refreshUI();
    return ValueListenableBuilder(
        valueListenable: transactionListNotifire,
        builder: (BuildContext ctx, List<TransactionModel> newList, Widget? _) {
          List<TransactionModel> allexpenseTransaction = [];
          allexpenseTransaction = newList
              .where((element) => element.type == CategoryType.expense)
              .toList();
          return allexpenseTransaction.isEmpty
              ? const Center(
                  child: Text("Oops! No  Data 👎"),
                )
              : ListView.separated(
                  padding: const EdgeInsets.all(20.0),
                  itemBuilder: (ctx, index) {
                    final value = allexpenseTransaction[index];
                    return TransactionSlidable(value: value);
                  },
                  separatorBuilder: (ctx, index) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                  itemCount: allexpenseTransaction.length,
                );
        });
  }
}
