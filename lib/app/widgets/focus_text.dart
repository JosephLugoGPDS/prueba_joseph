import 'package:flutter/material.dart';
import 'package:joseph_prueba/app/constants.dart';

class FocusText extends StatelessWidget {
  const FocusText({
    Key? key,
    required this.text,
    this.textColor = Constants.redColor,
  }) : super(key: key);
  final String text;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.caption?.copyWith(
        color: textColor,
        height: 1.5,
      ),
    );
  }
}
