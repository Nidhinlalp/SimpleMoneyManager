import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';
import 'package:simplemoneymanager/colors/colors.dart';

class IntroPage2 extends StatelessWidget {
  const IntroPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
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
                      padding: EdgeInsets.only(
                        left: 20,
                        right: 40,
                      ),
                      child: Text(
                        'DO NOT SAVE WHAT IS LEFT AFTER SPENDING, BUT SPEND WHAT IS LEFT AFTER SAVING',
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
            Lottie.asset(
              'assets/images/indroimage2.json',
              width: 400,
            ),
          ],
        ),
      ),
    );
  }
}
