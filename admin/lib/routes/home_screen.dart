import 'package:flutter/material.dart';

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
          const Expanded(
            flex: 4,
            child: Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // First Row: Four Number Cards
                    Row(
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

                    SizedBox(height: 16), // Spacer

                    // Second Row: Two Charts
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(child: MyChart(title: 'Chart 1')),
                        Expanded(child: MyChart(title: 'Chart 2')),
                      ],
                    ),

                    SizedBox(height: 16), // Spacer

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
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyChart extends StatelessWidget {
  final String title;

  const MyChart({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: BarChart(
                BarChartData(
                  barGroups: [
                    BarChartGroupData(
                      x: 0,
                      barRods: [
                        BarChartRodData(y: 100, colors: [Colors.black]),
                      ],
                    ),
                    BarChartGroupData(
                      x: 1,
                      barRods: [
                        BarChartRodData(y: 40, colors: [Colors.amber]),
                      ],
                    ),
                    BarChartGroupData(
                      x: 2,
                      barRods: [
                        BarChartRodData(y: 80, colors: [Colors.green]),
                      ],
                    ),
                    BarChartGroupData(
                      x: 3,
                      barRods: [
                        BarChartRodData(y: 40, colors: [Colors.blue]),
                      ],
                    ),
                  ],
                  titlesData: FlTitlesData(
                    leftTitles: SideTitles(showTitles: true),
                    bottomTitles: SideTitles(showTitles: true),
                  ),
                  borderData: FlBorderData(
                    show: true,
                  ),
                  barTouchData: BarTouchData(
                    touchTooltipData: BarTouchTooltipData(
                      tooltipBgColor: Colors.blueAccent,
                    ),
                  ),
                  gridData: FlGridData(show: false),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
