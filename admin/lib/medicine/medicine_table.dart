import 'dart:html';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MedicineTable extends StatefulWidget {
  MedicineTable(this.refresh, {super.key, required this.data});

  final data;
  final Function refresh;

  @override
  State createState() {
    return MedicineTableState();
  }
}

class MedicineTableState extends State<MedicineTable> {
  var loading = false;

  dynamic delete(id) async {
    try {
      var url = Uri.http('localhost:8000', 'api/medcines/' + id);

      // start loader
      setState(() {
        loading = true;
      });

      var response = await http.delete(url, headers: {
        'Authorization': 'Bearer ' + document.cookie!.split('=')[1]
      });

      var resBody = jsonDecode(response.body) as Map<String, dynamic>;

      setState(() {
        widget.refresh();

        getRows();

        loading = false;
      });
    } finally {}
  }

  dynamic getRows() {
    List<DataRow> rows = [];
    widget.data.forEach((item) {
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
                splashRadius: 20,
                onPressed: () {},
              ),
              IconButton.filledTonal(
                icon: const Icon(Icons.delete),
                color: Colors.red[400],
                iconSize: 20,
                splashRadius: 20,
                onPressed: () {
                  delete(item['id'].toString());
                },
              ),
            ])),
          ],
        ),
      );
    });

    return rows;
  }

  @override
  build(ctx) {
    getRows();
    return loading
        ? Text('loading...')
        : SizedBox(
            width: double.infinity,
            child: ListView(children: [
              DataTable(
                columns: const [
                  DataColumn(label: Text('Name')),
                  // DataColumn(label: Text('Categories')),
                  DataColumn(label: Text('Quantity')),
                  DataColumn(label: Text('Price')),
                  DataColumn(label: Text('Expiration Date')),
                  DataColumn(label: Text('')),
                ],
                rows: getRows(),
              ),
            ]),
          );
  }
}
