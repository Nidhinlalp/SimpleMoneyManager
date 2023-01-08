import 'package:animate_gradient/animate_gradient.dart';
import 'package:flutter/material.dart';
import 'package:simplemoneymanager/screens/transactions/zoom_Drawa.dart';
import 'package:simplemoneymanager/welcome/intropages/indro_page_one.dart';
import 'package:simplemoneymanager/welcome/intropages/indro_page_tree.dart';
import 'package:simplemoneymanager/welcome/intropages/indro_page_two.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnbordScreen extends StatefulWidget {
  const OnbordScreen({super.key});

  @override
  State<OnbordScreen> createState() => _OnbordScreenState();
}

class _OnbordScreenState extends State<OnbordScreen> with TickerProviderStateMixin{
  PageController controller = PageController();

  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return AnimateGradient(
      primaryBegin: Alignment.topLeft,
      primaryEnd: Alignment.bottomLeft,
      secondaryBegin: Alignment.bottomLeft,
      secondaryEnd: Alignment.topRight,
      primaryColors: const [
        Color.fromARGB(255, 52, 141, 214),
        Color.fromARGB(255, 255, 255, 255),
        Color.fromARGB(255, 52, 141, 214),
      ],
      secondaryColors: const [
        Color.fromARGB(255, 255, 255, 255),
        Color.fromARGB(255, 52, 141, 214),
        Color.fromARGB(255, 255, 255, 255),
      ],
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            PageView(
                controller: controller,
                onPageChanged: (index) => setState(() {
                      onLastPage = (index == 2);
                    }),
                children: const [
                  IntroPage1(),
                  IntroPage2(),
                  IntroPage3(),
                ]),
            Container(
              alignment: const Alignment(0, 0.75),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // skip

                  GestureDetector(
                    onTap: () {
                      controller.jumpToPage(2);
                    },
                    child: const Text(
                      'Skip',
                    ),
                  ),

                  SmoothPageIndicator(
                    controller: controller,
                    count: 3,
                    onDotClicked: ((index) => controller.animateToPage(index,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn)),
                  ),

                  //Continue
                  onLastPage
                      ? GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Hompage(context)),
                            );
                          },
                          child: const Text(
                            'Start',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            controller.nextPage(
                                duration: const Duration(milliseconds: 505),
                                curve: Curves.easeIn);
                          },
                          child: const Text(
                            'Next',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                        ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
