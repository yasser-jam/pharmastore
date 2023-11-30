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
        const DrawerItem(text: 'Medicines', icon: 0xe60a),
        const DrawerItem(text: 'Pharmacies', icon: 0xf0147),
        const DrawerItem(text: 'Categories', icon: 0xe148),
      ],
    );
  }
}
