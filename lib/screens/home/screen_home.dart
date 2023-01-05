import 'package:flutter/material.dart';
import 'package:simplemoneymanager/screens/category/screen_category.dart';
import 'package:simplemoneymanager/screens/graph/screen_graph.dart';
import 'package:simplemoneymanager/screens/home/widgets/bottom_navigation.dart';
import 'package:simplemoneymanager/screens/transactions/menu_bar.dart';
import 'package:simplemoneymanager/screens/transactions/screen_transaction.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({super.key});

  static ValueNotifier<int> selectedIndexNotifier = ValueNotifier(0);

  final _pages = [
    const ScreenTransaction(),
    const ScreenCategory(),
    const ScreenGraph(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Image.asset(
            'assets/images/money-transfer-2647242-2208355.png',
            fit: BoxFit.contain,
            height: 30,
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                Color.fromARGB(
                  255,
                  162,
                  96,
                  160,
                ),
                Color.fromARGB(255, 136, 39, 133),
              ],
            ),
          ),
        ),
        leading: const MenuBar(),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
            ),
          ),
        ],
        elevation: 0,
      ),
      bottomNavigationBar: const MoneyManagerBottomNavigation(),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: selectedIndexNotifier,
          builder: (
            BuildContext context,
            int updatedIndex,
            _,
          ) {
            return _pages[updatedIndex];
          },
        ),
      ),
    );
  }
}
