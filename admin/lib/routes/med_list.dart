import 'package:flutter/material.dart';
import 'package:project/base/base_select.dart';
import 'package:project/base/base_table.dart';
import 'package:project/base/base_text_field.dart';
import 'package:project/base/drawer/drawer_list.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MedList extends StatefulWidget {
  const MedList({super.key});

  static const String route = '/med-list';

  @override
  State<MedList> createState() {
    return _MedListState();
  }
}

class _MedListState extends State<MedList> {
  var medicines = [];

  var loading = true;

  @override
  void initState() {
    getMedicines();
  }

  dynamic getMedicines() async {
    try {
      var url = Uri.http('localhost:8000', 'api/medcines');

      var response = await http.get(url);

      var resBody = jsonDecode(response.body) as Map<String, dynamic>;

      medicines = resBody['data'];

      setState(() {
        loading = false;
      });

      print(medicines);

      return medicines;
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
                  child: const DrawerList())),
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
                          'Medicines',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 26, 144, 148)),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Row(
                        children: [
                          Expanded(
                            child: BaseTextField(),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: BaseSelect(),
                          ),
                        ],
                      ),
                      Expanded(
                        child:
                            loading ? Text('loading...') : BaseTable(medicines),
                      )
                    ],
                  )),
            ),
          )
        ],
      ),
    );
  }
}
