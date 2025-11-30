import 'package:flutter/material.dart';
import '../widgets/input_field_pill.dart';
import '../widgets/text_pill.dart';
import '../screens/registration_screen.dart';
import '../../Dashboard/dashboard_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
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
                // Top Row with Sign Up
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegistrationScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Color.fromARGB(255, 2, 95, 78),
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),

                Image.asset(
                  'assets/login_registration/logo.png',
                  width: 247,
                  height: 247,
                ),

                TextPill(
                  text: "Login",
                  textColor: const Color.fromARGB(255, 2, 95, 78),
                  width: 113,
                  height: 62,
                  textSize: 32,
                ),

                TextPill(
                  text: "Sign in to continue",
                  textColor: const Color.fromARGB(255, 2, 95, 78),
                  width: 207,
                  height: 33,
                  textSize: 23,
                ),

                const SizedBox(height: 30),
                // Email Field
                InputFieldPill(
                  text: 'Email',
                  backgroundColor: const Color.fromARGB(255, 119, 187, 162),
                  textColor: Colors.white,
                  width: 410,
                  height: 62,
                ),

                const SizedBox(height: 20),

                InputFieldPill(
                  text: 'Password',
                  backgroundColor: const Color.fromARGB(255, 119, 187, 162),
                  textColor: Colors.white,
                  width: 410,
                  height: 62,
                ),

                const SizedBox(height: 20),

                // Login Button
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const DashboardScreen(),
                      ),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    decoration: BoxDecoration(
                      color: Colors.teal.shade700,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: const Center(
                      child: Text(
                        "Log In",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),

                const Spacer(),

                // Bottom Text
                Column(
                  children: const [
                    Text(
                      "Forgot Password",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Color.fromARGB(255, 2, 95, 78),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "www.edubridge.com",
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 2, 95, 78),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
