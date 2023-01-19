import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../colors/colors.dart';

class TemsAndCondition extends StatefulWidget {
  const TemsAndCondition({super.key});

  @override
  State<TemsAndCondition> createState() => _AboutState();
}

class _AboutState extends State<TemsAndCondition> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Terms and Conditions',
          textAlign: TextAlign.center,
          style: GoogleFonts.roboto(fontSize: 25, color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: bgColor,
      body: Center(
        child: FlipCard(
          direction: FlipDirection.HORIZONTAL,
          speed: 1000,
          onFlipDone: (status) {},
          front: Container(
            height: 600.0,
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
                        'TERMS AND CONDITIONS',
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
                            'By using our money management app, you agree to our terms and conditions. This includes our fee schedule, which outlines any charges associated with using the app. You are responsible for any transactions made through the app and agree to promptly report any errors or unauthorized access to your account. Our privacy policy outlines how we collect and use your personal information, and you agree to the collection and use of your data in accordance with the policy. We are not liable for any errors or unauthorized access to your account, and you agree to indemnify and hold us harmless for any damages resulting from such errors or unauthorized access. These terms and conditions are subject to change at any time, and it is your responsibility to stay informed of any updates',
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
                      child: Text('Click here to Contact  ',
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
