import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simplemoneymanager/screens/Hometransactions/zoom_Drawa.dart';
import 'package:simplemoneymanager/welcome/intropages/onbord_screen.dart';

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
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool seen = (prefs.getBool('seen') ?? false);

      if (seen) {
        goHom();
      } else {
        goIntro();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(136, 20, 27, 38),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              SizedBox(
                height: 1,
              ),
              Text(
                'SIMPLE MONEY MANAGER',
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 7, 255, 255),
                  letterSpacing: 6,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 200,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  child: LinearProgressIndicator(
                    color: Color.fromARGB(255, 7, 255, 255),
                    backgroundColor: Colors.white,
                    minHeight: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
