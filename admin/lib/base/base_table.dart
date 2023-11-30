import 'package:flutter/material.dart';

class BaseTable extends StatelessWidget {
  const BaseTable(this.data, {super.key});

  final List data;
  dynamic getRows() {
    List<DataRow> rows = [];
    data.forEach((item) {
      rows.add(
        DataRow(
          cells: [
            DataCell(Text(
              item['useName'],
              style: const TextStyle(
                fontWeight: FontWeight.w800,
                color: Color.fromARGB(255, 26, 144, 148),
                fontSize: 16,
              ),
            )),
            DataCell(
              Chip(
                backgroundColor: Color.fromARGB(255, 219, 216, 110),
                label: Text(
                  item['qtn'].toString(),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
            DataCell(
              Chip(
                backgroundColor: Color.fromARGB(255, 26, 144, 148),
                label: Text(
                  item['price'].toString(),
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            DataCell(
              Chip(
                backgroundColor: const Color.fromARGB(147, 26, 99, 148),
                label: Text(
                  item['expiredDate'],
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
            DataCell(Row(children: [
              IconButton.filledTonal(
                icon: const Icon(Icons.edit),
                color: Colors.blue[400],
                iconSize: 20,
                onPressed: () {},
              ),
              IconButton.filledTonal(
                icon: const Icon(Icons.delete),
                color: Colors.red[400],
                iconSize: 20,
                onPressed: () {},
              ),
            ])),
          ],
        ),
      );
    });
    print(rows);

    return rows;
  }

  @override
  build(ctx) {
    getRows();
    return SizedBox(
      width: double.infinity,
      child: DataTable(columns: const [
        DataColumn(label: Text('Name')),
        // DataColumn(label: Text('Categories')),
        DataColumn(label: Text('Quantity')),
        DataColumn(label: Text('Price')),
        DataColumn(label: Text('Expiration Date')),
        DataColumn(label: Text('')),
      ], rows: getRows()),
    );
  }
}
