import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

import 'bar_chart_model.dart';

class MonthPage extends StatefulWidget {
  MonthPage({Key? key}) : super(key: key);

  @override
  State<MonthPage> createState() => _MonthPageState();
}

class _MonthPageState extends State<MonthPage>
    with TickerProviderStateMixin {
  final List<BarChartModelMonth> data = [
    BarChartModelMonth(
      deta: "Week One",
      financial: 20,
      color: charts.ColorUtil.fromDartColor(
          const Color.fromARGB(255, 142, 184, 204)),
    ),
    BarChartModelMonth(
      deta: "Week Two",
      financial: 30,
      color: charts.ColorUtil.fromDartColor(
          const Color.fromARGB(255, 172, 49, 40)),
    ),
    BarChartModelMonth(
      deta: "Week Three",
      financial: 10,
      color: charts.ColorUtil.fromDartColor(
          const Color.fromARGB(255, 142, 184, 204)),
    ),
     BarChartModelMonth(
      deta: "Week Four",
      financial: 14,
      color: charts.ColorUtil.fromDartColor(
          const Color.fromARGB(255, 142, 184, 204)),
    ),
    
  ];

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(
      length: 3,
      vsync: this,
    );
    List<charts.Series<BarChartModelMonth, String>> series = [
      charts.Series(
        id: "financial",
        data: data,
        domainFn: (BarChartModelMonth series, _) => series.deta,
        measureFn: (BarChartModelMonth series, _) => series.financial,
        colorFn: (BarChartModelMonth series, _) => series.color,
      ),
    ];

    return Scaffold(
      
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
        child: charts.BarChart(
          series,
          animate: true,
        ),
      ),
    );
  }
}
