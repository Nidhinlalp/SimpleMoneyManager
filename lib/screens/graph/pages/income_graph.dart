import 'package:flutter/material.dart';
import 'package:simplemoneymanager/colors/colors.dart';
import 'package:simplemoneymanager/db_functions/transaction/transaction_db.dart';
import 'package:simplemoneymanager/models/cetegory/cetegory_models.dart';
import 'package:simplemoneymanager/models/transaction/transaction_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class IncomGraph extends StatefulWidget {
  const IncomGraph({super.key});

  @override
  State<IncomGraph> createState() => _IncomGraphState();
}

class _IncomGraphState extends State<IncomGraph> {
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
          builder: (context, allIncomData, _) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SfCircularChart(
                  //   title: ChartTitle(text: 'Statistics'),
                  legend: Legend(
                      isVisible: true,
                      overflowMode: LegendItemOverflowMode.scroll,
                      alignment: ChartAlignment.center),
                  tooltipBehavior: _tooltipBehavior,
                  series: <CircularSeries>[
                    PieSeries<TransactionModel, String>(
                      dataSource: allIncomData
                          .where((element) =>
                              element.category.type == CategoryType.income)
                          .toList(),
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
