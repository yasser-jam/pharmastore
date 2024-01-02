import 'dart:convert';
import 'dart:html';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'order_dialog.dart';

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

  void removeOrder(id) async {
    try {
      var url = Uri.http('localhost:8000', 'api/orders/$id');
      var response = await http.delete(url, headers: {
        'Authorization': 'Bearer ' + document.cookie!.split('=')[1],
        'Content-type': 'application/json'
      });

      // update table
      setState(() {
        widget.callback();
      });
    } finally {}
  }

  dynamic getRows(ctx) {
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
                Chip(
                  backgroundColor: item['status'] == 'sent'
                      ? Theme.of(ctx).colorScheme.secondary
                      : item['status'] == 'received'
                          ? Theme.of(ctx).primaryColor
                          : Theme.of(ctx).colorScheme.surface,
                  label: Text(
                    item['status'],
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
              DataCell(
                Chip(
                  backgroundColor: item['billingstatus'] == 'paid'
                      ? Theme.of(ctx).primaryColor
                      : Theme.of(ctx).colorScheme.secondary,
                  label: Text(
                    item['billingstatus'],
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
              DataCell(
                Row(
                  children: [
                    IconButton.filledTonal(
                        icon: const Icon(Icons.edit),
                        color: Colors.blue,
                        iconSize: 20,
                        splashRadius: 20,
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return OrderDialog(
                                  order: item,
                                  callback: () {
                                    widget.callback();
                                  });
                            },
                          );
                        }),
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
    getRows(ctx);
    return SizedBox(
      width: double.infinity,
      child: DataTable(columns: const [
        DataColumn(label: Text('Order Quantity')),
        DataColumn(label: Text('status')),
        DataColumn(label: Text('billingstatus')),
        DataColumn(label: Text('')),
      ], rows: getRows(ctx)),
    );
  }
}
