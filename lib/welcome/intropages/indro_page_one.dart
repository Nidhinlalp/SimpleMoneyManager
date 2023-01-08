import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Shimmer.fromColors(
                  baseColor: Colors.black,
                  highlightColor: Colors.white30,
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
            child: Lottie.network(
                'https://assets2.lottiefiles.com/packages/lf20_1pxqjqps.json',
                width: 400),
          )
        ],
      ),
    );
  }
}
