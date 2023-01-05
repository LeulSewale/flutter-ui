import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

import 'bar_chart_model.dart';

class DayPage extends StatefulWidget {
  DayPage({Key? key}) : super(key: key);

  @override
  State<DayPage> createState() => _DayPageState();
}

class _DayPageState extends State<DayPage>
    with TickerProviderStateMixin {
  final List<BarChartModelDayl> data = [
    BarChartModelDayl(
      deta: "1h",
      financial: 20,
      color: charts.ColorUtil.fromDartColor(
          const Color.fromARGB(255, 142, 184, 204)),
    ),
    BarChartModelDayl(
      deta: "4h",
      financial: 30,
      color: charts.ColorUtil.fromDartColor(
          const Color.fromARGB(255, 172, 49, 40)),
    ),
    BarChartModelDayl(
      deta: "7h",
      financial: 10,
      color: charts.ColorUtil.fromDartColor(
          const Color.fromARGB(255, 142, 184, 204)),
    ),
    BarChartModelDayl(
      deta: "10h",
      financial: 40,
      color: charts.ColorUtil.fromDartColor(
          const Color.fromARGB(255, 172, 49, 40)),
    ),
    BarChartModelDayl(
      deta: "13h",
      financial: 15,
      color: charts.ColorUtil.fromDartColor(Color.fromARGB(255, 116, 162, 184)),
    ),
    BarChartModelDayl(
      deta: "16h",
      financial: 30,
      color: charts.ColorUtil.fromDartColor(
          const Color.fromARGB(255, 172, 49, 40)),
    ),
    BarChartModelDayl(
      deta: "19h",
      financial: 43,
      color: charts.ColorUtil.fromDartColor(
          const Color.fromARGB(255, 172, 49, 40)),
    ),
     BarChartModelDayl(
      deta: "23h",
      financial: 3,
        color: charts.ColorUtil.fromDartColor(Color.fromARGB(255, 116, 162, 184)),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(
      length: 3,
      vsync: this,
    );
    List<charts.Series<BarChartModelDayl, String>> series = [
      charts.Series(
        id: "financial",
        data: data,
        domainFn: (BarChartModelDayl series, _) => series.deta,
        measureFn: (BarChartModelDayl series, _) => series.financial,
        colorFn: (BarChartModelDayl series, _) => series.color,
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
