/*
  * Library imports
 */
import 'package:flutter/material.dart';
import 'package:app/utils/substance.data.dart';

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
          'Substances to reduce current pH levels (grams per square meter):',
          style: TextStyle(fontSize: 22, color: Colors.black),
        ),
        const SubstanceList(
          substances: [
            SubstanceData.sulAcid,
            SubstanceData.hydAcid,
            SubstanceData.phosAcid
          ],
          masses: ['2 g', '10 g', '8 g'],
        ),
      ];

      // If the pH level is lower than wanted
    } else if (SoilpHLevels.currSoilPh < SoilpHLevels.wantedSoilPh) {
      return [
        const Text(
          'Substances to increase current pH levels (grams per square meter):',
          style: TextStyle(fontSize: 22, color: Colors.black),
        ),
        const SubstanceList(
          substances: [
            SubstanceData.magHyd,
            SubstanceData.ammHyd,
            SubstanceData.potHyd
          ],
          masses: ['2 g', '10 g', '8 g'],
        )
      ];

      // If the pH level is the same as the wanted pH level
    } else {
      return [
        const Text(
          'There is no need to change the soil pH level',
          style: TextStyle(fontSize: 22, color: Colors.black),
        ),
      ];
    }
  }
}
