import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:simplemoneymanager/colors/colors.dart';
import 'package:simplemoneymanager/db_functions/transaction/transaction_db.dart';
import 'package:simplemoneymanager/models/cetegory/cetegory_models.dart';
import 'package:simplemoneymanager/models/transaction/transaction_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ExpenseGraph extends StatefulWidget {
  const ExpenseGraph({super.key});

  @override
  State<ExpenseGraph> createState() => _ExpenseGraphState();
}

class _ExpenseGraphState extends State<ExpenseGraph> {
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
          builder: (context, allExpenceData, _) {
            return allExpenceData.isEmpty
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
                              color: Colors.black,
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
                          PieSeries<TransactionModel, String>(
                            dataSource: allExpenceData
                                .where((element) =>
                                    element.category.type ==
                                    CategoryType.expense)
                                .toList(),
                            xValueMapper: (TransactionModel data, _) =>
                                data.category.name,
                            yValueMapper: (TransactionModel data, _) =>
                                data.amount,
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
