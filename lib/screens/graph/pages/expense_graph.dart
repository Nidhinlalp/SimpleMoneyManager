import 'package:flutter/material.dart';
import 'package:simplemoneymanager/colors/colors.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ExpenseGraph extends StatefulWidget {
  const ExpenseGraph({super.key});

  @override
  State<ExpenseGraph> createState() => _ExpenseGraphState();
}

class _ExpenseGraphState extends State<ExpenseGraph> {
  late List<gdpdata> _chartdata;
  late TooltipBehavior _tooltipBehavior;
  @override
  void initState() {
    _chartdata = getchartdata();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SfCircularChart(
            //   title: ChartTitle(text: 'Statistics'),
            // legend: Legend(
            //     isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
            tooltipBehavior: _tooltipBehavior,
            series: <CircularSeries>[
              PieSeries<gdpdata, String>(
                dataSource: _chartdata,
                xValueMapper: (gdpdata data, _) => data.continent,
                yValueMapper: (gdpdata data, _) => data.gdp,
                enableTooltip: true,
                dataLabelSettings: const DataLabelSettings(isVisible: true),
              )
            ],
          ),
        ],
      ),
    );
  }

  List<gdpdata> getchartdata() {
    final List<gdpdata> chartdata = [
      gdpdata('india', 200),
      gdpdata('africa', 50),
      gdpdata('jammu', 100),
      gdpdata('ui', 500),
      gdpdata('ui', 500),
    ];
    return chartdata;
  }
}

class gdpdata {
  gdpdata(this.continent, this.gdp);
  final String continent;
  final int gdp;
}
