import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:simplemoneymanager/colors/colors.dart';
import 'package:simplemoneymanager/constants/notifier.dart';
import 'package:simplemoneymanager/screens/hometransactions/sortincomeandexpense/incomeandexpense.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class OverViewGraph extends StatefulWidget {
  const OverViewGraph({super.key});

  @override
  State<OverViewGraph> createState() => _OverViewGraphState();
}

class _OverViewGraphState extends State<OverViewGraph> {
  late TooltipBehavior _tooltipBehavior;
  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: ValueListenableBuilder(
          valueListenable: overviewGraphTransactions,
          builder: (context, allData, _) {
            Map incomeMap = {"name": "Income", "amount": incomtotel.value};
            Map expenseMap = {"name": "Expense", "amount": expensetotel.value};
            List<Map> dataList = [incomeMap, expenseMap];
            return allData.isEmpty
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
                        tooltipBehavior: _tooltipBehavior,
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
