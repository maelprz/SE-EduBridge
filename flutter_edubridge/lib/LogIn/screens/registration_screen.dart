import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/input_field_pill.dart';
import '../widgets/text_pill.dart';
import '../widgets/button_pill.dart';
import 'login.dart';
import '../../providers/auth_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegistrationScreen extends ConsumerStatefulWidget {
  const RegistrationScreen({super.key});

  @override
  ConsumerState<RegistrationScreen> createState() => RegistrationScreenState();
}

class RegistrationScreenState extends ConsumerState<RegistrationScreen> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final birthdayController = TextEditingController(); // for display only
  final courseYearController = TextEditingController();

  DateTime? selectedBirthday; // REAL birthday value

  bool isLoading = false;

  Future<void> _pickBirthday() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        selectedBirthday = picked;
        birthdayController.text =
            "${picked.month}/${picked.day}/${picked.year}";
      });
    }
  }

  Future<void> _register() async {
    final firstName = firstNameController.text.trim();
    final lastName = lastNameController.text.trim();
    final email = emailController.text.trim();
    final username = usernameController.text.trim();
    final password = passwordController.text.trim();
    final courseYear = courseYearController.text.trim();

    // Validation
    if (firstName.isEmpty ||
        lastName.isEmpty ||
        email.isEmpty ||
        username.isEmpty ||
        password.isEmpty ||
        courseYear.isEmpty ||
        selectedBirthday == null) {
      _showMessage("Please fill in all fields.");
      return;
    }

    if (!email.contains("@") || !email.contains(".")) {
      _showMessage("Please enter a valid email address.");
      return;
    }

    if (password.length < 6) {
      _showMessage("Password must be at least 6 characters.");
      return;
    }

    setState(() => isLoading = true);

    final authService = ref.read(authServiceProvider);

    // Check if username is taken
    final usernameExists = await FirebaseFirestore.instance
        .collection("users")
        .where("username", isEqualTo: username)
        .limit(1)
        .get();

    if (usernameExists.docs.isNotEmpty) {
      setState(() => isLoading = false);
      _showMessage("Username is already taken. Choose another one.");
      return;
    }

    // Register via Auth Service
    final error = await authService.register(
      email: email,
      password: password,
      firstName: firstName,
      lastName: lastName,
      username: username,
      birthday: selectedBirthday!, // REAL DateTime
      courseYear: courseYear,
    );

    setState(() => isLoading = false);

    if (error == null) {
      _showMessage("Account created successfully!");

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    } else {
      _showMessage(error);
    }
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/login_registration/bg-pic.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),

                  Center(
                    child: TextPill(
                      text: "Join Us",
                      textColor: Color.fromARGB(255, 2, 95, 78),
                      textSize: 50,
                      width: 246,
                      height: 60,
                      fontWeight: FontWeight.w800,
                    ),
                  ),

                  Center(
                    child: TextPill(
                      text: "Create New Account",
                      textColor: Color.fromARGB(255, 2, 95, 78),
                      textSize: 30,
                      width: 300,
                      height: 35,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(height: 30),

                  Card(
                    color: Colors.white.withOpacity(0.95),
                    elevation: 8.0,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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

                          const SizedBox(height: 20),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InputFieldPill(
                                controller: firstNameController,
                                text: "First Name",
                                backgroundColor: Colors.white,
                                textColor: Colors.black87,
                                width: 170,
                                height: 50,
                              ),
                              InputFieldPill(
                                controller: lastNameController,
                                text: "Last Name",
                                backgroundColor: Colors.white,
                                textColor: Colors.black87,
                                width: 170,
                                height: 50,
                              ),
                            ],
                          ),

                          const SizedBox(height: 15),

                          InputFieldPill(
                            controller: emailController,
                            text: 'Email Address',
                            backgroundColor: Colors.white,
                            textColor: Colors.black87,
                            width: double.infinity,
                            height: 50,
                          ),

                          const SizedBox(height: 15),

                          InputFieldPill(
                            controller: usernameController,
                            text: 'Username',
                            backgroundColor: Colors.white,
                            textColor: Colors.black87,
                            width: double.infinity,
                            height: 50,
                          ),

                          const SizedBox(height: 15),

                          InputFieldPill(
                            controller: passwordController,
                            text: 'Enter Password',
                            backgroundColor: Colors.white,
                            textColor: Colors.black87,
                            width: double.infinity,
                            height: 50,
                            obscureText: true,
                          ),

                          const SizedBox(height: 20),

                          // Birthday Picker
                          GestureDetector(
                            onTap: _pickBirthday,
                            child: AbsorbPointer(
                              child: InputFieldPill(
                                controller: birthdayController,
                                text: 'Birthday',
                                backgroundColor: Colors.white,
                                textColor: Colors.black87,
                                width: double.infinity,
                                height: 50,
                              ),
                            ),
                          ),

                          const SizedBox(height: 20),

                          InputFieldPill(
                            controller: courseYearController,
                            text: 'Course & Year',
                            backgroundColor: Colors.white,
                            textColor: Colors.black87,
                            width: double.infinity,
                            height: 50,
                          ),

                          const SizedBox(height: 25),

                          Center(
                            child: isLoading
                                ? const CircularProgressIndicator()
                                : ButtonPill(
                                    text: "Register",
                                    backgroundColor: Colors.teal.shade700,
                                    textColor: Colors.white,
                                    textSize: 20,
                                    width: 352,
                                    height: 50,
                                    fontWeight: FontWeight.w800,
                                    onPressed: _register,
                                  ),
                          ),

                          const SizedBox(height: 10),

                          Center(
                            child: ButtonPill(
                              text: "Back to Login",
                              backgroundColor: Color.fromARGB(255, 202, 202, 202),
                              textColor: Colors.teal.shade700,
                              textSize: 20,
                              width: 352,
                              height: 50,
                              fontWeight: FontWeight.w800,
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginScreen()),
                                );
                              },
                            ),
                          ),

                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
