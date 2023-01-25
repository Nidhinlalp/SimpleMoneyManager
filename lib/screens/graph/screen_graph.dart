import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:simplemoneymanager/db_functions/transaction/transaction_db.dart';
import 'package:simplemoneymanager/screens/graph/pages/expense_graph.dart';
import 'package:simplemoneymanager/screens/graph/pages/income_graph.dart';
import 'package:simplemoneymanager/screens/graph/pages/overview_graph.dart';
import 'package:simplemoneymanager/screens/menu_bar_items/menu_bar.dart';
import '../../colors/colors.dart';

class ScreenGraph extends StatefulWidget {
  const ScreenGraph({super.key});

  @override
  State<ScreenGraph> createState() => _ScreenGraphState();
}

class _ScreenGraphState extends State<ScreenGraph>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String dateFilterTitle = "All";

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 3,
      vsync: this,
    );
    overviewGraphTransactions.value =
        TransactionDb.transactionListNotifire.value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // actions: [
        //   // Row(
        //   //   crossAxisAlignment: CrossAxisAlignment.center,
        //   //   children: [
        //   //     Text(
        //   //       dateFilterTitle,
        //   //       style: const TextStyle(
        //   //         fontSize: 16,
        //   //         color: Colors.black,
        //   //         fontWeight: FontWeight.bold,
        //   //       ),
        //   //     ),
        //   //   ],
        //   // ),
        //   //:::::::::::::::::::filttaration of graph::::::::::::::::::::::::::::::::
        //   //   filtterationOfGraph(),
        // ],
        leading: const MenuBar(),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Container(
          height: 40,
          width: 50,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 15,
                spreadRadius: 1,
                offset: const Offset(5, 5),
              ),
              const BoxShadow(
                color: Colors.white60,
                blurRadius: 15,
                spreadRadius: 1,
                offset: Offset(-5, -5),
              ),
            ],
          ),
          child: Center(
            child: Image.asset(
              'assets/images/money-transfer-2647242-2208355.png',
              fit: BoxFit.contain,
              height: 30,
            ),
          ),
        ),
        elevation: 0,
      ),
      backgroundColor: bgColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, right: 10, bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: bgColor,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade500,
                          blurRadius: 15,
                          spreadRadius: 1,
                          offset: const Offset(5, 5),
                        ),
                        const BoxShadow(
                          color: Colors.white,
                          blurRadius: 15,
                          spreadRadius: 1,
                          offset: Offset(-5, -5),
                        ),
                      ],
                    ),
                    height: 40,
                    width: 350,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            dateFilterTitle,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          PopupMenuButton<int>(
                            shape: ContinuousRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                50,
                              ),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.only(
                                right: 30.0,
                              ),
                              child: Icon(
                                Icons.arrow_drop_down,
                              ),
                            ),
                            itemBuilder: (context) => [
                              PopupMenuItem(
                                value: 1,
                                child: const Text(
                                  "All",
                                ),
                                onTap: () {
                                  overviewGraphTransactions.value =
                                      TransactionDb
                                          .transactionListNotifire.value;
                                  setState(() {
                                    dateFilterTitle = "All";
                                  });
                                },
                              ),
                              PopupMenuItem(
                                value: 2,
                                child: const Text(
                                  "Today",
                                ),
                                onTap: () {
                                  overviewGraphTransactions.value =
                                      TransactionDb
                                          .transactionListNotifire.value;
                                  overviewGraphTransactions.value =
                                      overviewGraphTransactions.value
                                          .where((element) =>
                                              element.date.day ==
                                                  DateTime.now().day &&
                                              element.date.month ==
                                                  DateTime.now().month &&
                                              element.date.year ==
                                                  DateTime.now().year)
                                          .toList();
                                  setState(() {
                                    dateFilterTitle = "Today";
                                  });
                                },
                              ),
                              PopupMenuItem(
                                value: 2,
                                child: const Text(
                                  "Yesterday",
                                ),
                                onTap: () {
                                  overviewGraphTransactions.value =
                                      TransactionDb
                                          .transactionListNotifire.value;
                                  overviewGraphTransactions.value =
                                      overviewGraphTransactions.value
                                          .where((element) =>
                                              element.date.day ==
                                                  DateTime.now().day - 1 &&
                                              element.date.month ==
                                                  DateTime.now().month &&
                                              element.date.year ==
                                                  DateTime.now().year)
                                          .toList();
                                  setState(() {
                                    dateFilterTitle = "Yesterday";
                                  });
                                },
                              ),
                              PopupMenuItem(
                                value: 2,
                                child: const Text(
                                  "Month",
                                ),
                                onTap: () {
                                  overviewGraphTransactions.value =
                                      TransactionDb
                                          .transactionListNotifire.value;
                                  overviewGraphTransactions.value =
                                      overviewGraphTransactions.value
                                          .where((element) =>
                                              element.date.month ==
                                                  DateTime.now().month &&
                                              element.date.year ==
                                                  DateTime.now().year)
                                          .toList();
                                  setState(() {
                                    dateFilterTitle = "Month";
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            TabBar(
              controller: _tabController,
              unselectedLabelColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.label,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  50,
                ),
                color: Colors.blueGrey,
              ),
              tabs: [
                Tab(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        50,
                      ),
                    ),
                    child: const Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Overview",
                      ),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        50,
                      ),
                    ),
                    child: const Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Income",
                      ),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        50,
                      ),
                    ),
                    child: const Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Expense",
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  OverViewGraph(),
                  IncomGraph(),
                  ExpenseGraph(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  //:::::::::::::::::::filttaration of graph::::::::::::::::::::::::::::::::

  // PopupMenuButton<int> filtterationOfGraph() {
  //   return PopupMenuButton<int>(
  //     shape: ContinuousRectangleBorder(
  //       borderRadius: BorderRadius.circular(
  //         50,
  //       ),
  //     ),
  //     child: const Padding(
  //       padding: EdgeInsets.only(
  //         right: 10.0,
  //       ),
  //       child: Icon(
  //         Icons.filter_list_rounded,
  //         size: 30,
  //         shadows: <Shadow>[Shadow(color: Colors.white, blurRadius: 15.0)],
  //         color: Colors.black,
  //       ),
  //     ),
  //     itemBuilder: (context) => [
  //       PopupMenuItem(
  //         value: 1,
  //         child: const Text(
  //           "All",
  //         ),
  //         onTap: () {
  //           overviewGraphTransactions.value =
  //               TransactionDb.transactionListNotifire.value;
  //           setState(() {
  //             dateFilterTitle = "All";
  //           });
  //         },
  //       ),
  //       PopupMenuItem(
  //         value: 2,
  //         child: const Text(
  //           "Today",
  //         ),
  //         onTap: () {
  //           overviewGraphTransactions.value =
  //               TransactionDb.transactionListNotifire.value;
  //           overviewGraphTransactions.value = overviewGraphTransactions.value
  //               .where((element) =>
  //                   element.date.day == DateTime.now().day &&
  //                   element.date.month == DateTime.now().month &&
  //                   element.date.year == DateTime.now().year)
  //               .toList();
  //           setState(() {
  //             dateFilterTitle = "Today";
  //           });
  //         },
  //       ),
  //       PopupMenuItem(
  //         value: 2,
  //         child: const Text(
  //           "Yesterday",
  //         ),
  //         onTap: () {
  //           overviewGraphTransactions.value =
  //               TransactionDb.transactionListNotifire.value;
  //           overviewGraphTransactions.value = overviewGraphTransactions.value
  //               .where((element) =>
  //                   element.date.day == DateTime.now().day - 1 &&
  //                   element.date.month == DateTime.now().month &&
  //                   element.date.year == DateTime.now().year)
  //               .toList();
  //           setState(() {
  //             dateFilterTitle = "Yesterday";
  //           });
  //         },
  //       ),
  //       PopupMenuItem(
  //         value: 2,
  //         child: const Text(
  //           "Month",
  //         ),
  //         onTap: () {
  //           overviewGraphTransactions.value =
  //               TransactionDb.transactionListNotifire.value;
  //           overviewGraphTransactions.value = overviewGraphTransactions.value
  //               .where((element) =>
  //                   element.date.month == DateTime.now().month &&
  //                   element.date.year == DateTime.now().year)
  //               .toList();
  //           setState(() {
  //             dateFilterTitle = "Month";
  //           });
  //         },
  //       ),
  //     ],
  //   );
  // }
}
