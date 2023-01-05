import 'package:animate_gradient/animate_gradient.dart';
import 'package:flutter/material.dart';
import 'package:simplemoneymanager/alldetails/expense_seeall.dart';
import 'package:simplemoneymanager/alldetails/income_seall.dart';
import 'package:simplemoneymanager/alldetails/overview_seeall.dart';

class SeeAllDetails extends StatefulWidget {
  const SeeAllDetails({super.key});

  @override
  State<SeeAllDetails> createState() => _SeeAllDetailsState();
}

class _SeeAllDetailsState extends State<SeeAllDetails>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(
      length: 3,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                  ),
                ),
              ],
              elevation: 0,
              backgroundColor: Colors.transparent,
              expandedHeight: 240,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text(
                  'My Transaction',
                ),
                background: Image.asset(
                  'assets/images/moneymanagement-icon-unscreen.gif',
                ),
              ),
              floating: true,
              snap: true,
              pinned: true,
            ),
            // Container(height: 90,color: Colors.black,)
          ],
          body: Column(
            children: [
              TabBar(
                // isScrollable: true,
                controller: _tabController,
                unselectedLabelColor: Colors.grey,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    50,
                  ),
                  color: const  Color.fromARGB(
                    255,
                    172,
                    160,
                    172,
                  ),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
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
                        Icons.filter_list_rounded,
                        size: 30,
                        shadows: <Shadow>[
                          Shadow(color: Colors.white, blurRadius: 15.0)
                        ],
                        color: Colors.white,
                      ),
                    ),
                    itemBuilder: (conext) => [
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
                  )
                ],
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                    OverViewSeeAll(),
                    IncomeSeeAll(),
                    ExpenseSeeAll(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
