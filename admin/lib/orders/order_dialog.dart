import 'package:flutter/material.dart';
import 'package:project/base/base_select.dart';
import 'package:project/base/base_button.dart';

class OrderDialog extends StatefulWidget {
  OrderDialog({super.key});

  @override
  State createState() {
    return OrderDialogState();
  }
}

class OrderDialogState extends State<OrderDialog> {
  List<Map> items = [
    {'name': 'order - 1', 'price': '100', 'qtn': '10'},
    {'name': 'order - 2', 'price': '160', 'qtn': '100'},
    {'name': 'order - 3', 'price': '200', 'qtn': '20'},
  ];

  List<Widget> getRows(List<Map> items, BuildContext ctx) {
    List<Widget> widgets = [];

    items.forEach((element) {
      widgets.add(ListTile(
        contentPadding: const EdgeInsets.all(0),
        title: Container(
          padding: const EdgeInsets.all(10),
          color: const Color(0xFFEEEEEE),
          child: Row(children: [
            Expanded(
              child: Text(
                element['name'].toString(),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Expanded(
              child: Chip(
                backgroundColor: Theme.of(ctx).primaryColor,
                label: Text(
                  element['qtn'].toString() + '\$',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
            Expanded(
              child: Chip(
                backgroundColor: Theme.of(ctx).colorScheme.secondary,
                label: Text(
                  element['price'].toString(),
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

  @override
  Widget build(BuildContext ctx) {
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
                  children: getRows(items, ctx),
                )),
            const SizedBox(height: 50),
            Row(
              children: [
                Expanded(
                  child: DropdownButton<String>(
                    hint: const Text('Order Status'),
                    items:
                        ['received', 'preparing', 'sent'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      // Handle selection
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: DropdownButton<String>(
                    hint: const Text('Billing Status'),
                    items: ['paid', 'unpaid'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      // Handle selection
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(children: [
              const Expanded(child: Text('')),
              BaseButton(
                  type: 'default',
                  btnText: 'Save',
                  onClick: () {
                    Navigator.of(context).pop(); // Close the dialog
                  })
            ])
          ],
        ),
      ),
    );
  }
}
