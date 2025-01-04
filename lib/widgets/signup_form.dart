import 'package:flutter/material.dart';

import '../main.dart';


class SignUpFormPage extends StatefulWidget {
  const SignUpFormPage({super.key});

  @override
  State<SignUpFormPage> createState() => _SignUpFormPageState();
}

class _SignUpFormPageState extends State<SignUpFormPage> {
  // practise on applying more on forms video

  bool obscureText = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  /// show and hide password function
  void togglePassword() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  String? validateEmail(value) {
    if (!value.contains('@')) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value!.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value != passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  String? validateName(String? value) {
    if (value?[0] != value?[0].toUpperCase()) {
      return 'First character must be capitalized';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // Full Name
          TextFormField(
            controller: nameController,
            decoration: const InputDecoration(
              labelText: 'Full Name',
              prefixIcon: Icon(Icons.person),
            ),
            validator: validateName,
          ),
          const SizedBox(height: 16),
          // E-mail
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(
              labelText: 'Email',
              prefixIcon: Icon(Icons.email),
            ),
            validator: validateEmail,
          ),
          const SizedBox(height: 16),

          // Password
          TextFormField(
            controller: passwordController,
            obscureText: obscureText,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.lock),
              labelText: 'Password',
              suffixIcon: IconButton(
                onPressed: togglePassword,
                icon:
                    Icon(obscureText ? Icons.visibility_off : Icons.visibility),
              ),
            ),
            validator: validatePassword,
          ),
          const SizedBox(height: 16),
          /// Confirm password
          TextFormField(
            controller: confirmPasswordController,
            obscureText: obscureText,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.lock),
              labelText: 'Confirm Password',
              suffixIcon: IconButton(
                onPressed: togglePassword,
                icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility),
              ),
            ),
            validator: validateConfirmPassword,
          ),
          const SizedBox(height: 16),

          // Signup Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Sucess'),
                        content: const Text("Account Created successfully"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => const MainScreen()),);
                            },
                            child: Text('Okay'),
                          )
                        ],
                      );
                    },
                  );
                } else {
                  String errorMessage = '';
                  if (validateName(nameController.text) != null) {
                    errorMessage = validateName(nameController.text)!;
                  } else if (validateEmail(emailController.text) != null) {
                    errorMessage = validateEmail(emailController.text)!;
                  } else if (validatePassword(passwordController.text) !=
                      null) {
                    errorMessage = validatePassword(passwordController.text)!;
                  } else if (validateName(confirmPasswordController.text) != null) {
                    errorMessage = validateName(confirmPasswordController.text)!;
                  }
                  else {
                    errorMessage = 'Enter valid data';
                  }
                  SnackBar snackBar = SnackBar(
                    content: Text(errorMessage),
                    duration: const Duration(seconds: 2),
                    action: SnackBarAction(
                      label: "ok",
                      onPressed: () {},
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              child: const Text('Create Account'),
            ),
          ),
        ],
      ),
    );
  }
}
