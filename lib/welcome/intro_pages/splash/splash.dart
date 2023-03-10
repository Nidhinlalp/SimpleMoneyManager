import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simplemoneymanager/colors/colors.dart';
import 'package:simplemoneymanager/db_functions/transaction/transaction_db.dart';
import 'package:simplemoneymanager/screens/hometransactions/zoom_Drawa.dart';
import 'package:simplemoneymanager/welcome/intro_pages/onbord_screen.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void goHom() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Hompage(context)));
  }

  void goIntro() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const OnbordScreen()));
  }

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () async {
      bool seen;
      if (kIsWeb) {
        seen = false;
      } else {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        seen = (prefs.getBool('seen') ?? false);
      }

      if (seen) {
        await TransactionDb.instance.refresh();
        goHom();
      } else {
        await TransactionDb.instance.refresh();
        goIntro();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade500,
                        blurRadius: 15,
                        spreadRadius: 1,
                        offset: const Offset(5, 5),
                      ),
                      const BoxShadow(
                        color: Colors.white,
                        blurRadius: 15,
                        spreadRadius: 1,
                        offset: Offset(-5, -5),
                      ),
                    ],
                  ),
                  // ignore: prefer_const_constructors
                  child: Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: const Text(
                      'SIMPLE MONEY MANAGER',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 6,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
