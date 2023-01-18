import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:simplemoneymanager/colors/colors.dart';
import 'package:simplemoneymanager/screens/hometransactions/sortincomeandexpense/incomeandexpense.dart';

class CurrentBalance extends StatelessWidget {
  const CurrentBalance({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
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
                  height: 335,
                  width: double.infinity,
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
                  //:::::::::::::::::::::::::::::::::strat the 1st flip::::::::::::::::::::::::::::::::::::::::::::::::
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: ValueListenableBuilder(
                                valueListenable: totalbalanse,
                                builder: (context, cerentbalanse, _) {
                                  return Text(
                                    totalbalanse.value < 0
                                        ? "Oops"
                                        : 'CURRENT BALANCE',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                      fontSize: 25,
                                      letterSpacing: 2.5,
                                    ),
                                  );
                                }),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ValueListenableBuilder(
                              valueListenable: totalbalanse,
                              builder: (context, cerentbalanse, _) {
                                return Text(
                                  '₹ ${totalbalanse.value}/-',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w900,
                                    color: Colors.black,
                                    fontSize: 40,
                                    letterSpacing: 1.5,
                                  ),
                                );
                              }),
                        ],
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
                              // ignore: sort_child_properties_last
                              child: Icon(
                                Icons.arrow_upward,
                                color: Colors.white38,
                                size: 36,
                              ),
                              radius: 30,
                              backgroundColor: Colors.blueGrey,
                            ),
                            CircleAvatar(
                              // ignore: sort_child_properties_last
                              child: Icon(
                                Icons.arrow_downward,
                                size: 36,
                                color: Colors.white38,
                              ),
                              radius: 30,
                              backgroundColor: Colors.blueGrey,
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
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                fontSize: 22,
                                letterSpacing: 1.5,
                              ),
                            ),
                            Text(
                              'Expense',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                fontSize: 22,
                                letterSpacing: 1.5,
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
                          children: [
                            ValueListenableBuilder(
                                valueListenable: incomtotel,
                                builder: (context, income, _) {
                                  return Text(
                                    '₹ ${incomtotel.value}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w900,
                                      color: Colors.black,
                                      fontSize: 24,
                                      letterSpacing: 1.5,
                                    ),
                                  );
                                }),
                            ValueListenableBuilder(
                                valueListenable: expensetotel,
                                builder: (context, expense, _) {
                                  return Text(
                                    '₹ ${expensetotel.value}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w900,
                                      color: Colors.black,
                                      fontSize: 24,
                                      letterSpacing: 1.5,
                                    ),
                                  );
                                }),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),

                //L::::::::::::::::::::::::::::::::Start the second flip:::::::::::::::::::::::::::::::::::::

                back: Container(
                  height: 320,
                  width: double.infinity,
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
            ),
          ],
        ),
      ),
    );
  }
}
