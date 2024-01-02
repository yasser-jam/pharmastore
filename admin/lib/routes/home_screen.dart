import 'package:flutter/material.dart';

import 'package:project/base/drawer/drawer_list.dart';
import 'package:project/reports/NumberCard.dart';
import 'package:project/base/base_chart.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  static const String route = '/';

  @override
  State createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    print('init');
  }

  var data = [
    {'x': '1', 'y': '5'},
    {'x': '2', 'y': '7'},
    {'x': '3', 'y': '9'},
    {'x': '4', 'y': '12'},
    {'x': '5', 'y': '10'},
    {'x': '6', 'y': '4'},
    {'x': '7', 'y': '1'},
  ];

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
                                        color: Colors.white,
                                        data: data),
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
                                        color: Colors.white,
                                        data: data),
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
