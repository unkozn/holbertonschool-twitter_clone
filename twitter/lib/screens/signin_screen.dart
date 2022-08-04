import 'package:flutter/material.dart';
import 'package:twitter/screens/forgot_password_screen.dart';
import 'package:twitter/screens/home_screen.dart';
import 'package:twitter/screens/signup_screen.dart';
import 'package:twitter/widgets/entry_field.dart';
import 'package:twitter/widgets/flat_button.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    _emailController = _emailController;
    _passwordController = _passwordController;
    super.initState();
  }

  @override
  void dispose() {
    _emailController = _emailController;
    _passwordController = _passwordController;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,

      body: Column(
        children: [
          Container(
              margin: const EdgeInsets.only(top: 60),
              height: 70,
              child: const Center(
                child: Text('Sign In', style: TextStyle(
                  fontSize: 30, fontWeight: FontWeight.bold,
                ),
                ),
              )
          ),
          Container(
            height: 70,
            margin: const EdgeInsets.only(top: 10, bottom: 10),
            child: Image.network('http://assets.stickpng.com/images/580b57fcd9996e24bc43c53e.png',
            ),
          ),
          CustomEntryField(
            hint: 'Enter email',
            controller: _emailController,
            isPassword: false,
          ),
          CustomEntryField(
            hint: 'Enter password',
            controller: _passwordController,
            isPassword: true,
          ),
          Center(
            child: CustomFlatButton(
              label: "Submit",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          GestureDetector(
              onTap: (() {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUp()),
                );
              }),
              child: const Center(
                child: Text(
                  'Sign up',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              )),
          const SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: (() {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ForgetPassword()),
              );
            }),
            child: const Center(
              child: Text(
                'Forget password?',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          )
        ],
      ),
    );
  }
}
