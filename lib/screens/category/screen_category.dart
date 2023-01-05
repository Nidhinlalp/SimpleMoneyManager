import 'package:animate_gradient/animate_gradient.dart';
import 'package:flutter/material.dart';
import 'package:simplemoneymanager/db_functions/category/category_db.dart';
import 'package:simplemoneymanager/screens/category/category_add_popup.dart';
import 'package:simplemoneymanager/screens/category/expense_category_list.dart';
import 'package:simplemoneymanager/screens/category/income_category_list.dart';

class ScreenCategory extends StatefulWidget {
  const ScreenCategory({super.key});

  @override
  State<ScreenCategory> createState() => _ScreenCategoryState();
}

class _ScreenCategoryState extends State<ScreenCategory>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
    CategoryDb().refreshUI();
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
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            TabBar(
              controller: _tabController,
              unselectedLabelColor: Colors.grey,
              indicatorSize: TabBarIndicatorSize.label,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  50,
                ),
                color: const Color.fromARGB(
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
                        "INCOME",
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
                        "EXPENSE",
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
                  IncomeCategoryList(),
                  ExpenseCategoyList(),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            //  print('ia, category');
            showCategoryAddPopup(context);
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
  }
}
