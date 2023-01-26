import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simplemoneymanager/screens/hometransactions/zoom_Drawa.dart';
import 'package:simplemoneymanager/welcome/intro_pages/indro_page_one.dart';
import 'package:simplemoneymanager/welcome/intro_pages/indro_page_tree.dart';
import 'package:simplemoneymanager/welcome/intro_pages/indro_page_two.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnbordScreen extends StatefulWidget {
  const OnbordScreen({super.key});

  @override
  State<OnbordScreen> createState() => _OnbordScreenState();
}

class _OnbordScreenState extends State<OnbordScreen> {
  PageController controller = PageController();

  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                onLastPage
                    ? const Text('')
                    : GestureDetector(
                        onTap: () {
                          controller.jumpToPage(2);
                        },
                        child: const Text(
                          'Skip',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
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
                        onTap: () async {
                          if (kIsWeb == false) {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            prefs.setBool('seen', true);
                          }

                          // bool seen = (prefs.getBool('seen') ?? false);

                          // ignore: use_build_context_synchronously
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Hompage(context),
                              ),
                              (route) => false);
                        },
                        child: const Text(
                          'Start',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w900,
                              color: Colors.black),
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
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              color: Colors.black),
                        ),
                      ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
