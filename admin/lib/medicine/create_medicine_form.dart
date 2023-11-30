import 'package:flutter/material.dart';
import 'package:project/base/base_button.dart';
import 'package:project/base/base_text_field.dart';

class CreateMedicineForm extends StatelessWidget {
  const CreateMedicineForm({super.key});

  @override
  build(ctx) {
    return const Column(children: [
      SizedBox(height: 20),
      SizedBox(
        child: Text(
          'Add Medicine',
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
              color: Color.fromARGB(255, 26, 144, 148)),
        ),
      ),
      SizedBox(height: 30),
      Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(child: BaseTextField()),
          SizedBox(width: 10),
          Expanded(child: BaseTextField())
        ],
      ),
      SizedBox(height: 30),
      Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(child: BaseTextField()),
          SizedBox(width: 10),
          Expanded(child: BaseTextField())
        ],
      ),
      SizedBox(height: 30),
      Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(child: BaseTextField()),
          SizedBox(width: 10),
          Expanded(child: BaseTextField())
        ],
      ),
      SizedBox(height: 30),
      Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(child: BaseTextField()),
          SizedBox(width: 10),
          Expanded(child: BaseTextField()),
          SizedBox(width: 10),
          Expanded(child: BaseTextField())
        ],
      ),
      SizedBox(height: 50),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        BaseButton(
          type: 'cancel',
          btnText: 'Cancel',
        ),
        SizedBox(width: 10),
        BaseButton(
          type: 'primary',
          btnText: 'Save',
        ),
      ])
    ]);
  }
}
