import 'package:auto_size_text/auto_size_text.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:simplemoneymanager/colors/colors.dart';
import 'package:simplemoneymanager/view_model/transaction/transaction_db.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CurrentBalance extends StatelessWidget {
  const CurrentBalance({
    Key? key,
  }) : super(key: key);

  //late TooltipBehavior _tooltipBehavior;

  // @override
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) =>
        context.read<TransactionDb>().overviewGraphTransactions =
            context.read<TransactionDb>().transactionListNotifire);
    return SingleChildScrollView(
      child: SizedBox(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
                left: 25,
                right: 25,
              ),
              child: FlipCard(
                direction: FlipDirection.VERTICAL,
                speed: 800,
                onFlipDone: (status) {},
                front: Container(
                  // height: 340,
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
                  child:
                      Consumer<TransactionDb>(builder: (context, value, child) {
                    return Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: Text(
                                value.totalbalanse < 0
                                    ? "LOSS"
                                    : 'CURRENT BALANCE',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                  fontSize: 25,
                                  letterSpacing: 1.5,
                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [totelbalance(value)],
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
                              AutoSizeText(
                                maxLines: 2,
                                '₹${value.incomtotel}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black,
                                  fontSize: 24,
                                  letterSpacing: 0.8,
                                ),
                              ),
                              AutoSizeText(
                                maxLines: 3,
                                '₹${value.expensetotel}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black,
                                  fontSize: 24,
                                  letterSpacing: 0.8,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    );
                  }),
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
                  child:
                      Consumer<TransactionDb>(builder: (context, allData, _) {
                    Map incomeMap = {
                      "name": "Income",
                      "amount": context.read<TransactionDb>().incomtotel
                    };
                    Map expenseMap = {
                      "name": "Expence",
                      "amount": context.read<TransactionDb>().expensetotel
                    };
                    List<Map> dataList = [incomeMap, expenseMap];
                    return Column(
                      children: [
                        allData.overviewGraphTransactions.isEmpty
                            ? Column(
                                children: [
                                  Center(
                                    child: Lottie.asset(
                                        'assets/images/emptygraph.json'),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text(
                                        'No Data !',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                          fontSize: 22,
                                          letterSpacing: 1.5,
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 60,
                                  )
                                ],
                              )
                            : Column(
                                children: <Widget>[
                                  SfCircularChart(
                                    title: ChartTitle(text: 'Statistics'),
                                    legend: Legend(
                                        isVisible: true,
                                        overflowMode:
                                            LegendItemOverflowMode.scroll),
                                    //tooltipBehavior: _tooltipBehavior,
                                    series: <CircularSeries>[
                                      DoughnutSeries<Map, String>(
                                        dataSource: dataList,
                                        xValueMapper: (Map data, _) =>
                                            data['name'],
                                        yValueMapper: (Map data, _) =>
                                            data['amount'],
                                        enableTooltip: true,
                                        dataLabelSettings:
                                            const DataLabelSettings(
                                                isVisible: true),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Click here to Back ',
                              style: Theme.of(context).textTheme.bodyText1,
                            )
                          ],
                        ),
                      ],
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget totelbalance(TransactionDb value) {
    var tBalance = value.totalbalanse;
    tBalance = tBalance < 0 ? tBalance * -1 : tBalance;

    return AutoSizeText(
      '₹ $tBalance/-',
      style: const TextStyle(
        fontWeight: FontWeight.w900,
        color: Colors.black,
        fontSize: 40,
        letterSpacing: 1.5,
      ),
    );
  }
}
