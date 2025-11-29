import 'package:flutter/material.dart';
import '../widgets/input_field_pill.dart';
import '../widgets/text_pill.dart';
import '../widgets/button_pill.dart';
import 'login.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => RegistrationScreenState();
}

class RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/login_registration/bg-pic.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 30),
                Center(
                  child: TextPill(
                    text: "Join Us",
                    textColor: const Color.fromARGB(255, 2, 95, 78),
                    textSize: 50,
                    width: 246,
                    height: 60,
                    fontWeight: FontWeight.w800,
                  ),
                ),

                Center(
                  child: TextPill(
                    text: "Create New Account",
                    textColor: const Color.fromARGB(255, 2, 95, 78),
                    textSize: 30,
                    width: 300,
                    height: 35,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 30),

                SizedBox(
                  height: 700,
                  width: 600,
                  child: Card(
                    color: Colors.white,
                    elevation: 8.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(height: 20),
                        Center(
                          child: TextPill(
                            text: "Personal Info",
                            textColor: Colors.black,
                            textSize: 28,
                            width: 250,
                            height: 50,
                            fontWeight: FontWeight.w800,
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 15),
                          child: TextPill(
                            text: "Your Name",
                            textColor: Colors.black,
                            textSize: 15,
                            width: 100,
                            height: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InputFieldPill(
                                text: "First Name",
                                backgroundColor: const Color.fromARGB(
                                  255,
                                  255,
                                  255,
                                  255,
                                ),
                                textColor: const Color.fromARGB(
                                  255,
                                  100,
                                  100,
                                  100,
                                ),
                                width: 170,
                                height: 50,
                              ),

                              InputFieldPill(
                                text: "Last Name",
                                backgroundColor: Colors.white,
                                textColor: const Color.fromARGB(
                                  255,
                                  100,
                                  100,
                                  100,
                                ),
                                width: 170,
                                height: 50,
                              ),
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 15),
                          child: TextPill(
                            text: "Email Address",
                            textColor: Colors.black,
                            textSize: 15,
                            width: 120,
                            height: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 25,
                            vertical: 10,
                          ),
                          child: InputFieldPill(
                            text: 'Enter Email Address',
                            backgroundColor: Colors.white,
                            textColor: const Color.fromARGB(255, 100, 100, 100),
                            width: 600,
                            height: 50,
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 15),
                          child: TextPill(
                            text: "Username",
                            textColor: Colors.black,
                            textSize: 15,
                            width: 105,
                            height: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 25,
                            vertical: 10,
                          ),
                          child: InputFieldPill(
                            text: 'Enter Username',
                            backgroundColor: Colors.white,
                            textColor: const Color.fromARGB(255, 100, 100, 100),
                            width: 600,
                            height: 50,
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 15),
                          child: TextPill(
                            text: "Password",
                            textColor: Colors.black,
                            textSize: 15,
                            width: 105,
                            height: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 25,
                            vertical: 10,
                          ),
                          child: InputFieldPill(
                            text: 'Enter Password',
                            backgroundColor: Colors.white,
                            textColor: const Color.fromARGB(255, 100, 100, 100),
                            width: 600,
                            height: 50,
                          ),
                        ),
                        SizedBox(height: 20),
                        Center(
                          child: ButtonPill(
                            text: "Register",
                            backgroundColor: Colors.teal.shade700,
                            textColor: Colors.white,
                            textSize: 20,
                            width: 352,
                            height: 50,
                            fontWeight: FontWeight.w800,
                          ),
                        ),

                        SizedBox(height: 10),

                        Center(
                          child: ButtonPill(
                            text: "Back to Login",
                            backgroundColor: const Color.fromARGB(
                              255,
                              202,
                              202,
                              202,
                            ),
                            textColor: Colors.teal.shade700,
                            textSize: 20,
                            width: 352,
                            height: 50,
                            fontWeight: FontWeight.w800,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
