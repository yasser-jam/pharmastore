import 'dart:html';

import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem(
      {super.key,
      required this.text,
      required this.icon,
      required this.link,
      required this.detailsPage});

  final String text;
  final int icon;
  final String link;
  final bool detailsPage;

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
          onTap: () {
            Navigator.pushNamed(ctx, link);
          },
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
        detailsPage
            ? ListTile(
                onTap: () {
                  Navigator.pushNamed(ctx, link + '/details');
                },
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
                leading: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                title: Text('Create ' + text,
                    style: const TextStyle(color: Colors.white)),
              )
            : Text(''),
      ],
    );
  }
}
