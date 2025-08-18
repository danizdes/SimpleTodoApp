import "package:flutter/material.dart";

class myButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  myButton({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Colors.blueGrey[300],
      child: Text(text),
      );
  }
}