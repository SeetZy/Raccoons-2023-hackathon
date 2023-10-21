/*
  * Library import
 */
import 'package:flutter/material.dart';

/*
  * Page/Component imports
 */
import 'package:app/components/options.buttons.dart';

class SubstanceComponent extends StatelessWidget {
  const SubstanceComponent(
      {super.key,
      required this.title,
      required this.pressed,
      required this.desc});

  final String title;
  final String desc;
  final VoidCallback pressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Button to navigate to the description page
          OptionsButtons(pressed: pressed, title: 'Info'),

          // Substance name
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 1.5, color: Colors.grey[300]!),
              ),
            ),
            child: SizedBox(
              width: 200,
              height: 80,
              child: Column(
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    desc,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
