import 'dart:html';

import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({super.key, required this.text, required this.icon});

  final String text;
  final int icon;

  @override
  build(ctx) {
    return ExpansionTile(
      collapsedTextColor: Colors.white,
      collapsedIconColor: Colors.white,
      iconColor: Colors.white,
      leading: Icon(
        IconData(icon, fontFamily: 'MaterialIcons'),
        color: Colors.white,
      ),
      title: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
      children: <Widget>[
        ListTile(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
          leading: const Icon(
            Icons.list,
            color: Colors.white,
          ),
          title: Text(
            'List ' + text,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        ListTile(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
          leading: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          title: Text('Create ' + text,
              style: const TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
