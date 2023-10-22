// ignore_for_file: library_private_types_in_public_api

/*
  * Library imports
 */
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:app/utils/substance.data.dart';
import 'package:app/components/home/ph.level.dart';

/*
  * Page/Component imports
 */
import 'package:app/components/home/substance.list.dart';

class SuggestedSubstances extends StatefulWidget {
  const SuggestedSubstances({super.key});

  @override
  _SuggestedSubstancesState createState() => _SuggestedSubstancesState();
}

class _SuggestedSubstancesState extends State<SuggestedSubstances> {
  final double lowerBound = 6.5;
  final double upperBound = 7.5;
  double currentSoilPh = 0.0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      if (mounted) {
        setState(() {
          currentSoilPh = SoilpHLevels.currSoilPh;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: buildSuggestedSubstances(),
    );
  }

  List<Widget> buildSuggestedSubstances() {
    // If the pH level is higher than needed
    if (currentSoilPh > upperBound) {
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
    } else if (currentSoilPh < lowerBound) {
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
    } else if (currentSoilPh >= lowerBound && currentSoilPh <= upperBound) {
      return [
        const SizedBox(
          height: 202,
          child: Text(
            'There is no need to change the soil pH level',
            style: TextStyle(fontSize: 22, color: Colors.black),
          ),
        ),
      ];
    } else {
      return [
        const SizedBox(
          height: 100,
          child: Text(
            'There is no need to change the soil pH level',
            style: TextStyle(fontSize: 22, color: Colors.black),
          ),
        ),
      ];
    }
  }
}
