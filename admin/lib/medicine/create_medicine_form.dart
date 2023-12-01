import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:project/base/base_button.dart';
import 'package:project/base/base_select.dart';
import 'package:project/base/base_text_field.dart';
import 'package:project/routes/med_list.dart';
import 'package:http/http.dart' as http;

class CreateMedicineForm extends StatefulWidget {
  const CreateMedicineForm({super.key});

  @override
  State<CreateMedicineForm> createState() {
    return _CreateMedicineFormState();
  }
}

class _CreateMedicineFormState extends State<CreateMedicineForm> {
  Map<String, dynamic> medicine = {
    'sciName': '',
    'useName': '',
    'companyName': '',
    'qtn': 40,
    'expiredDate': '',
    'price': 45,
    'description': '',
    'category_id': 1
  };

  void editValue(val, bind) {
    medicine[bind] = val;
  }

  var loading = false;

  dynamic save() async {
    try {
      setState(() {
        loading = true;
      });

      var url = Uri.http('localhost:8000', 'api/medcines');
      await http.post(url,
          body: jsonEncode(
            {
              ...medicine,
              'qtn': int.parse(medicine['qtn']),
              'price': int.parse(medicine['price'])
            },
          ),
          headers: {'Content-type': 'application/json'});

      // push router to medicines page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MedList()),
      );
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  build(ctx) {
    return Column(children: [
      const SizedBox(height: 20),
      const SizedBox(
        child: Text(
          'Add Medicine',
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
              color: Color.fromARGB(255, 26, 144, 148)),
        ),
      ),
      const SizedBox(height: 30),
      Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
              child: TextField(
            onChanged: (value) {
              editValue(value, 'sciName');
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Scientific Name (en)',
            ),
          )),
          SizedBox(width: 10),
          Expanded(
            child: TextField(
              onChanged: (value) {
                editValue(value, 'sciName');
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Scientific Name (ar)',
              ),
            ),
          )
        ],
      ),
      SizedBox(height: 30),
      Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: TextField(
              onChanged: (value) {
                editValue(value, 'useName');
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Used Name (en)',
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: TextField(
              onChanged: (value) {
                editValue(value, 'useName');
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Used Name (ar)',
              ),
            ),
          )
        ],
      ),
      SizedBox(height: 30),
      Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: TextField(
              onChanged: (value) {
                editValue(value, 'companyName');
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Company Name',
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: TextField(
              onChanged: (value) {
                editValue(value, 'qtn');
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Quantity',
              ),
            ),
          )
        ],
      ),
      SizedBox(height: 30),
      Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: TextField(
              onChanged: (value) {
                editValue(value, 'expiredDate');
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Expiration Date',
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: TextField(
              onChanged: (value) {
                editValue(value, 'price');
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Price',
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: TextField(
              onChanged: (value) {
                editValue(value, 'description');
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Description',
              ),
            ),
          )
        ],
      ),
      const SizedBox(height: 30),
      const Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(child: BaseSelect()),
        ],
      ),
      const SizedBox(height: 50),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        BaseButton(
          onClick: () {},
          type: 'cancel',
          btnText: 'Cancel',
        ),
        const SizedBox(width: 10),
        SizedBox(
          width: 125,
          height: 35,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 26, 144, 148)),
            onPressed: loading
                ? null
                : () {
                    save();
                  },
            child: loading
                ? const SizedBox(
                    width: 25, height: 25, child: CircularProgressIndicator())
                : const Text(
                    'Save',
                    style: TextStyle(fontSize: 15),
                  ),
          ),
        )
      ])
    ]);
  }
}
