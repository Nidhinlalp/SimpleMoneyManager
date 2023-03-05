import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:simplemoneymanager/view/home/screen_home.dart';
import 'package:simplemoneymanager/view/menu_bar_items/menu_bar.dart';

class Hompage extends StatelessWidget {
  const Hompage(BuildContext context, {super.key});

  @override
  Widget build(BuildContext context) => ZoomDrawer(
        style: DrawerStyle.Style1,
        menuScreen: const ManuPage(),
        mainScreen: ScreenHome(),
        borderRadius: 50,
        angle: 0.0,
        slideWidth: 240,
      );
}
