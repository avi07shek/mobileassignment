import 'package:flutter/material.dart';
import 'package:android_development/common/authForm.dart';
import 'package:android_development/screen/dashboard.dart';
import 'sign_up_page.dart';  // Assuming this is where your SignUp page is located

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void submit() {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      // Implement your authentication logic here
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const DashBoard()));
    }
  }

  void fbpressed() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const DashBoard()));
  }

  void signUpPressed() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const SignUppage()));
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
                    emailController: emailController,
                    passwordController: passwordController,
                    buttonText: 'Login',
                    buttonPressed: submit,
                    fbPressed: fbpressed,
                    showConfirmPassword: false,
                    signPressed: signUpPressed,
                    isLogin: true,
                    isSign: false,
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
