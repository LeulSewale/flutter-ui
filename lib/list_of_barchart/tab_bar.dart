import 'package:flutter/material.dart';

import 'day_bar_chart.dart';
import 'hour_bar_chart.dart';
import 'month_bar_chart.dart';

class NewBar extends StatefulWidget {
  const NewBar({super.key});

  @override
  State<NewBar> createState() => _NewBarState();
}

class _NewBarState extends State<NewBar> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(
      length: 3,
      vsync: this,
    );
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 100,
            width: 600,
            color: Color.fromARGB(255, 60, 55, 212),
            child: const Text(
              'Item A',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                  controller: _tabController,
                  isScrollable: true,
                  labelPadding: const EdgeInsets.only(left: 20, right: 20),
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  tabs: const [
                    Tab(
                      text: 'Hour',
                    ),
                    Tab(
                      text: 'Day',
                    ),
                    Tab(
                      text: 'Month',
                    ),
                  ]),
            ),
          ),
          SizedBox(
            width: 500,
            height: 400,
            child: TabBarView(controller: _tabController, children: [
              ListView.builder(
                  itemCount: 3,
                  itemBuilder: (_, index) {
                    return Container(
                        height: 400, 
                        width: 200,
                       child: HourPage());
                  }),
              ListView.builder(
                  itemCount: 3,
                  itemBuilder: (_, index) {
                    return Container(
                      height: 400,
                      width: 200,
                      child: DayPage(),
                    );
                  }),
              ListView.builder(
                  itemCount: 3,
                  itemBuilder: (_, index) {
                    return Container(
                      height: 400,
                      width: 200,
                      child: MonthPage(),
                    );
                  }),
            ]),
          )
        ],
      ),
    );
  }
}
