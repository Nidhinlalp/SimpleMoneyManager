import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../colors/colors.dart';

class PraivacyPolicy extends StatefulWidget {
  const PraivacyPolicy({super.key});

  @override
  State<PraivacyPolicy> createState() => _AboutState();
}

class _AboutState extends State<PraivacyPolicy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Privacy Pollcy',
          textAlign: TextAlign.center,
          style: GoogleFonts.roboto(fontSize: 25, color: Colors.black),
        ),
      ),
      backgroundColor: bgColor,
      body: Center(
        child: FlipCard(
          direction: FlipDirection.VERTICAL,
          speed: 1000,
          onFlipDone: (status) {},
          front: Container(
            height: 400,
            width: 300,
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
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(30.0),
                      child: Text(
                        'PRIVACY POLLCY',
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Flexible(
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            'Our money manager app values your privacy and is committed to protecting your personal information. We only collect information that is necessary to provide you with the best possible service. We do not sell or share your information with third parties. Your data is secured using industry-standard measures. If you have any questions or concerns about your privacy, please contact us.',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text('Click here to Contact ',
                          style: Theme.of(context).textTheme.bodyText1),
                    ),
                  ],
                )
              ],
            ),
          ),
          back: Container(
            height: 300,
            width: 300,
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
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(30.0),
                      child: Text(
                        'SIMPLE MONEY MANAGER',
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        const url =
                            'https://www.linkedin.com/in/nidhinlal-p-02b87a236 ';
                        Uri uri = Uri.parse(url);

                        await launchUrl(uri);
                      },
                      child: Lottie.asset('assets/images/linkedin.json',
                          width: 30),
                    ),
                    GestureDetector(
                      onTap: () async {
                        const url = 'https://www.instagram.com/p/CkYfN57K8Mo/ ';
                        Uri uri = Uri.parse(url);

                        await launchUrl(uri);
                      },
                      child: Lottie.asset('assets/images/instagram.json',
                          width: 30),
                    ),
                    GestureDetector(
                      onTap: () async {
                        const url = 'https://mail.google.com/mail';
                        Uri uri = Uri.parse(url);

                        await launchUrl(uri);
                      },
                      child: Lottie.asset('assets/images/mail.json', width: 20),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Thank you !',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        'Click here to Back ',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
