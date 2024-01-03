import 'dart:html';
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:project/base/drawer/drawer_list.dart';
import 'package:project/reports/NumberCard.dart';
import 'package:project/base/base_chart.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  static const String route = '/';

  @override
  State createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  Map<String, dynamic> report = {};
  List<Map<String, dynamic>> monthlyReportSales = [];
  List<Map<String, dynamic>> monthlyReportMeds = [];

  void getReport() async {
    try {
      var url = Uri.http('192.168.175.168:8000', 'api/reports');

      var response = await http.get(url, headers: {
        'Authorization': 'Bearer ' + document.cookie!.split('=')[1]
      });

      var repUrl = Uri.http('192.168.175.168:8000', 'api/monthlyReport');

      var res = await http.get(repUrl, headers: {
        'Authorization': 'Bearer ' + document.cookie!.split('=')[1]
      });

      var responseBody = jsonDecode(response.body) as Map<String, dynamic>;
      var resBody = jsonDecode(res.body) as Map<String, dynamic>;

      // var counter = 0;
      // var counter2 = 0;

      setState(() {
        report = responseBody;
        // List config1 = resBody['Monthly_Sales_warehouse'];
        // monthlyReportMeds = resBody['Monthly_No_Med_Sold'];

        // config1.forEach((el) {
        //   monthlyReportMeds.add({  })
        // })
        // monthlyReportSales = resBody['Monthly_Sales_warehouse']
        //     .map((e) => {'x': ++counter, 'y': e});
        // monthlyReportMeds = resBody['Monthly_No_Med_Sold']
        //     .map((e) => {'x': ++counter2, 'y': e});
        // print(monthlyReportSales);
        // print(monthlyReportMeds);
      });
    } finally {}
  }

  @override
  void initState() {
    getReport();

    monthlyReportSales = [
      {'x': '1', 'y': '200'},
      {'x': '2', 'y': '100'},
      {'x': '3', 'y': '900'},
      {'x': '4', 'y': '300'},
      {'x': '5', 'y': '400'},
      {'x': '6', 'y': '500'},
      {'x': '7', 'y': '700'},
      {'x': '8', 'y': '300'},
      {'x': '9', 'y': '100'},
      {'x': '10', 'y': '200'},
      {'x': '11', 'y': '500'},
      {'x': '12', 'y': '300'},
    ];

    monthlyReportMeds = [
      {'x': '1', 'y': '200'},
      {'x': '2', 'y': '100'},
      {'x': '3', 'y': '900'},
      {'x': '4', 'y': '300'},
      {'x': '5', 'y': '400'},
      {'x': '6', 'y': '500'},
      {'x': '7', 'y': '700'},
      {'x': '8', 'y': '300'},
      {'x': '9', 'y': '100'},
      {'x': '10', 'y': '200'},
      {'x': '11', 'y': '500'},
      {'x': '12', 'y': '300'},
    ];
  }

  @override
  build(BuildContext ctx) {
    // monthly sales data
    // var monthlySales = [
    //   {'x': '1', 'y': chart['Monthly_Sales_warehouse'][0].toString()},
    //   {'x': '2', 'y': chart['Monthly_Sales_warehouse'][1].toString()},
    //   {'x': '3', 'y': chart['Monthly_Sales_warehouse'][2].toString()},
    //   {'x': '4', 'y': chart['Monthly_Sales_warehouse'][3].toString()},
    //   {'x': '5', 'y': chart['Monthly_Sales_warehouse'][4].toString()},
    //   {'x': '6', 'y': chart['Monthly_Sales_warehouse'][5].toString()},
    //   {'x': '7', 'y': chart['Monthly_Sales_warehouse'][6].toString()},
    //   {'x': '8', 'y': chart['Monthly_Sales_warehouse'][7].toString()},
    //   {'x': '9', 'y': chart['Monthly_Sales_warehouse'][8].toString()},
    //   {'x': '10', 'y': chart['Monthly_Sales_warehouse'][9].toString()},
    //   {'x': '11', 'y': chart['Monthly_Sales_warehouse'][10].toString()},
    //   {'x': '12', 'y': chart['Monthly_Sales_warehouse'][11].toString()},
    // ];

    // var monthlyMed = [
    //   {'x': '1', 'y': chart['Monthly_No_Med_Sold'][0].toString()},
    //   {'x': '2', 'y': chart['Monthly_No_Med_Sold'][1].toString()},
    //   {'x': '3', 'y': chart['Monthly_No_Med_Sold'][2].toString()},
    //   {'x': '4', 'y': chart['Monthly_No_Med_Sold'][3].toString()},
    //   {'x': '5', 'y': chart['Monthly_No_Med_Sold'][4].toString()},
    //   {'x': '6', 'y': chart['Monthly_No_Med_Sold'][5].toString()},
    //   {'x': '7', 'y': chart['Monthly_No_Med_Sold'][6].toString()},
    //   {'x': '8', 'y': chart['Monthly_No_Med_Sold'][7].toString()},
    //   {'x': '9', 'y': chart['Monthly_No_Med_Sold'][8].toString()},
    //   {'x': '10', 'y': chart['Monthly_No_Med_Sold'][9].toString()},
    //   {'x': '11', 'y': chart['Monthly_No_Med_Sold'][10].toString()},
    //   {'x': '12', 'y': chart['Monthly_No_Med_Sold'][11].toString()},
    // ];

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
                        Row(
                          children: [
                            Expanded(
                              child: NumberCard(
                                  label: 'Pharmacies',
                                  number: report['No_of_pharmacies'] != null
                                      ? report['No_of_pharmacies'].toString()
                                      : '0',
                                  icon: Icons.store,
                                  color: Color.fromARGB(255, 207, 234, 247),
                                  textColor: Colors.blue),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: NumberCard(
                                label: 'Orders',
                                number: report['Sum_of_all_Orders'] != null
                                    ? report['Sum_of_all_Orders'].toString()
                                    : '0',
                                icon: Icons.send,
                                color: const Color.fromARGB(255, 221, 245, 193),
                                textColor: Colors.green,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: NumberCard(
                                  label: 'Most ordering Pharmacy',
                                  number: report['Most_ordering_pharmacy'] !=
                                          null
                                      ? report['Most_ordering_pharmacy']['name']
                                          .toString()
                                      : 'Not Found',
                                  icon: Icons.message,
                                  color:
                                      const Color.fromARGB(255, 247, 234, 216),
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
                                        title: 'Sales on Months',
                                        color: Colors.white,
                                        data: monthlyReportMeds),
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
                                    'Medicines on Month',
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
                                        color: Colors.white,
                                        data: monthlyReportSales),
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
