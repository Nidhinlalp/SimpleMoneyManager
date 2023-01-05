import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:animate_gradient/animate_gradient.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> with TickerProviderStateMixin {
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
            'About',
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
            direction: FlipDirection.VERTICAL,
            speed: 1000,
            onFlipDone: (status) {
            },
            front: Container(
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'This is an app where you can add your \n daily transactions according to the \n category which it belongs to.',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text('Developed BY'),
                      Text(
                        'NIDHIN',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Click herte to Contact me ',
                          style: Theme.of(context).textTheme.bodyText1),
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
