import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomElevetedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;

  CustomElevetedButton({
    this.onPressed,
    this.text = "",
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
