import 'dart:html';

import 'package:flutter/material.dart';
import 'package:project/routes/home_screen.dart';
import 'package:project/routes/login_screen.dart';
import 'package:project/routes/add_med_screen.dart';
import 'package:project/routes/med_screen.dart';
import 'package:project/routes/orders_screen.dart';
import 'package:project/routes/order_details_screen.dart';
import 'package:project/routes/home_screen.dart';

/// Flutter code sample for [AppBar].

void main() => runApp(PharmaStore());

class PharmaStore extends StatelessWidget {
  PharmaStore({super.key});

  // access token is the only cookie and the first one we have
  // Todo: find a better way to select access token from our cookies
  var cookies = document.cookie!.split('=');

  @override
  Widget build(BuildContext context) {
    String accessToken = '';
    bool hasAccessToken = false;

    if (cookies.length > 1) {
      accessToken = document.cookie!.split('=')[1];
      hasAccessToken = true;
    }

    var initialRoute = hasAccessToken ? HomeScreen.route : LoginScreen.route;

    return MaterialApp(
      initialRoute: initialRoute,
      routes: {
        HomeScreen.route: (ctx) => HomeScreen(),
        LoginScreen.route: (ctx) => LoginScreen(),
        AddMedScreen.route: (ctx) => const AddMedScreen(),
        MedScreen.route: (ctx) => const MedScreen(),
        OrdersScreen.route: (ctx) => OrdersScreen(),
        OrderDetailsScreen.route: (ctx) => OrderDetailsScreen(null)
      },
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 26, 144, 148),
        colorScheme: const ColorScheme.light(
          secondary: Color.fromARGB(255, 226, 170, 85),
        ),
      ),
    );
  }
}
