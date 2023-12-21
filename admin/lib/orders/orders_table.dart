import 'dart:convert';
import 'dart:html';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class OrdersTable extends StatefulWidget {
  const OrdersTable({super.key, required this.data, required this.callback});

  final data;
  final Function callback;

  @override
  State<OrdersTable> createState() {
    return _OrdersTableState();
  }
}

class _OrdersTableState extends State<OrdersTable> {
  _OrdersTableState();

  void updatePayment(status, id) async {
    try {
      var url = Uri.http('localhost:8000', 'api/billingStatus/$id');
      var response = await http.patch(url,
          body: jsonEncode({"status": status == 'paid' ? 'unpaid' : 'paid'}),
          headers: {
            'Authorization': 'Bearer ' + document.cookie!.split('=')[1],
            'Content-type': 'application/json'
          });

      // update table
      setState(() async {
        await widget.callback();
      });
    } finally {}
  }

  void updateStatus(status, id) async {
    try {
      var url = Uri.http('localhost:8000', 'api/orderStatus/$id');
      var response = await http.patch(url,
          body: jsonEncode({
            'status': status == 'preparing'
                ? 'sent'
                : status == 'sent'
                    ? 'received'
                    : 'preparing'
          }),
          headers: {
            'Authorization': 'Bearer ' + document.cookie!.split('=')[1],
            'Content-type': 'application/json'
          });

      // update table
      setState(() async {
        await widget.callback();
      });
    } finally {}
  }

  void removeOrder(id) async {
    try {
      var url = Uri.http('localhost:8000', 'api/orders/$id');
      var response = await http.delete(url, headers: {
        'Authorization': 'Bearer ' + document.cookie!.split('=')[1],
        'Content-type': 'application/json'
      });

      // update table
      setState(() async {
        await widget.callback();
      });
    } finally {}
  }

  dynamic getRows() {
    List<DataRow> rows = [];
    widget.data.forEach(
      (item) {
        rows.add(
          DataRow(
            cells: [
              DataCell(
                Text(
                  item['items'].length.toString() + ' item',
                  style: const TextStyle(
                    fontWeight: FontWeight.w800,
                    color: Color.fromARGB(255, 26, 144, 148),
                    fontSize: 16,
                  ),
                ),
              ),
              DataCell(
                onTap: () {
                  updateStatus(item['status'], item['id']);
                },
                Chip(
                  backgroundColor: item['status'] == 'sent'
                      ? Color.fromARGB(255, 219, 216, 110)
                      : item['status'] == 'received'
                          ? Color.fromARGB(255, 26, 144, 148)
                          : Color.fromARGB(255, 145, 125, 235),
                  label: Text(
                    item['status'],
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
              DataCell(
                onTap: () {
                  updatePayment(item['billingstatus'], item['id']);
                },
                Chip(
                  backgroundColor: item['billingstatus'] == 'paid'
                      ? Color.fromARGB(255, 26, 144, 148)
                      : Color.fromARGB(255, 226, 170, 85),
                  label: Text(
                    item['billingstatus'],
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              DataCell(
                Row(
                  children: [
                    // IconButton.filledTonal(
                    //     icon: const Icon(Icons.check),
                    //     color: Colors.blue,
                    //     iconSize: 20,
                    //     splashRadius: 20,
                    //     onPressed: () {}),
                    IconButton.filledTonal(
                      icon: const Icon(Icons.delete),
                      color: Colors.red[400],
                      iconSize: 20,
                      splashRadius: 20,
                      onPressed: () {
                        removeOrder(item['id']);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );

    return rows;
  }

  @override
  build(ctx) {
    getRows();
    return SizedBox(
      width: double.infinity,
      child: DataTable(columns: const [
        DataColumn(label: Text('Order Quantity')),
        DataColumn(label: Text('status')),
        DataColumn(label: Text('billingstatus')),
        DataColumn(label: Text('')),
      ], rows: getRows()),
    );
  }
}
