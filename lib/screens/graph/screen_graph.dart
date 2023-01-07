import 'package:animate_gradient/animate_gradient.dart';
import 'package:flutter/material.dart';

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
    return AnimateGradient(
      primaryBegin: Alignment.topLeft,
      primaryEnd: Alignment.bottomLeft,
      secondaryBegin: Alignment.bottomLeft,
      secondaryEnd: Alignment.topRight,
      primaryColors: const [
        Color.fromARGB(255, 52, 141, 214),
        Color.fromARGB(255, 255, 255, 255),
        Color.fromARGB(255, 52, 141, 214),
      ],
      secondaryColors: const [
        Color.fromARGB(255, 255, 255, 255),
        Color.fromARGB(255, 52, 141, 214),
        Color.fromARGB(255, 255, 255, 255),
      ],
      // child: Container(
      //   decoration: const BoxDecoration(
      //     gradient: LinearGradient(
      //       begin: Alignment.topRight,
      //       end: Alignment.bottomLeft,
      //       colors: [
      //         Color.fromARGB(
      //           255,
      //           131,
      //           21,
      //           127,
      //         ),
      //         Color.fromARGB(
      //           255,
      //           76,
      //           15,
      //           74,
      //         ),
      //       ],
      //     ),
      //   ),
      child: Scaffold(
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
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(
                  30.0,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color.fromARGB(255, 214, 202, 214),
                        Color.fromARGB(255, 236, 133, 232),
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
                  color: const Color.fromARGB(58, 104, 101, 101),
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
      ),
    );
  }
}
