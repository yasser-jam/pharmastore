import 'package:flutter/material.dart';

class BaseSelect extends StatefulWidget {
  const BaseSelect({super.key});
  @override
  State<BaseSelect> createState() {
    return _BaseTextFieldState();
  }
}

class _BaseTextFieldState extends State<BaseSelect> {
  var _dropdownValue = 'child-1';

  void dropdownCallback(String? selectedValue) {
    if (selectedValue is String) {
      print(selectedValue);
      setState(() {
        _dropdownValue = selectedValue;
      });
    }
  }

  @override
  build(ctx) {
    return DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(5),
        ),
        child: DropdownButton(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
          items: const [
            DropdownMenuItem(value: 'child-1', child: Text('child-1')),
            DropdownMenuItem(value: 'child-2', child: Text('child-2')),
            DropdownMenuItem(value: 'child-3', child: Text('child-3')),
          ],
          onChanged: dropdownCallback,
          value: _dropdownValue,
          underline: Container(),
          dropdownColor: Colors.grey[100],
          isExpanded: true,
          borderRadius: BorderRadius.circular(5),
          focusColor: Colors.transparent,
        ));
  }
}
