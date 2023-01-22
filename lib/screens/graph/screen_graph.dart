import 'package:flutter/material.dart';
import 'package:simplemoneymanager/screens/graph/pages/expense_graph.dart';
import 'package:simplemoneymanager/screens/graph/pages/income_graph.dart';
import 'package:simplemoneymanager/screens/graph/pages/overview_graph.dart';

import '../../colors/colors.dart';

class ScreenGraph extends StatefulWidget {
  const ScreenGraph({super.key});

  @override
  State<ScreenGraph> createState() => _ScreenGraphState();
}

class _ScreenGraphState extends State<ScreenGraph>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 3,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              padding: const EdgeInsets.only(top: 30, right: 10, bottom: 30),
              child: Container(
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
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'All',
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
                        const PopupMenuItem(
                          value: 1,
                          child: Text(
                            "All",
                          ),
                        ),
                        const PopupMenuItem(
                          value: 2,
                          child: Text(
                            "Today",
                          ),
                        ),
                        const PopupMenuItem(
                          value: 2,
                          child: Text(
                            "Yesterday",
                          ),
                        ),
                        const PopupMenuItem(
                          value: 2,
                          child: Text(
                            "Month",
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
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
}
