// ignore_for_file: use_build_context_synchronously, avoid_print, unnecessary_nullable_for_final_variable_declarations

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mygpt/auth_page.dart';
import 'package:mygpt/chat_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  TextEditingController userInput = TextEditingController();
  TextEditingController passInput = TextEditingController();
  TextEditingController emailInput = TextEditingController();

  @override
  void dispose() {
    userInput.dispose();
    passInput.dispose();
    emailInput.dispose();
    super.dispose();
  }

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
                        height: 119,
                        width: w,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    width: 300,
                    height: 41,
                    child: Text(
                      'Create Account',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF262626),
                        fontSize: 30,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
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
                          height: 20,
                          width: 250,
                          child: TextFormField(
                            keyboardType: TextInputType
                                .emailAddress, // Set keyboard type to email

                            textInputAction: TextInputAction.next,
                            controller: userInput,
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
                                'Username',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 103, 25, 25),
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
                    height: 25,
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
                            textInputAction: TextInputAction.next,

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
                  const SizedBox(height: 25),
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
                          "assets/images-login/Email.svg",
                          // height: 24,
                          // width: 24,
                        ),
                        Container(
                          color: Colors.transparent,
                          height: 40,
                          width: 250,
                          child: TextFormField(
                            obscureText: false, // Hide password text
                            textInputAction: TextInputAction.done,

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
                                'E-mail',
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
                  const SizedBox(height: 30),
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
                              'Create',
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
                            onTap: signUp,
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
                    width: 220,
                    height: 24,
                    child: Row(
                      children: [
                        const Text(
                          'Already have an account? ',
                          style: TextStyle(
                            color: Color(0xFF262626),
                            fontSize: 15,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                        InkWell(
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 34, 10, 170),
                                  fontSize: 15,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                  decorationStyle: TextDecorationStyle.dashed),
                            ),
                            onTap: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => const AuthPage())),
                                  (route) => false);
                            }),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
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

  void signUp() async {
    String email = emailInput.text;
    String password = passInput.text;
    // ignore: unused_local_variable
    String username = userInput.text;

    try {
      // ignore: unused_local_variable
      final UserCredential? credential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      if (credential != null) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: ((context) => const ChatPage())),
            (route) => false);
      } else {
        print("some error occured while creating");
      }
    } on FirebaseAuthException catch (e) {
      print(e.code);
    }
  }
}
