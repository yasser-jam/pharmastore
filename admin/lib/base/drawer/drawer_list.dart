import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:project/base/drawer/drawer_item.dart';

class DrawerList extends StatelessWidget {
  const DrawerList({super.key});

  @override
  build(ctx) {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.all(20),
            child: Row(children: [
              const Icon(
                Icons.mediation,
                color: Colors.white,
              ),
              const SizedBox(width: 10),
              Text(
                'Pharm Store',
                style: GoogleFonts.fugazOne(fontSize: 25, color: Colors.white),
              ),
            ])),
        const Divider(color: Colors.white),
        const DrawerItem(
            text: 'Medicines',
            icon: 0xe60a,
            link: '/med-list',
            detailsPage: true),
        const DrawerItem(
            text: 'Orders', icon: 0xf0147, link: '/orders', detailsPage: false),
        const DrawerItem(
            text: 'Categories', icon: 0xe148, link: '', detailsPage: false),
        SizedBox(height: 400),
        ListTile(
          onTap: () {
            Navigator.pushNamed(ctx, '/login');
          },
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
          leading: const Icon(
            Icons.login,
            color: Colors.white,
          ),
          title: Text(
            'Log out',
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
