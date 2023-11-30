import 'package:flutter/material.dart';

class BaseTextField extends StatelessWidget {
  const BaseTextField({super.key});

  @override
  build(ctx) {
    return const SizedBox(
      height: 45,
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Scientific Name (en)',
        ),
      ),
    );
  }
}
