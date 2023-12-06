import 'package:flutter/material.dart';

class OrdersTable extends StatefulWidget {
  const OrdersTable({super.key, required this.data});

  final data;

  @override
  State<OrdersTable> createState() {
    return _OrdersTableState(data: data);
  }
}

class _OrdersTableState extends State<OrdersTable> {
  _OrdersTableState({required this.data});

  final data;

  dynamic getRows() {
    List<DataRow> rows = [];
    data.forEach(
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
                  backgroundColor: Color.fromARGB(255, 219, 216, 110),
                  label: Text(
                    item['status'],
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
              DataCell(
                Chip(
                  backgroundColor: Color.fromARGB(255, 26, 144, 148),
                  label: Text(
                    item['billingstatus'],
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              DataCell(
                Row(
                  children: [
                    IconButton.filledTonal(
                      icon: const Icon(Icons.check),
                      color: Colors.green[400],
                      iconSize: 20,
                      splashRadius: 20,
                      onPressed: () {},
                    ),
                    IconButton.filledTonal(
                      icon: const Icon(Icons.delete),
                      color: Colors.red[400],
                      iconSize: 20,
                      splashRadius: 20,
                      onPressed: () {},
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
