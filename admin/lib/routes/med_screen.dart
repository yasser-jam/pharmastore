import 'dart:html';

import 'package:flutter/material.dart';
import 'package:project/base/base_select.dart';
import 'package:project/base/base_text_field.dart';
import 'package:project/base/drawer/drawer_list.dart';
import 'package:project/medicine/medicine_table.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MedScreen extends StatefulWidget {
  const MedScreen({super.key});

  static const String route = '/med-list';

  @override
  State<MedScreen> createState() {
    return _MedScreenState();
  }
}

class _MedScreenState extends State<MedScreen> {
  var medicines = [];

  var loading = false;

  @override
  void initState() {
    getMedicines();
  }

  void getMedicines() async {
    try {
      loading = true;

      var url = Uri.http('localhost:8000', 'api/medcines');

      var response = await http.get(url, headers: {
        'Authorization': 'Bearer ' + document.cookie!.split('=')[1]
      });

      var resBody = jsonDecode(response.body) as Map<String, dynamic>;

      setState(() {
        medicines = [...resBody['data']];
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
                      Row(
                        children: [
                          Expanded(
                            child: BaseTextField('Search...', () {}),
                          ),
                          const SizedBox(width: 20),
                          const Expanded(
                            child: BaseSelect(),
                          ),
                        ],
                      ),
                      Expanded(
                        child: loading
                            ? Text('loading table...')
                            : MedicineTable(data: medicines, getMedicines),
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
