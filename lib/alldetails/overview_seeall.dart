import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:simplemoneymanager/db_functions/category/category_db.dart';
import 'package:simplemoneymanager/db_functions/transaction/transaction_db.dart';
import 'package:simplemoneymanager/models/cetegory/cetegory_models.dart';
import 'package:simplemoneymanager/models/transaction/transaction_model.dart';

class OverViewSeeAll extends StatelessWidget {
  const OverViewSeeAll({super.key});

  @override
  Widget build(BuildContext context) {
    TransactionDb.instance.refresh();
    CategoryDb.instance.refreshUI();
    return ValueListenableBuilder(
        valueListenable: TransactionDb.instance.transactionListNotifire,
        builder: (BuildContext ctx, List<TransactionModel> newList, Widget? _) {
          return ListView.separated(
            padding: const EdgeInsets.all(20.0),
            itemBuilder: (ctx, index) {
              final _value = newList[index];
              return Slidable(
                key: Key(_value.id!),
                endActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  children: [
                    SlidableAction(
                      borderRadius: BorderRadius.circular(
                        15.0,
                      ),
                      flex: 2,
                      onPressed: (context) {
                        TransactionDb.instance.deleteTransaction(_value.id!);
                      },
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      icon: Icons.delete,
                      label: 'Delete',
                    ),
                    SlidableAction(
                      borderRadius: BorderRadius.circular(
                        15.0,
                      ),
                      onPressed: (context) => (context) {},
                      backgroundColor: const Color(
                        0xFF0392CF,
                      ),
                      foregroundColor: Colors.white,
                      icon: Icons.edit,
                      label: 'Edit',
                    ),
                  ],
                ),
                child: Card(
                  elevation: 10.0,
                  shadowColor: Colors.grey.withOpacity(
                    0.5,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      15.0,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Color.fromARGB(
                            255,
                            172,
                            160,
                            172,
                          ),
                          Color.fromARGB(
                            255,
                            162,
                            96,
                            160,
                          ),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(
                        12,
                      ),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: _value.type == CategoryType.income
                            ? Colors.green
                            : Colors.redAccent[700],
                        radius: 50,
                        child: Text(
                          parseDate(_value.date),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      title: Text(
                        '₹ ${_value.amount}',
                        style: const TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        _value.category.name,
                        style: const TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              );
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
    final _splitedDate = _date.split(' ');
    return '${_splitedDate.last}\n${_splitedDate.first}';
  }
}
