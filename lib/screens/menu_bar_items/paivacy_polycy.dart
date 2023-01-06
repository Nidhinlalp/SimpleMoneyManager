import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:animate_gradient/animate_gradient.dart';
import 'package:google_fonts/google_fonts.dart';

class PraivacyPolicy extends StatefulWidget {
  const PraivacyPolicy({super.key});

  @override
  State<PraivacyPolicy> createState() => _AboutState();
}

class _AboutState extends State<PraivacyPolicy> with TickerProviderStateMixin {
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
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                   Color.fromARGB(255, 201, 122, 198),
                      Color.fromARGB(255, 221, 145, 254),
                ],
              ),
            ),
          ),
          title: Text(
            'Privacy Pollcy',
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(fontSize: 25, color: Colors.black),
          ),
        ),
        backgroundColor: Colors.transparent,
        body: Center(
          child: FlipCard(
            direction: FlipDirection.VERTICAL,
            speed: 1000,
            onFlipDone: (status) {},
            front: Container(
              height: 400,
              width: 300,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color.fromARGB(255, 195, 221, 236),
                    Color.fromARGB(255, 145, 187, 221),
                  ],
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    50,
                  ),
                  topRight: Radius.circular(
                    50,
                  ),
                  bottomLeft: Radius.circular(
                    50,
                  ),
                  bottomRight: Radius.circular(
                    50,
                  ),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(
                      255,
                      49,
                      44,
                      49,
                    ),
                    blurRadius: 20,
                    spreadRadius: 1,
                    offset: Offset.infinite,
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
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color.fromARGB(255, 195, 221, 236),
                    Color.fromARGB(255, 145, 187, 221),
                  ],
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    50,
                  ),
                  topRight: Radius.circular(
                    50,
                  ),
                  bottomLeft: Radius.circular(
                    50,
                  ),
                  bottomRight: Radius.circular(
                    50,
                  ),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(
                      255,
                      49,
                      44,
                      49,
                    ),
                    blurRadius: 20,
                    spreadRadius: 1,
                    offset: Offset.infinite,
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
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.picture_as_pdf,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.picture_as_pdf,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.picture_as_pdf,
                        ),
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
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
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
      ),
    );
  }
}
