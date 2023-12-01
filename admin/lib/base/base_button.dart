import 'package:flutter/material.dart';

class BaseButton extends StatelessWidget {
  const BaseButton(
      {super.key,
      required this.type,
      required this.btnText,
      required this.onClick});

  final String type;
  final String btnText;

  final Function onClick;

  @override
  build(ctx) {
    return SizedBox(
      width: 125,
      height: 35,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: type == 'cancel'
                ? Color.fromARGB(255, 116, 119, 119)
                : const Color.fromARGB(255, 26, 144, 148)),
        onPressed: () {
          onClick();
        },
        child: Text(
          btnText,
          style: TextStyle(fontSize: 15),
        ),
      ),
    );
  }
}
