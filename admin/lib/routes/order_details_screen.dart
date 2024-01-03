import 'dart:html';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:project/base/base_select.dart';
import 'package:project/base/base_text_field.dart';
import 'package:project/base/drawer/drawer_list.dart';
import 'package:project/orders/orders_table.dart';

class OrderDetailsScreen extends StatefulWidget {
  OrderDetailsScreen(this.order, {super.key});

  static const String route = '/orders/details';

  final order;

  @override
  State createState() {
    return OrderDetailsScreenState();
  }
}

class OrderDetailsScreenState extends State<OrderDetailsScreen> {
  var loading = false;

  var orders = [];

  void getOrders() async {
    try {
      loading = true;

      var url = Uri.http('192.168.208.54:8000', 'api/viewOrders');

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
    // if we haven't selected order => return to the orders page
    if (!widget.order?.id) {
      Navigator.pushNamed(ctx, '/orders');
    }

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
                        'Order Details',
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
                            : Row(
                                children: [
                                  Expanded(
                                      child:
                                          BaseTextField('Order Status', () {})),
                                  Expanded(
                                      child: BaseTextField(
                                          'Order Billing Status', () {})),
                                  SizedBox(height: 30),
                                  Center(
                                    child: SizedBox(
                                      width: 145,
                                      height: 45,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            primary: const Color.fromARGB(
                                                255, 44, 235, 241)),
                                        onPressed: () {},
                                        child: const Text(
                                          'Log-In',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ))
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
