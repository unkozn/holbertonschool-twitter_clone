import 'package:flutter/material.dart';

class CustomFlatButton extends StatelessWidget {
  final String label;
  final Function onPressed;

  CustomFlatButton({
    Key? key,
    required this.label,
    required this.onPressed(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.fromLTRB(50, 15, 50, 0),
        child: TextButton(
            child: Center(
              child: Container(
                child: Text(
                  label,
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w800
                  ),
                ),
              ),
            ),
            onPressed: () {
              onPressed();
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    )))),
      ),
    );
  }
}