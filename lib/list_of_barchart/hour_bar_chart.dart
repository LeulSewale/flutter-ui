import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

import 'bar_chart_model.dart';

class HourPage extends StatefulWidget {
  HourPage({Key? key}) : super(key: key);

  @override
  State<HourPage> createState() => _HourPageState();
}

class _HourPageState extends State<HourPage>
    with TickerProviderStateMixin {
  final List<BarChartModelHour> data = [
    BarChartModelHour(
      deta: "10min",
      financial: 20,
      color: charts.ColorUtil.fromDartColor(
          const Color.fromARGB(255, 142, 184, 204)),
    ),
    BarChartModelHour(
      deta: "20min",
      financial: 30,
      color: charts.ColorUtil.fromDartColor(
          const Color.fromARGB(255, 172, 49, 40)),
    ),
    BarChartModelHour(
      deta: "30min",
      financial: 10,
      color: charts.ColorUtil.fromDartColor(
          const Color.fromARGB(255, 142, 184, 204)),
    ),
    BarChartModelHour(
      deta: "40min",
      financial: 40,
      color: charts.ColorUtil.fromDartColor(
          const Color.fromARGB(255, 172, 49, 40)),
    ),
    BarChartModelHour(
      deta: "50min",
      financial: 15,
      color: charts.ColorUtil.fromDartColor(Color.fromARGB(255, 116, 162, 184)),
    ),
    BarChartModelHour(
      deta: "60mi",
      financial: 30,
      color: charts.ColorUtil.fromDartColor(
          const Color.fromARGB(255, 172, 49, 40)),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(
      length: 3,
      vsync: this,
    );
    List<charts.Series<BarChartModelHour, String>> series = [
      charts.Series(
        id: "Temprature",
        data: data,
        domainFn: (BarChartModelHour series, _) => series.deta,
        measureFn: (BarChartModelHour series, _) => series.financial,
        colorFn: (BarChartModelHour series, _) => series.color,
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
