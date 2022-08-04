import 'package:flutter/material.dart';

class CustomEntryField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final bool isPassword;

  const CustomEntryField(
      {Key? key,
        required this.hint,
        required this.controller,
        required this.isPassword})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        style: const TextStyle(fontSize: 20),
        decoration: InputDecoration(
            filled: false,
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.grey),
            contentPadding: const EdgeInsets.fromLTRB(36, 16, 36, 16),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade200),
              borderRadius: BorderRadius.circular(30),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade200),
              borderRadius: BorderRadius.circular(30),
            ),
        ),
      ),
    );
  }
}
