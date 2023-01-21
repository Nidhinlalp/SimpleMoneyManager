import 'package:flutter/material.dart';
import 'package:simplemoneymanager/colors/colors.dart';
import 'package:simplemoneymanager/db_functions/transaction/transaction_db.dart';
import 'package:simplemoneymanager/models/transaction/transaction_model.dart';
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
          valueListenable: TransactionDb.transactionListNotifire,
          builder: (context, allData, _) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SfCircularChart(
                  //   title: ChartTitle(text: 'Statistics'),
                  legend: Legend(
                      isVisible: true,
                      overflowMode: LegendItemOverflowMode.wrap),
                  tooltipBehavior: _tooltipBehavior,
                  series: <CircularSeries>[
                    PieSeries<TransactionModel, String>(
                      dataSource: TransactionDb.transactionListNotifire.value,
                      xValueMapper: (TransactionModel data, _) =>
                          data.category.name,
                      yValueMapper: (TransactionModel data, _) => data.amount,
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
