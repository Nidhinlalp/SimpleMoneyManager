import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:simplemoneymanager/colors/colors.dart';
import 'package:simplemoneymanager/db_functions/transaction/transaction_db.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class OverViewGraph extends StatelessWidget {
  const OverViewGraph({super.key});

  //late TooltipBehavior _tooltipBehavior;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Consumer<TransactionDb>(builder: (context, allData, _) {
        Map incomeMap = {
          "name": "Income",
          "amount": context.read<TransactionDb>().incomtotel
        };
        Map expenseMap = {
          "name": "Expense",
          "amount": context.read<TransactionDb>().expensetotel
        };
        List<Map> dataList = [incomeMap, expenseMap];
        return allData.overviewGraphTransactions.isEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset('assets/images/emptygraph.json'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'No Data !',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black26,
                          fontSize: 22,
                          letterSpacing: 1.5,
                        ),
                      )
                    ],
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SfCircularChart(
                    //   title: ChartTitle(text: 'Statistics'),
                    legend: Legend(
                        isVisible: true,
                        overflowMode: LegendItemOverflowMode.scroll),
                    //    tooltipBehavior: _tooltipBehavior,
                    series: <CircularSeries>[
                      PieSeries<Map, String>(
                        dataSource: dataList,
                        xValueMapper: (Map data, _) => data['name'],
                        yValueMapper: (Map data, _) => data['amount'],
                        enableTooltip: true,
                        dataLabelSettings:
                            const DataLabelSettings(isVisible: true),
                      )
                    ],
                  ),
                ],
              );
      }),
    );
  }
}
