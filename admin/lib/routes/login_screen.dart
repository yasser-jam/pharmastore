import 'dart:convert';
import 'dart:html';
import 'package:project/routes/med_screen.dart';
import 'package:project/routes/add_med_screen.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:http/http.dart' as http;

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  static const String route = '/login';

  var phoneNumber;
  var password;

  void login(dynamic ctx) async {
    try {
      var url = Uri.http('localhost:8000', 'api/webLogin');
      var response = await http
          .post(url, body: {'phoneNumber': phoneNumber, 'password': password});

      var resBody = jsonDecode(response.body) as Map<String, dynamic>;

      // setting access token in cookie
      document.cookie = "access_token=" + resBody['access_token'];

      Navigator.push(
        ctx,
        MaterialPageRoute(
          builder: (context) => const MedScreen(),
        ),
      );
    } finally {}
  }

  @override
  build(ctx) {
    return Scaffold(
        body: Row(
      children: [
        Expanded(
          child: Container(
              color: Color.fromARGB(234, 241, 243, 255),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    // const Icon(Icons.medical_services,
                    //     color: Color.fromARGB(255, 93, 237, 241), size: 50),
                    // const SizedBox(width: 10),
                    Text('Medical Bay',
                        style: GoogleFonts.fugazOne(
                            fontSize: 40,
                            // color: Color.fromARGB(255, 155, 96, 96))
                            // color: const Color.fromARGB(255, 93, 237, 241))),
                            color: const Color.fromARGB(255, 44, 235, 241))),
                  ]),
                  const SizedBox(height: 50),
                  Image.asset(
                    'login.png',
                  )
                ],
              )),
        ),
        Expanded(
            child: Container(
                child: Padding(
          padding: const EdgeInsets.only(left: 150, right: 150),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Log-in',
                  style: GoogleFonts.roboto(
                      // color: Color.fromARGB(255, 93, 237, 241),
                      color: const Color.fromARGB(255, 44, 235, 241),
                      fontSize: 40,
                      fontWeight: FontWeight.w700)),
              const SizedBox(height: 40),
              TextField(
                onChanged: (value) => {phoneNumber = value},
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Phone Number',
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                onChanged: (value) => {password = value},
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 145,
                height: 45,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 44, 235, 241)),
                  onPressed: () {
                    login(ctx);
                    // Navigator.of(ctx).pushNamed(AddMedScreen.route);
                  },
                  child: const Text(
                    'Log-In',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              )
            ],
          ),
        )))
      ],
    ));
  }
}
