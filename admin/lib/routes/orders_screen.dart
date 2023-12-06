import 'dart:html';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:project/base/base_select.dart';
import 'package:project/base/base_text_field.dart';
import 'package:project/base/drawer/drawer_list.dart';
import 'package:project/orders/orders_table.dart';

class OrdersScreen extends StatefulWidget {
  OrdersScreen({super.key});

  static const String route = '/orders';

  @override
  State createState() {
    return OrdersScreenState();
  }
}

class OrdersScreenState extends State<OrdersScreen> {
  var loading = false;

  var orders = [];

  @override
  void initState() {
    getOrders();
  }

  void getOrders() async {
    try {
      loading = true;

      var url = Uri.http('localhost:8000', 'api/viewOrders');

      var response = await http.get(url, headers: {
        'Authorization': 'Bearer ' + document.cookie!.split('=')[1]
      });

      var resBody = jsonDecode(response.body) as Map<String, dynamic>;

      setState(() {
        orders = [...resBody['data']];
        loading = false;
      });
    } finally {}
  }

  @override
  build(ctx) {
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
              body: Container(
                width: double.infinity,
                padding: const EdgeInsets.only(left: 30, right: 30),
                alignment: Alignment.topLeft,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    const SizedBox(
                      child: Text(
                        'Orders',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 26, 144, 148)),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: loading
                          ? Text('loading...')
                          : OrdersTable(data: orders),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
