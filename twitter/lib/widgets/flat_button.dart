import 'package:flutter/material.dart';

class CustomFlatButton extends StatelessWidget {
  final String label;
  final Function onPressed;

  const CustomFlatButton({
    Key? key,
    required this.label,
    required this.onPressed(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(50, 15, 50, 0),
        child: TextButton(
            onPressed: () {
              onPressed();
            },
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ))),
            child: Center(
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                ),
              ),
            )),
    );
  }
}