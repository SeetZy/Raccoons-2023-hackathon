/*
  * Library imports
 */
import 'package:flutter/material.dart';
import 'package:app/utils/global.vars.dart';

class SoilpHLevels extends StatelessWidget {
  const SoilpHLevels({super.key});

  static final TextEditingController _soilPhController =
      TextEditingController(text: '5.5');

  static var currSoilPh = 0.0;

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
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Current soil pH:',
                  style: TextStyle(fontSize: 22),
                ),
                SizedBox(
                  width: 50,
                  height: 25,
                  child: TextFormField(
                    controller: _soilPhController,
                    keyboardType: TextInputType.number,
                    onChanged: (newValue) {
                      if (newValue.isNotEmpty) {
                        // Parse the input as a double and set it to currSoilPh
                        currSoilPh = double.tryParse(newValue) ?? 0.0;
                      } else {
                        // Handle the case when the input is empty or not a valid number
                        currSoilPh = 0.0;
                      }
                    },
                  ),
                ),
              ],
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
              'Needed soil pH:\n6.5-7.5',
              style: TextStyle(fontSize: 22),
            ),
          ),
        )
      ],
    );
  }
}
