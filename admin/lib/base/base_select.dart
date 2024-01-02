import 'package:flutter/material.dart';

class BaseSelect extends StatefulWidget {
  const BaseSelect(this.refresh, this.value, this.options, {super.key});

  final String value;

  final Function refresh;

  final List<Map> options;

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

  dynamic getOptions() {
    List<DropdownMenuItem<String>> ls = [];
    widget.options.forEach((element) {
      ls.add(DropdownMenuItem(
          value: element['value'], child: Text(element['title'])));
    });
    return ls;
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
          items: getOptions(),
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
