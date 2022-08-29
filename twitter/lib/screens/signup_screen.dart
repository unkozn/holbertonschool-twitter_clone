import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:twitter/screens/signin_screen.dart';
import 'package:twitter/widgets/entry_field.dart';
import 'package:twitter/widgets/flat_button.dart';
import '../providers/auth_state.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmController = TextEditingController();

  @override
  void initState() {
    _nameController = _nameController;
    _passwordController = _passwordController;
    _emailController = _emailController;
    _confirmController = _confirmController;

    super.initState();
  }

  @override
  void dispose() {
    _nameController = _nameController;
    _passwordController = _passwordController;
    _emailController = _emailController;
    _confirmController = _confirmController;

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 246, 246),
      appBar: AppBar(
        leading: BackButton(
          color: Colors.blue,
          onPressed: (() {
            Navigator.of(context).pop();
          }),
        ),
        elevation: 0.0,
        backgroundColor: const Color.fromARGB(255, 247, 246, 246),
        centerTitle: true,
        title: const Text(
          "Sign up",
          style: TextStyle(color: Colors.black, fontSize: 23),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 75,
              margin: const EdgeInsets.all(20),
              child: Image.asset('assets/images/twitter_logo.png'),
            ),
            CustomEntryField(hint: 'Enter name', controller: _nameController, isPassword: false),
            CustomEntryField(hint: 'Enter email', controller: _emailController, isPassword: false),
            CustomEntryField(hint: 'Enter password', controller: _passwordController, isPassword: true),
            CustomEntryField(hint: 'Confirm password', controller: _confirmController, isPassword: true),
            Center(
                child: CustomFlatButton(
                    label: 'Submit',
                    onPressed: signUpUser,
                ),
            )
          ],
        ),
      ),
    );
  }

  void signUpUser() async {
    final ifSignUp = await Auth().attemptSignUp(
        email: _emailController.text.trim(),
        name: _nameController.text.trim(),
        password: _passwordController.text.trim(),
        passwordConfirmation: _confirmController.text.trim()
    );
    String errorMsg = '';
    switch (ifSignUp) {
      case Errors.none:
        errorMsg = 'Account Created!';
        break;
      case Errors.weakError:
        errorMsg = 'The password provided is too weak.';
        break;
      case Errors.matchError:
        errorMsg = 'Passwords doesn’t match.';
        break;
      case Errors.existsError:
        errorMsg = 'An account already exists with that email.';
        break;
      case Errors.error:
        errorMsg = 'Failed to Login! Please try later.';
        break;
      default:
        errorMsg = 'Unknown error';
    }
    final snackBar = SnackBar(
      content: Text(errorMsg),
      backgroundColor: ifSignUp == Errors.none ? Colors.green : Colors.red,
      action: SnackBarAction(
        label: '',
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}