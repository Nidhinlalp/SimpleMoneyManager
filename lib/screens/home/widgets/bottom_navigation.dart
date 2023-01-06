import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:simplemoneymanager/screens/home/screen_home.dart';

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
        return CurvedNavigationBar(
          animationDuration: const Duration(
            milliseconds: 300,
          ),
          height: 60,
          color: const Color.fromARGB(255, 201, 122, 198),
          backgroundColor: const Color.fromARGB(255, 236, 133, 232),
          buttonBackgroundColor: const Color.fromARGB(255, 214, 202, 214),
          items: const [
            Icon(
              Icons.home_outlined,
            ),
            Icon(
              Icons.category_outlined,
            ),
            Icon(
              Icons.bar_chart_outlined,
            ),
          ],
          onTap: (index) {
            updatedIndex;
            ScreenHome.selectedIndexNotifier.value = index;
          },
        );
      },
    );
  }
}
