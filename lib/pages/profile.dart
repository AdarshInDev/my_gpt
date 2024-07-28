// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:mygpt/auth_page.dart';
import 'package:firebase_in_app_messaging/firebase_in_app_messaging.dart';
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Container(
          color: Colors.amber[200],
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              const Text("Email :"),
              const SizedBox(height: 15),
              const Text("Username :"),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AuthPage()));
                  },
                  child: const Text("logout click here"))
            ],
          )),
    ));
  }
}
