import 'package:android_development/common/authForm.dart';
import 'package:android_development/screen/dashboard.dart';

import 'package:flutter/material.dart';

class SignUppage extends StatefulWidget {
  const SignUppage({super.key});

  @override
  State<SignUppage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignUppage> {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void submit() {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      if (newPasswordController.text.length < 8) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Password must be 8 characters long')));
      } else {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const DashBoard()));
      }
      return;
    }
  }

  void fbpressed() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const DashBoard()));
  }

  void loginpressed() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 212, 208, 208),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              color: Colors.white,
              elevation: 5,
              shadowColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: const BorderSide(color: Colors.white, width: 5),
              ),
              margin: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: AuthForm(
                    formKey: _formKey,
                    passwordController: newPasswordController,
                    buttonText: 'Sign Up',
                    buttonPressed: submit,
                    fbPressed: fbpressed,
                    showConfirmPassword: true,
                    confirmPasswordController: confirmPasswordController,
                    signPressed: loginpressed,
                    isLogin: false,
                    isSign: true,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
