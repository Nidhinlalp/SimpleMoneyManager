import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:simplemoneymanager/screens/home/screen_home.dart';
import 'package:simplemoneymanager/screens/transactions/menu_bar.dart';

class Hompage extends StatefulWidget {
  const Hompage(BuildContext context, {super.key});

  @override
  State<Hompage> createState() => _HompageState();
}

class _HompageState extends State<Hompage> {
  @override
  Widget build(BuildContext context) => ZoomDrawer(
        style: DrawerStyle.Style1,
        menuScreen: const ManuPage(),
        mainScreen: ScreenHome(),
        borderRadius: 50,
        angle: 0.0,
        slideWidth: 240,
        //
      );
}
