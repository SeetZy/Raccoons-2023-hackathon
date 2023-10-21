/*
  * Library imports
 */
import 'package:flutter/material.dart';

/*
  * Page/Component imports
 */
import 'package:app/components/home/substance.list.dart';
import 'package:app/components/home/ph.level.dart';

class SuggestedSubstances extends StatelessWidget {
  const SuggestedSubstances({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: buildSuggestedSubstances(),
    );
  }

  List<Widget> buildSuggestedSubstances() {
    // If the pH level is higher than needed
    if (SoilpHLevels.currSoilPh > SoilpHLevels.wantedSoilPh) {
      return [
        const Text(
          'Substances to reduce current pH levels per square meter:',
          style: TextStyle(fontSize: 22),
        ),
        const SubstanceList(
          substances: ['Sulfur Dioxide', 'Postassium', 'Calcium'],
          masses: ['2 grams', '10 grams', '8 grams'],
        ),
      ];

      // If the pH level is lower than wanted
    } else if (SoilpHLevels.currSoilPh < SoilpHLevels.wantedSoilPh) {
      return [
        const Text(
          'Substances to increase current pH levels per square meter:',
          style: TextStyle(fontSize: 22),
        ),
        const SubstanceList(
          substances: ['Sulfur Dioxide', 'Postassium', 'Calcium'],
          masses: ['2 grams', '10 grams', '8 grams'],
        )
      ];

      // If the pH level is the same as the wanted pH level
    } else {
      return [
        const Text(
          'There is no need to change the soil pH level',
          style: TextStyle(fontSize: 22),
        ),
      ];
    }
  }
}
