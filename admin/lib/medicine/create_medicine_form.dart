import 'dart:html';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:project/base/base_button.dart';
import 'package:project/base/base_select.dart';
import 'package:project/base/base_text_field.dart';
import 'package:project/routes/med_screen.dart';
import 'package:http/http.dart' as http;

class CreateMedicineForm extends StatefulWidget {
  const CreateMedicineForm({super.key});

  @override
  State<CreateMedicineForm> createState() {
    return _CreateMedicineFormState();
  }
}

class _CreateMedicineFormState extends State<CreateMedicineForm> {
  var mode;

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

  dynamic save(id) async {
    try {
      setState(() {
        loading = true;
      });

      var url;

      if (mode == 'update') {
        url = Uri.http('localhost:8000', 'api/medcines/$id');
      } else {
        url = Uri.http('localhost:8000', 'api/medcines');
      }

      var body = {
        ...medicine,
        'qtn': int.parse(medicine['qtn']),
        'price': int.parse(medicine['price']),
      };

      print(body);

      if (mode != 'update') {
        await http.post(url,
            body: jsonEncode(
              body,
            ),
            headers: {
              'Content-type': 'application/json',
              'Authorization': 'Bearer ' + document.cookie!.split('=')[1]
            });
      } else {
        await http.patch(url,
            body: jsonEncode(
              body,
            ),
            headers: {
              'Content-type': 'application/json',
              'Authorization': 'Bearer ' + document.cookie!.split('=')[1]
            });
      }

      // push router to medicines page
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MedScreen()),
      );
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  build(ctx) {
    // take the medicine (when update)
    final data = ModalRoute.of(context)!.settings.arguments != null
        ? ModalRoute.of(context)!.settings.arguments as Map<dynamic, dynamic>
        : null;

    data != null ? mode = 'update' : 'create';

    var cat = data != null ? data['category'][0]['id'].toString() : '';

    if (data != null) {
      medicine['sciName'] = data['sciName'];
      medicine['useName'] = data['useName'];
      medicine['companyName'] = data['companyName'];
      medicine['qtn'] = data['qtn'].toString();
      medicine['expiredDate'] = data['expiredDate'];
      medicine['price'] = data['price'].toString();
      medicine['description'] = 'test for test';
      medicine['category_id'] = data['category'][0]['id'];
    }

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
              child: TextFormField(
            initialValue: data != null ? data['sciName'] : '',
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
            child: TextFormField(
              initialValue: data != null ? data['sciName'] : '',
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
      Divider(height: 30),
      Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: TextFormField(
              initialValue: data != null ? data['useName'] : '',
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
            child: TextFormField(
              initialValue: data != null ? data['useName'] : '',
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
            child: TextFormField(
              initialValue: data != null ? data['companyName'] : '',
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
            child: TextFormField(
              initialValue: data != null ? data['qtn'].toString() : '',
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
            child: TextFormField(
              initialValue: data != null ? data['expiredDate'] : '',
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
            child: TextFormField(
              initialValue: data != null ? data['price'].toString() : '',
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
            child: TextFormField(
              initialValue: data != null ? data['description'] : '',
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
      Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
              child: BaseSelect((id) {
            editValue(id, 'category_id');
          }, cat)),
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
                    save(data != null ? data['id'] : null);
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
