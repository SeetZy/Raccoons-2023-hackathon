/*
  * Library import
 */
import 'package:app/components/options.buttons.dart';
import 'package:flutter/material.dart';

class SubstanceComponent extends StatelessWidget {
  const SubstanceComponent(
      {super.key, required this.title, required this.pressed});

  final String title;
  final void Function() pressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Button to navigate to the description page
          OptionsButtons(pressed: pressed, title: 'Select'),

          // Substance name
          SizedBox(
            width: 200,
            child: Column(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
