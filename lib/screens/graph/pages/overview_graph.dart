import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:simplemoneymanager/colors/colors.dart';
import 'package:simplemoneymanager/db_functions/transaction/transaction_db.dart';
import 'package:simplemoneymanager/models/transaction/transaction_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

ValueNotifier<List<TransactionModel>> overviewGraphTransactions =
    ValueNotifier(TransactionDb.transactionListNotifire.value);

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
                            dataSource: allData,
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
