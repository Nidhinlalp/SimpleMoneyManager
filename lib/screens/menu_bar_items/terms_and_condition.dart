import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:animate_gradient/animate_gradient.dart';

class TemsAndCondition extends StatefulWidget {
  const TemsAndCondition({super.key});

  @override
  State<TemsAndCondition> createState() => _AboutState();
}

class _AboutState extends State<TemsAndCondition>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return AnimateGradient(
      primaryBegin: Alignment.topLeft,
      primaryEnd: Alignment.bottomLeft,
      secondaryBegin: Alignment.bottomLeft,
      secondaryEnd: Alignment.topRight,
      primaryColors: const [
        Color.fromARGB(
          255,
          90,
          10,
          86,
        ),
        Color.fromARGB(
          255,
          161,
          24,
          156,
        ),
        Color.fromARGB(
          255,
          172,
          160,
          172,
        ),
      ],
      secondaryColors: const [
        Color.fromARGB(
          255,
          172,
          160,
          172,
        ),
        Color.fromARGB(
          255,
          161,
          24,
          156,
        ),
        Color.fromARGB(
          255,
          161,
          24,
          156,
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  Color.fromARGB(
                    255,
                    76,
                    15,
                    74,
                  ),
                  Color.fromARGB(
                    255,
                    131,
                    21,
                    127,
                  ),
                ],
              ),
            ),
          ),
          title: const Text(
            'Terms and Conditions',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        body: Center(
          child: FlipCard(
            direction: FlipDirection.HORIZONTAL,
            speed: 1000,
            onFlipDone: (status) {},
            front: Container(
              height: 600.0,
              width: 300,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color.fromARGB(255, 225, 117, 220),
                    Color.fromARGB(255, 166, 132, 165),
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
                        child: Text('Click herte to Contact me ',
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
                    Color.fromARGB(255, 225, 117, 220),
                    Color.fromARGB(255, 166, 132, 165),
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
                        'Thanku',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          'Click herte to Back ',
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
