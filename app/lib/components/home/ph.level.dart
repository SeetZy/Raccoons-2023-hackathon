/*
  * Library imports
 */
import 'package:flutter/material.dart';
import 'package:app/utils/global.vars.dart';

class SoilpHLevels extends StatelessWidget {
  const SoilpHLevels({super.key});

  static const currSoilPh = 5;
  static const wantedSoilPh = 6;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // Current pH levels in soil
        Container(
          decoration: BoxDecoration(
            color: GlobalVariables.secondaryColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              'Current soil pH:\n$currSoilPh',
              style: TextStyle(fontSize: 22),
            ),
          ),
        ),

        // Wanted pH levels in soil
        Container(
          decoration: BoxDecoration(
            color: GlobalVariables.secondaryColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              'Needed soil pH:\n$wantedSoilPh',
              style: TextStyle(fontSize: 22),
            ),
          ),
        )
      ],
    );
  }
}
