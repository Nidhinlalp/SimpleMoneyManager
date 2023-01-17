import 'package:flutter/material.dart';
import 'package:simplemoneymanager/screens/category/screen_category.dart';
import 'package:simplemoneymanager/screens/graph/screen_graph.dart';
import 'package:simplemoneymanager/screens/home/widgets/bottom_navigation.dart';
import 'package:simplemoneymanager/screens/hometransactions/screen_transaction.dart';

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
      bottomNavigationBar: const MoneyManagerBottomNavigation(),
      body: ValueListenableBuilder(
        valueListenable: selectedIndexNotifier,
        builder: (BuildContext context, int updatedIndex, _) {
          return _pages[updatedIndex];
        },
      ),
    );
  }
}
