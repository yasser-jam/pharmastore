import 'package:flutter/material.dart';

class BaseTextField extends StatelessWidget {
  const BaseTextField(this.label, this.update, {super.key});

  final Function update;

  final String label;

  @override
  build(ctx) {
    return SizedBox(
      height: 45,
      child: TextField(
        onChanged: (value) {
          update(value);
        },
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: label,
        ),
      ),
    );
  }
}
