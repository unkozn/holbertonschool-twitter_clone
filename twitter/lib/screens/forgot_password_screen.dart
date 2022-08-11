import 'package:flutter/material.dart';
import 'package:twitter/widgets/entry_field.dart';
import 'package:twitter/widgets/flat_button.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    _emailController = _emailController;
    super.initState();
  }

  @override
  void dispose() {
    _emailController = _emailController;
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
          'Forget password',
          style: TextStyle(color: Colors.black, fontSize: 23),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 120,
            ),
            const Center(
              child: Text(
                  'Forget password',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 30,
                    //backgroundColor: Colors.white,
                  ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 15, 25, 5),
              child: Text(
                'Enter your email address below to receive password reset instructions.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 16,
                  backgroundColor: const Color.fromARGB(255, 247, 246, 246),
                ),
              ),
            ),
            Center(
              child: CustomEntryField(
                hint: 'Enter email',
                controller: _emailController,
                isPassword: false,
              ),
            ),
            Center(
              child: CustomFlatButton(label: 'Submit', onPressed: () {}),
            )
          ],
        ),
      ),
    );
  }
}
