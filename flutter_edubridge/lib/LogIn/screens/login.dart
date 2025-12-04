import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/input_field_pill.dart';
import '../widgets/text_pill.dart';
import '../screens/registration_screen.dart';
import '../../Dashboard/dashboard_screen.dart';
import '../../providers/auth_provider.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends ConsumerState<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;

  Future<void> _login() async {
    setState(() {
      isLoading = true;
    });

    final authService = ref.read(authServiceProvider);

    final error = await authService.login(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );

    setState(() {
      isLoading = false;
    });

    if (error == null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const DashboardScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error)),
      );
    }
  }

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
                  controller: emailController,
                  text: 'Email',
                  backgroundColor: const Color.fromARGB(255, 119, 187, 162),
                  textColor: Colors.white,
                  width: 410,
                  height: 62,
                  obscureText: false, 
                ),

                const SizedBox(height: 20),

                // Password Field
                InputFieldPill(
                  controller: passwordController,
                  text: 'Password',
                  backgroundColor: const Color.fromARGB(255, 119, 187, 162),
                  textColor: Colors.white,
                  width: 410,
                  height: 62,
                  obscureText: true, 
                ),

                const SizedBox(height: 20),

                // Login Button
                Center(
                  child: isLoading
                      ? const CircularProgressIndicator()
                      : GestureDetector(
                          onTap: _login,
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
