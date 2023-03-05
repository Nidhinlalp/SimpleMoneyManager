import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:simplemoneymanager/colors/colors.dart';
import 'package:simplemoneymanager/view_model/transaction/transaction_db.dart';
import 'package:simplemoneymanager/models/cetegory/cetegory_models.dart';
import 'package:simplemoneymanager/models/transaction/transaction_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class IncomGraph extends StatelessWidget {
  const IncomGraph({super.key});

//  late TooltipBehavior _tooltipBehavior;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Consumer<TransactionDb>(builder: (context, allData, _) {
        var allIncomData = allData.overviewGraphTransactions
            .where((element) => element.category.type == CategoryType.income)
            .toList();
        return allIncomData.isEmpty
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
                        overflowMode: LegendItemOverflowMode.scroll,
                        alignment: ChartAlignment.center),
                    // tooltipBehavior: _tooltipBehavior,
                    series: <CircularSeries>[
                      PieSeries<TransactionModel, String>(
                        dataSource: allIncomData,
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
