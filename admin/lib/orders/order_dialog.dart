import 'dart:convert';
import 'dart:html';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:project/base/base_select.dart';
import 'package:project/base/base_button.dart';

class OrderDialog extends StatefulWidget {
  OrderDialog({super.key, required this.order, required this.callback});

  final Function callback;

  final Map order;

  @override
  State createState() {
    return OrderDialogState();
  }
}

class OrderDialogState extends State<OrderDialog> {
  List<Widget> getRows(BuildContext ctx) {
    List<Widget> widgets = [];

    widget.order['items'].forEach((element) {
      widgets.add(ListTile(
        contentPadding: const EdgeInsets.all(0),
        title: Container(
          padding: const EdgeInsets.all(10),
          color: const Color(0xFFEEEEEE),
          child: Row(children: [
            Expanded(
              child: Text(
                element['medicine_id'].toString(),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Expanded(
              child: Chip(
                backgroundColor: Theme.of(ctx).colorScheme.secondary,
                label: Text(
                  element['qtn_requested'].toString(),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
            Expanded(
              child: Chip(
                backgroundColor: Theme.of(ctx).primaryColor,
                label: Text(
                  element['qtn_received'].toString() + '\$',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ]),
        ),
      ));
    });

    return widgets;
  }

  void editValue(val, bind) {
    widget.order[bind] = val;
    print(widget.order);
  }

  void updatePayment() async {
    try {
      var url =
          Uri.http('localhost:8000', 'api/billingStatus/${widget.order['id']}');
      var response = await http.patch(url,
          body: jsonEncode({"status": widget.order['billingstatus']}),
          headers: {
            'Authorization': 'Bearer ' + document.cookie!.split('=')[1],
            'Content-type': 'application/json'
          });
    } finally {}
  }

  void updateStatus() async {
    try {
      var url =
          Uri.http('localhost:8000', 'api/orderStatus/${widget.order['id']}');
      var response = await http.patch(url,
          body: jsonEncode({'status': widget.order['status']}),
          headers: {
            'Authorization': 'Bearer ' + document.cookie!.split('=')[1],
            'Content-type': 'application/json'
          });
    } finally {}
  }

  @override
  Widget build(BuildContext ctx) {
    const statusOptions = [
      {'value': 'preparing', 'title': 'Preparing'},
      {'value': 'sent', 'title': 'Sent'},
      {'value': 'received', 'title': 'Received'}
    ];

    const billingOptions = [
      {'value': 'unpaid', 'title': 'Unpaid'},
      {'value': 'paid', 'title': 'Paid'},
    ];

    return Dialog(
      child: Container(
        width: 900,
        height: 450,
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Order Details',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            SizedBox(
                height: 200,
                child: ListView(
                  children: getRows(ctx),
                )),
            const SizedBox(height: 50),
            Row(
              children: [
                Expanded(
                  child: BaseSelect((status) {
                    editValue(status, 'billingstatus');
                  }, widget.order['billingstatus'], billingOptions),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: BaseSelect((status) {
                    editValue(status, 'status');
                  }, widget.order['status'], statusOptions),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(children: [
              const Expanded(child: Text('')),
              BaseButton(
                  type: 'default',
                  btnText: 'Save',
                  onClick: () async {
                    // update billingstatus and status
                    updatePayment();
                    updateStatus();

                    await widget.callback();

                    Navigator.of(context).pop(); // Close the dialog
                  })
            ])
          ],
        ),
      ),
    );
  }
}
