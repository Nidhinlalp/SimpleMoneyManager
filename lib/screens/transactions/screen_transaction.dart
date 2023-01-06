import 'package:animate_gradient/animate_gradient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:simplemoneymanager/alldetails/seeall_details.dart';
import 'package:simplemoneymanager/db_functions/category/category_db.dart';
import 'package:simplemoneymanager/db_functions/transaction/transaction_db.dart';
import 'package:simplemoneymanager/models/cetegory/cetegory_models.dart';
import 'package:simplemoneymanager/models/transaction/transaction_model.dart';

import '../add_transaction/screen_add_transaction.dart';

class ScreenTransaction extends StatelessWidget {
  const ScreenTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    TransactionDb.instance.refresh;
    CategoryDb.instance.refreshUI();
    return ValueListenableBuilder(
      valueListenable: TransactionDb.instance.transactionListNotifire,
      builder: (BuildContext ctx, List<TransactionModel> newList, Widget? _) {
        return AnimateGradient(
          primaryBegin: Alignment.topLeft,
          primaryEnd: Alignment.bottomLeft,
          secondaryBegin: Alignment.bottomLeft,
          secondaryEnd: Alignment.topRight,
          primaryColors: const [
            Color.fromARGB(
              255,
              90,
              10,
              86,
            ),
            Color.fromARGB(
              255,
              161,
              24,
              156,
            ),
            Color.fromARGB(
              255,
              172,
              160,
              172,
            ),
          ],
          secondaryColors: const [
            Color.fromARGB(
              255,
              172,
              160,
              172,
            ),
            Color.fromARGB(
              255,
              161,
              24,
              156,
            ),
            Color.fromARGB(
              255,
              161,
              24,
              156,
            ),
          ],
          // child: Container(
          //   decoration: const BoxDecoration(
          //     gradient: LinearGradient(
          //       begin: Alignment.topRight,
          //       end: Alignment.bottomLeft,
          //       colors: [
          //         Color.fromARGB(255, 131, 21, 127),
          //         Color.fromARGB(255, 76, 15, 74),
          //       ],
          //     ),
          //   ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              children: [
                SizedBox(
                  height: 410,
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 40,
                              left: 20,
                              right: 20,
                            ),
                            child: Container(
                              height: 340,
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                color: Colors.white30,
                                // gradient: LinearGradient(
                                //   begin: Alignment.topRight,
                                //   end: Alignment.bottomLeft,
                                //   colors: [
                                //     Colors.white30,
                                //     Color.fromARGB(255, 200, 173, 220),
                                //   ],
                                // ),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(
                                    50,
                                  ),
                                  topRight: Radius.circular(
                                    50,
                                  ),
                                  bottomLeft: Radius.circular(
                                    50,
                                  ),
                                  bottomRight: Radius.circular(
                                    50,
                                  ),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 190, 115, 190),
                                    blurRadius: 20,
                                    spreadRadius: 1,
                                    offset: Offset.infinite,
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(
                                      top: 50,
                                      bottom: 30,
                                    ),
                                    child: Text(
                                      'CURRENT BALANCE',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    '₹ 4800/-',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                      fontSize: 20,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(
                                      10.0,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: const [
                                        CircleAvatar(child: Icon(Icons.arrow_downward,color: Colors.black,),
                                          radius: 25,
                                          backgroundColor: Colors.white30,
                                          
                                          // child: CircleAvatar(
                                          //   backgroundImage: AssetImage(
                                          //     'assets/images/percent-down-line-icon-percentage-260nw-1075668071.webp',
                                          //   ),
                                          //   radius: 25,
                                          // ),
                                        ),
                                       CircleAvatar(child: Icon(Icons.arrow_upward,color: Colors.black,),
                                          radius: 25,
                                          backgroundColor: Colors.white30,
                                          
                                          // child: CircleAvatar(
                                          //   backgroundImage: AssetImage(
                                          //     'assets/images/percent-down-line-icon-percentage-260nw-1075668071.webp',
                                          //   ),
                                          //   radius: 25,
                                          // ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 12,
                                    ),
                                    child: Expanded(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: const [
                                          Text(
                                            'Income',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black,
                                              fontSize: 20,
                                            ),
                                          ),
                                          Text(
                                            'Expense',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(
                                      10.0,
                                    ),
                                    child: Expanded(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: const [
                                          Text(
                                            '₹ 50000',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black,
                                              fontSize: 17,
                                            ),
                                          ),
                                          Text(
                                            '₹ 2000',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black,
                                              fontSize: 17,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        top: 350,
                        left: 70,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SeeAllDetails(),
                              ),
                            );
                          },
                          child: Card(
                            color: Color.fromARGB(255, 208, 204, 204),
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                50.0,
                              ),
                            ),
                            child: const SizedBox(
                              height: 50,
                              width: 250,
                              child: Center(
                                child: Text(
                                  'See all details',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(
                                      255,
                                      84,
                                      87,
                                      86,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      // resent transaction
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.all(
                      20.0,
                    ),
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
                                TransactionDb.instance
                                    .deleteTransaction(_value.id!);
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
                                backgroundColor:
                                    _value.type == CategoryType.income
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
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                _value.category.name,
                                style: const TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (ctx, index) {
                      return const SizedBox(
                        height: 30,
                      );
                    },
                    itemCount: newList.length,
                  ),
                )
              ],
            ),

            //flotting action button

            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ScreenAddTransaction()),
                );
              },
              // ignore: sort_child_properties_last
              child: const Icon(
                Icons.add,
              ),
              backgroundColor: const Color.fromARGB(
                255,
                162,
                96,
                160,
              ),
              foregroundColor: const Color.fromARGB(
                255,
                10,
                10,
                10,
              ),
              splashColor: const Color.fromARGB(
                255,
                245,
                245,
                245,
              ),
            ),
          ),
        );
      },
    );
  }
}

String parseDate(DateTime date) {
  final _date = DateFormat.MMMd().format(date);
  final _splitedDate = _date.split(' ');
  return '${_splitedDate.last}\n${_splitedDate.first}';
}
