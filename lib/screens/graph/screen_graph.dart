import 'package:flutter/material.dart';

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
        title: Center(
          child: Image.asset(
            'assets/images/money-transfer-2647242-2208355.png',
            fit: BoxFit.contain,
            height: 30,
          ),
        ),
        elevation: 0,
      ),
      backgroundColor: ColorConstants.kPrimaryColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, right: 60, bottom: 30),
              child: Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color.fromARGB(255, 49, 119, 172),
                      Color.fromARGB(77, 117, 167, 213),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                ),
                height: 40,
                width: 300,
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
                            "Week",
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
                color: const Color.fromARGB(250, 65, 153, 248),
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
          ],
        ),
      ),
    );
  }
}
