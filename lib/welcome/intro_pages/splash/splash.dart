import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simplemoneymanager/colors/colors.dart';
import 'package:simplemoneymanager/db_functions/transaction/transaction_db.dart';
import 'package:simplemoneymanager/screens/hometransactions/sortincomeandexpense/incomeandexpense.dart';
import 'package:simplemoneymanager/screens/hometransactions/zoom_Drawa.dart';
import 'package:simplemoneymanager/welcome/intro_pages/onbord_screen.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class Splash extends StatelessWidget {
  const Splash({super.key});

  // @override
  @override
  Widget build(BuildContext context) {
    void goHom() {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => Hompage(context)));
    }

    void goIntro() {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => OnbordScreen()));
    }

    Timer(const Duration(seconds: 2), () async {
      bool seen;
      if (kIsWeb) {
        seen = false;
      } else {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        seen = (prefs.getBool('seen') ?? false);
      }

      if (seen) {
        await context.read<TransactionDb>().refresh();
        context.read<TransactionDb>().incomeandexpense(
            context.read<TransactionDb>().transactionListNotifire);
        goHom();
      } else {
        await context.read<TransactionDb>().refresh();
        context.read<TransactionDb>().incomeandexpense(
            context.read<TransactionDb>().transactionListNotifire);
        goIntro();
      }
    });
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
