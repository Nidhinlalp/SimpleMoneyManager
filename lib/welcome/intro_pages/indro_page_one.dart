import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';
import 'package:simplemoneymanager/colors/colors.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Shimmer.fromColors(
                  baseColor: Colors.blueGrey,
                  highlightColor: Colors.black,
                  child: const Padding(
                    padding: EdgeInsets.only(left: 50, right: 50, top: 150),
                    child: Text(
                      'MONEY WONT CREATE\nSUCCESS, THE FREEDOM TO MAKE IT WILL !',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 23.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Lottie.asset(
              'assets/images/indro1image.json',
            ),
          )
        ],
      ),
    );
  }
}
