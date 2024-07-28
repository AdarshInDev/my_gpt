// ignore_for_file: use_build_context_synchronously, avoid_print, unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mygpt/chat_page.dart';
import 'package:mygpt/pages/sign_up.dart';
import 'package:firebase_in_app_messaging/firebase_in_app_messaging.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final TextEditingController emailInput = TextEditingController();

  final TextEditingController passInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Container(
              height: h,
              width: w,
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 120,
                    color: Colors.transparent,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: SvgPicture.asset(
                        "assets/images-login/Vector_1.svg",
                        height: 120,
                        width: w,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    width: 203,
                    height: 83,
                    child: Text(
                      'Hello',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF262626),
                        fontSize: 64,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    width: 203,
                    height: 26,
                    child: Text(
                      'Sign in to your account',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF262626),
                        fontSize: 18,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 300,
                    height: 50,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFF5F5F5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x19000000),
                          blurRadius: 20,
                          offset: Offset(0, 8),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 15,
                        ),
                        SvgPicture.asset(
                          "assets/images-login/profile.svg",
                          // height: 24,
                          // width: 24,
                        ),
                        SizedBox(
                          height: 40,
                          width: 250,
                          child: TextFormField(
                            keyboardType: TextInputType
                                .emailAddress, // Set keyboard type to email

                            textInputAction: TextInputAction.next,
                            controller: emailInput,
                            cursorColor: const Color.fromARGB(255, 155, 45, 45),
                            style: GoogleFonts.getFont(
                              'Poppins',
                              textStyle: const TextStyle(
                                  color: Color.fromARGB(255, 154, 43, 43),
                                  fontSize: 15),
                            ),
                            decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 0.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 0.0),
                              ),
                              label: Text(
                                'Email',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 52, 3, 3),
                                  fontSize: 15,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  Container(
                    width: 300,
                    height: 50,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFF5F5F5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x19000000),
                          blurRadius: 20,
                          offset: Offset(0, 8),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 15,
                        ),
                        SvgPicture.asset(
                          "assets/images-login/lock.svg",
                          // height: 24,
                          // width: 24,
                        ),
                        Container(
                          color: Colors.transparent,
                          height: 40,
                          width: 250,
                          child: TextFormField(
                            obscureText: true, // Hide password text
                            textInputAction: TextInputAction.done,

                            controller: passInput,
                            cursorColor: const Color.fromARGB(255, 155, 45, 45),
                            style: GoogleFonts.getFont(
                              'Poppins',
                              textStyle: const TextStyle(
                                  color: Color.fromARGB(255, 154, 43, 43),
                                  fontSize: 15),
                            ),
                            decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 0.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 0.0),
                              ),
                              label: Text(
                                'Password',
                                style: TextStyle(
                                  color: Color(0xFFC7C7C7),
                                  fontSize: 15,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(180, 2, 45, 2),
                    child: Container(
                      color: Colors.transparent,
                      width: 160,
                      height: 24,
                      child: const Text(
                        'Forgot your password?',
                        style: TextStyle(
                          color: Color(0xFFBEBEBE),
                          fontSize: 15,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(170, 0, 45, 0),
                    child: Container(
                      color: Colors.transparent,
                      width: 190,
                      height: 70,
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 80,
                            height: 34,
                            child: Text(
                              'Sign in',
                              style: TextStyle(
                                color: Color(0xFF262626),
                                fontSize: 25,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          InkWell(
                            onTap: signIn,
                            child: SvgPicture.asset(
                              "assets/images-login/forward_btn.svg",
                              height: 44,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.transparent,
                    height: 95,
                  ),
                  SizedBox(
                    width: 209,
                    height: 24,
                    child: Row(
                      children: [
                        const Text(
                          'Don’t have an account? ',
                          style: TextStyle(
                            color: Color(0xFF262626),
                            fontSize: 15,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignupPage(),
                              ),
                            );
                          },
                          child: const Text(
                            'Create',
                            style: TextStyle(
                              color: Color.fromARGB(255, 1, 1, 129),
                              fontSize: 15,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 40,
                    color: Colors.transparent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/images-login/github-circle.svg",
                          height: 33,
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        SvgPicture.asset(
                          "assets/images-login/google.svg",
                          height: 33,
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        SvgPicture.asset(
                          "assets/images-login/instagram.svg",
                          height: 32,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Positioned(
                bottom: 0,
                child: SvgPicture.asset("assets/images-login/Vector_2_2.svg"))
          ],
        ),
      ),
    );
  }

  void signIn() async {
    String email = emailInput.text;
    String password = passInput.text;
    // ignore: unused_local_variable

    try {
      // ignore: unused_local_variable, unnecessary_nullable_for_final_variable_declarations
      final UserCredential? credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      if (credential != null) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const ChatPage()),
            (route) => false);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
}
