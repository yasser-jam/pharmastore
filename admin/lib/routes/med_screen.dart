import 'package:flutter/material.dart';
import 'package:project/base/drawer/drawer_item.dart';
import 'package:project/medicine/create_medicine_form.dart';

import 'package:project/base/drawer/drawer_list.dart';

class MedScreen extends StatelessWidget {
  const MedScreen({super.key});

  static const String route = '/add-medicine';

  @override
  build(ctx) {
    return Scaffold(
        body: Row(
      children: [
        // Expanded(
        //     flex: 1,
        //     child: Container(
        //         color: const Color.fromARGB(255, 238, 238, 238),
        //         child: Column(children: [
        //           const SizedBox(height: 30),
        //           TextButton.icon(
        //             icon: const Icon(Icons.add),
        //             style: TextButton.styleFrom(
        //               primary: const Color.fromARGB(255, 26, 144, 148),
        //               textStyle: const TextStyle(
        //                 fontSize: 15,
        //               ),
        //             ),
        //             onPressed: () {},
        //             label: const Text('Add Medicine'),
        //           ),
        //         ]))),
        Expanded(
            flex: 1,
            child: Container(
                color: const Color.fromRGBO(8, 46, 47, 1),
                child: const DrawerList())),
        Expanded(
            flex: 4,
            child: Scaffold(
              // appBar: AppBar(
              //   title: const Text('Medical Bay'),
              //   titleTextStyle: const TextStyle(
              //       fontSize: 25,
              //       fontFamily: 'Roboto',
              //       color: Color.fromARGB(255, 26, 144, 148)),
              //   // backgroundColor: const Color.fromARGB(255, 26, 144, 148),
              //   backgroundColor: Colors.white,
              // ),
              body: Container(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  alignment: Alignment.centerLeft,
                  child: const CreateMedicineForm()),
            ))
      ],
    ));
  }
}
