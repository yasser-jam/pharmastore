import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:fl_chart/fl_chart.dart';

import 'package:project/base/drawer/drawer_list.dart';
import 'package:project/reports/NumberCard.dart';

class HomeScreen extends StatelessWidget {
  static const String route = '/';

  HomeScreen({super.key});

  @override
  build(BuildContext ctx) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: const Color.fromRGBO(8, 46, 47, 1),
              child: const DrawerList(),
            ),
          ),
          Expanded(
            flex: 4,
            child: Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView(
                  children: [
                    Column(
                      children: [
                        // First Row: Four Number Cards
                        const Row(
                          children: [
                            Expanded(
                              child: NumberCard(
                                  label: 'Pharmacies',
                                  number: 42,
                                  icon: Icons.store,
                                  color: Color.fromARGB(255, 207, 234, 247),
                                  textColor: Colors.blue),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: NumberCard(
                                label: 'Orders',
                                number: 99,
                                icon: Icons.telegram,
                                color: Color.fromARGB(255, 221, 245, 193),
                                textColor: Colors.green,
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: NumberCard(
                                  label: 'Medicines',
                                  number: 73,
                                  icon: Icons.message,
                                  color: Color.fromARGB(255, 247, 234, 216),
                                  textColor: Colors.orange),
                            ),
                          ],
                        ),

                        const SizedBox(height: 16), // Spacer

                        // Second Row: Two Charts
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Pharmacies Distribution',
                                    style: TextStyle(
                                        color: Theme.of(ctx).primaryColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25),
                                  ),
                                  const SizedBox(height: 10),
                                  SizedBox(
                                    height: 500,
                                    child: ChartContainer(
                                        title: 'Pharmacies Distribution',
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Pharmacies Distribution',
                                    style: TextStyle(
                                        color: Theme.of(ctx).primaryColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25),
                                  ),
                                  const SizedBox(height: 10),
                                  SizedBox(
                                    height: 500,
                                    child: ChartContainer(
                                        title: 'Pharmacies Distribution',
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 16), // Spacer

                        // Third Row: Three Charts
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                        //   children: [
                        //     Expanded(child: MyChart(title: 'Chart 3')),
                        //     Expanded(child: MyChart(title: 'Chart 4')),
                        //     Expanded(child: MyChart(title: 'Chart 5')),
                        //   ],
                        // ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChartContainer extends StatelessWidget {
  final Color color;
  final String title;

  ChartContainer({
    Key? key,
    required this.title,
    required this.color,
  }) : super(key: key);

  List<BarChartGroupData> barChartGroupData = [
    BarChartGroupData(x: 1, barRods: [
      BarChartRodData(
          y: 5, colors: [Color(0xff43dde6), Color(0xff43dde6)], width: 20),
    ]),
    BarChartGroupData(x: 2, barRods: [
      BarChartRodData(
          y: 7, colors: [Color(0xff43dde6), Color(0xff43dde6)], width: 20),
    ]),
    BarChartGroupData(x: 3, barRods: [
      BarChartRodData(
          y: 10, colors: [Color(0xff43dde6), Color(0xff43dde6)], width: 20),
    ]),
    BarChartGroupData(x: 4, barRods: [
      BarChartRodData(
          y: 9, colors: [Color(0xff43dde6), Color(0xff43dde6)], width: 20),
    ]),
    BarChartGroupData(x: 5, barRods: [
      BarChartRodData(
          y: 7, colors: [Color(0xff43dde6), Color(0xff43dde6)], width: 20),
    ]),
    BarChartGroupData(x: 6, barRods: [
      BarChartRodData(
          y: 8, colors: [Color(0xff43dde6), Color(0xff43dde6)], width: 20),
    ]),
    BarChartGroupData(x: 7, barRods: [
      BarChartRodData(
          y: 5, colors: [Color(0xff43dde6), Color(0xff43dde6)], width: 20),
    ]),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.95,
        height: MediaQuery.of(context).size.width * 0.95 * 0.65,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20),
            Expanded(
                child: Container(
              padding: EdgeInsets.only(top: 4),
              child: BarChart(
                BarChartData(
                    maxY: 12,
                    barGroups: barChartGroupData,
                    gridData: FlGridData(
                      show: false,
                    ),
                    borderData: FlBorderData(
                        border: const Border(
                            top: BorderSide(color: Colors.black12),
                            bottom: BorderSide(color: Colors.black12),
                            left: BorderSide(color: Colors.black12),
                            right: BorderSide(color: Colors.black12)))),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
