import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class CurrentBalance extends StatelessWidget {
  const CurrentBalance({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 40,
              left: 20,
              right: 20,
            ),
            child: FlipCard(
              direction: FlipDirection.VERTICAL,
              speed: 1000,
              onFlipDone: (status) {},
              front: Container(
                height: 340,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white30, 
                  //         gradient: LinearGradient(
                  //           begin: Alignment.topRight,
                  //           end: Alignment.bottomLeft,
                  //           colors: [
                  //  Color.fromARGB(255, 223, 225, 226),
                  //            Color.fromARGB(255, 229, 227, 227),
                  //           ],
                  //         ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 49, 44, 49),
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
                            'CURRENT BALANCE',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        )
                      ],
                    ),
                    const Text(
                      '₹ 4800/-',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(
                        10.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          CircleAvatar(
                            child: Icon(
                              Icons.arrow_upward,
                              color: Colors.black,
                            ),
                            radius: 25,
                            backgroundColor: Colors.white30,
                          ),
                          CircleAvatar(
                            child: Icon(
                              Icons.arrow_downward,
                              color: Colors.black,
                            ),
                            radius: 25,
                            backgroundColor: Colors.white30,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 12,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          Text(
                            'Income',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            'Expense',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(
                        10.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          Text(
                            '₹ 50000',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 17,
                            ),
                          ),
                          Text(
                            '₹ 2000',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Click here to Somthing ',
                            style: Theme.of(context).textTheme.bodyText1),
                      ],
                    )
                  ],
                ),
              ),

              //Start the second flip

              back: Container(
                height: 340,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white30,
                  // gradient: LinearGradient(
                  //   begin: Alignment.topRight,
                  //   end: Alignment.bottomLeft,
                  //   colors: [
                  //     Color.fromARGB(255, 195, 221, 236),
                  //     Color.fromARGB(255, 145, 187, 221),
                  //   ],
                  // ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 49, 44, 49),
                      blurRadius: 20,
                      spreadRadius: 1,
                      offset: Offset.infinite,
                    ),
                  ],
                ),
                child: Column(
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.all(30.0),
                      child: Text(
                        'CURRENT BALANCE',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
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
            // child: Container(
            //   height: 340,
            //   width: double.infinity,
            //   decoration: const BoxDecoration(
            //     gradient: LinearGradient(
            //       begin: Alignment.topRight,
            //       end: Alignment.bottomLeft,
            //       colors: [
            //         Color.fromARGB(255, 49, 119, 172),
            //         Color.fromARGB(77, 117, 167, 213),
            //       ],
            //     ),
            //     borderRadius: BorderRadius.only(
            //       topLeft: Radius.circular(50),
            //       topRight: Radius.circular(50),
            //       bottomLeft: Radius.circular(50),
            //       bottomRight: Radius.circular(50),
            //     ),
            //     boxShadow: [
            //       BoxShadow(
            //         color: Color.fromARGB(255, 190, 115, 190),
            //         blurRadius: 20,
            //         spreadRadius: 1,
            //         offset: Offset.infinite,
            //       ),
            //     ],
            //   ),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     children: [
            //       const Padding(
            //         padding: EdgeInsets.only(
            //           top: 50,
            //           bottom: 30,
            //         ),
            //         child: Text(
            //           'CURRENT BALANCE',
            //           style: TextStyle(
            //             fontWeight: FontWeight.w500,
            //             color: Colors.black,
            //             fontSize: 20,
            //           ),
            //         ),
            //       ),
            //       const Text(
            //         '₹ 4800/-',
            //         style: TextStyle(
            //           fontWeight: FontWeight.w600,
            //           color: Colors.black,
            //           fontSize: 20,
            //         ),
            //       ),
            //       const SizedBox(
            //         height: 30,
            //       ),
            //       Padding(
            //         padding: const EdgeInsets.all(
            //           10.0,
            //         ),
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceAround,
            //           children: const [
            //             CircleAvatar(
            //               child: Icon(
            //                 Icons.arrow_upward,
            //                 color: Colors.black,
            //               ),
            //               radius: 25,
            //               backgroundColor: Colors.white30,
            //             ),
            //             CircleAvatar(
            //               child: Icon(
            //                 Icons.arrow_downward,
            //                 color: Colors.black,
            //               ),
            //               radius: 25,
            //               backgroundColor: Colors.white30,
            //             ),
            //           ],
            //         ),
            //       ),
            //       Padding(
            //         padding: const EdgeInsets.only(
            //           left: 12,
            //         ),
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceAround,
            //           children: const [
            //             Text(
            //               'Income',
            //               style: TextStyle(
            //                 fontWeight: FontWeight.w500,
            //                 color: Colors.black,
            //                 fontSize: 20,
            //               ),
            //             ),
            //             Text(
            //               'Expense',
            //               style: TextStyle(
            //                 fontWeight: FontWeight.w500,
            //                 color: Colors.black,
            //                 fontSize: 20,
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            //       Padding(
            //         padding: const EdgeInsets.all(
            //           10.0,
            //         ),
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceAround,
            //           children: const [
            //             Text(
            //               '₹ 50000',
            //               style: TextStyle(
            //                 fontWeight: FontWeight.w500,
            //                 color: Colors.black,
            //                 fontSize: 17,
            //               ),
            //             ),
            //             Text(
            //               '₹ 2000',
            //               style: TextStyle(
            //                 fontWeight: FontWeight.w500,
            //                 color: Colors.black,
            //                 fontSize: 17,
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ),
        ],
      ),
    );
  }
}
