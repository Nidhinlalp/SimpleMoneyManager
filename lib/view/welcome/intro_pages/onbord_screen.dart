import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simplemoneymanager/view_model/category/category_db.dart';
import 'package:simplemoneymanager/view_model/onbordingprovider.dart';
import 'package:simplemoneymanager/view_model/transaction/transaction_db.dart';
import 'package:simplemoneymanager/view/hometransactions/zoom_Drawa.dart';
import 'package:simplemoneymanager/view/welcome/intro_pages/indro_page_one.dart';
import 'package:simplemoneymanager/view/welcome/intro_pages/indro_page_tree.dart';
import 'package:simplemoneymanager/view/welcome/intro_pages/indro_page_two.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore: must_be_immutable
class OnbordScreen extends StatelessWidget {
  OnbordScreen({super.key});

  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          PageView(
              controller: controller,
              onPageChanged: (index) =>
                  context.read<OnBoardingProvider>().pageChanging(index),
              children: const [
                IntroPage1(),
                IntroPage2(),
                IntroPage3(),
              ]),
          Container(
            alignment: const Alignment(0, 0.75),
            child:
                Consumer<OnBoardingProvider>(builder: (context, value, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // skip
                  value.onLastPage
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
                  value.onLastPage
                      ? GestureDetector(
                          onTap: () async {
                            if (kIsWeb == false) {
                              // TransactionDb.instance.refresh();
                              context.read<TransactionDb>().refresh();
                              context.read<TransactionDb>().incomeandexpense(
                                  context
                                      .read<TransactionDb>()
                                      .transactionListNotifire);
                              context.read<TransactionDb>().incomeandexpense(
                                  context
                                      .read<TransactionDb>()
                                      .transactionListNotifire);
                              context.read<CategoryDb>().refreshUI();
                              // CategoryDb.instance.refreshUI();
                              context
                                      .read<TransactionDb>()
                                      .overviewGraphTransactions =
                                  context
                                      .read<TransactionDb>()
                                      .transactionListNotifire;
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
              );
            }),
          )
        ],
      ),
    );
  }
}
