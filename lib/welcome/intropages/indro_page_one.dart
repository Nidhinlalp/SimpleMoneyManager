import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: const [
                Text(
                  '"MONEY WONT CREATE\n SUCCESS, THE FREEDOM TO\n MAKE IT WILL"',
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Lottie.network(
              'https://assets2.lottiefiles.com/packages/lf20_1pxqjqps.json',width: 400
            )
          ],
        ),
      ),
    );
  }
}
