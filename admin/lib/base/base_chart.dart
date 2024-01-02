import 'package:flutter/material.dart';

import 'package:fl_chart/fl_chart.dart';

class ChartContainer extends StatelessWidget {
  final Color color;
  final String title;
  final List<Map> data;

  ChartContainer(
      {Key? key, required this.title, required this.color, required this.data})
      : super(key: key);

  List<BarChartGroupData> getData() {
    List<BarChartGroupData> ls = [];

    this.data.forEach((element) {
      ls.add(BarChartGroupData(x: int.parse(element['y']), barRods: [
        BarChartRodData(
            y: double.parse(element['y']),
            colors: [Color(0xff43dde6), Color(0xff43dde6)],
            width: 20),
      ]));
    });

    return ls;
  }

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
                    barGroups: getData(),
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
