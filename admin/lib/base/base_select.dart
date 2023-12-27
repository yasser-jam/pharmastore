import 'package:flutter/material.dart';

class BaseSelect extends StatefulWidget {
  const BaseSelect(this.refresh, this.value, {super.key});

  final String value;

  final Function refresh;

  @override
  State<BaseSelect> createState() {
    return _BaseSelectState();
  }
}

class _BaseSelectState extends State<BaseSelect> {
  String _dropdownValue = '';

  void initState() {
    _dropdownValue = widget.value;
  }

  void dropdownCallback(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        _dropdownValue = selectedValue;
      });
      widget.refresh(selectedValue);
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
            DropdownMenuItem(value: '1', child: Text('Pain Reliever')),
            DropdownMenuItem(value: '2', child: Text('Stimulant')),
            DropdownMenuItem(value: '3', child: Text('Stimulant')),
            DropdownMenuItem(value: '4', child: Text('Antibiotic')),
            DropdownMenuItem(value: '', child: Text('All')),
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
