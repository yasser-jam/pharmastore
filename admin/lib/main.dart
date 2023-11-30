import 'dart:html';

import 'package:flutter/material.dart';
import 'package:project/routes/login_screen.dart';
import 'package:project/routes/med_screen.dart';
import 'package:project/routes/med_list.dart';

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

    var initialRoute = hasAccessToken ? MedList.route : LoginScreen.route;

    return MaterialApp(
      initialRoute: initialRoute,
      routes: {
        LoginScreen.route: (ctx) => LoginScreen(),
        MedScreen.route: (ctx) => const MedScreen(),
        MedList.route: (ctx) => MedList()
      },
    );
  }
}
