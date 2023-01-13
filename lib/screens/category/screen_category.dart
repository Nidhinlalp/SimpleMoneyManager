import 'package:flutter/material.dart';
import 'package:simplemoneymanager/db_functions/category/category_db.dart';
import 'package:simplemoneymanager/screens/category/category_add_popup.dart';
import 'package:simplemoneymanager/screens/category/expense_category_list.dart';
import 'package:simplemoneymanager/screens/category/income_category_list.dart';

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
        centerTitle: true,
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
            const SizedBox(
              height: 6,
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //  print('ia, category');
          showCategoryAddPopup(context);
          
        },
        // ignore: sort_child_properties_last
        child: const Icon(
          Icons.add,
        ),
        foregroundColor: const Color.fromARGB(255, 10, 10, 10),
        splashColor: const Color.fromARGB(255, 245, 245, 245),
      ),
    );
  }
}
