/*
  * Library imports
 */
import 'package:flutter/material.dart';

class OptionsButtons extends StatelessWidget {
  const OptionsButtons({super.key, required this.pressed, required this.title});

  final void Function() pressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 95,
      height: 30,
      child: OutlinedButton(
        onPressed: () => pressed(),
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        child: Text(title),
      ),
    );
  }
}
