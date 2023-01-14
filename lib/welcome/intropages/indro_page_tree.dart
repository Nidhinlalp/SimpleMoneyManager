import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

class IntroPage3 extends StatelessWidget {
  const IntroPage3({super.key});

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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Shimmer.fromColors(
                    baseColor: Colors.white30,
                    highlightColor: Colors.white,
                    child: const Padding(
                      padding: EdgeInsets.only(
                        left: 20,
                        right: 40,
                      ),
                      child: Text(
                        'NEVER SPEND YOUR MONEY BEFORE YOU HAVE EARNED IT !',
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
            const SizedBox(
              height: 0,
            ),
            // Column(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Padding(
            //       padding: const EdgeInsets.all(10.0),
            //       child: TextFormField(
            //         decoration: const InputDecoration(
            //           filled: true,
            //           prefixIcon: Icon(
            //             Icons.person,
            //             color: Colors.black,
            //           ),
            //           labelText: 'Enter your Name',
            //           floatingLabelStyle: TextStyle(
            //             color: Colors.black,
            //           ),
            //           border: OutlineInputBorder(),
            //           enabledBorder: OutlineInputBorder(
            //             borderSide: BorderSide(
            //               color: Colors.black,
            //             ),
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            Lottie.asset(
              'assets/images/indroimage3.json',
            ),
          ],
        ),
      ),
    );
  }
}
