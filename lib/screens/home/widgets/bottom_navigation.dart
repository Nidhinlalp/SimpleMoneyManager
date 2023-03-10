import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:simplemoneymanager/screens/home/screen_home.dart';
import '../../../colors/colors.dart';

class MoneyManagerBottomNavigation extends StatefulWidget {
  const MoneyManagerBottomNavigation({super.key});

  @override
  State<MoneyManagerBottomNavigation> createState() =>
      _MoneyManagerBottomNavigationState();
}

class _MoneyManagerBottomNavigationState
    extends State<MoneyManagerBottomNavigation> {
  // var myindex = 0;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ScreenHome.selectedIndexNotifier,
      builder: (BuildContext context, int updatedIndex, Widget? _) {
        return SingleChildScrollView(
          child: CurvedNavigationBar(
            animationDuration: const Duration(
              milliseconds: 400,
            ),
            height: 60,
            color: Colors.blueGrey,
            backgroundColor: bgColor,
            buttonBackgroundColor: Colors.blueGrey,
            items: const [
              Icon(
                Icons.home_outlined,
                color: Colors.white,
              ),
              Icon(
                Icons.category_outlined,
                color: Colors.white,
              ),
              Icon(
                Icons.bar_chart_outlined,
                color: Colors.white,
              ),
            ],
            onTap: (index) {
              updatedIndex;
              ScreenHome.selectedIndexNotifier.value = index;
            },
          ),
        );
      },
    );
  }
}
