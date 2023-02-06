import 'package:flutter/material.dart';
import 'package:simplemoneymanager/db_functions/category/category_db.dart';
import 'package:simplemoneymanager/constants/notifier.dart';
import 'package:simplemoneymanager/models/cetegory/cetegory_models.dart';
import 'package:simplemoneymanager/screens/category/category_add_popup.dart';
import 'package:simplemoneymanager/screens/category/expense_category_list.dart';
import 'package:simplemoneymanager/screens/category/income_category_list.dart';
import 'package:simplemoneymanager/screens/menu_bar_items/menu_bar.dart';

import '../../colors/colors.dart';

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
    return Scaffold(
      appBar: AppBar(
        leading: const MenuBar(),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
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
            const SizedBox(
              height: 20,
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
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(50),
          boxShadow: const [
            BoxShadow(
              color: Colors.blueGrey,
              blurRadius: 15,
              spreadRadius: 1,
              offset: Offset(5, 5),
            ),
            BoxShadow(
              color: Colors.white,
              blurRadius: 15,
              spreadRadius: 1,
              offset: Offset(-5, -5),
            ),
          ],
        ),
        child: FloatingActionButton(
          onPressed: () {
            showCategoryAddPopup(
              context,
              true,
              _tabController.index == 0
                  ? CategoryType.income
                  : CategoryType.expense,
            );
            // showCategoryAddPopup(
            //     context,
            //     false,
            //     _tabController.index == 0
            //         ? CategoryType.income
            //         : CategoryType.expense);
          },
          // ignore: sort_child_properties_last
          child: const Icon(
            Icons.add,
            size: 30,
          ),
          foregroundColor: const Color.fromARGB(255, 10, 10, 10),
          splashColor: const Color.fromARGB(255, 245, 245, 245),
          backgroundColor: bgColor,
        ),
      ),
    );
  }
}
