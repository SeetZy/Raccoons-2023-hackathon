/*
  * Library imports
 */
import 'package:flutter/material.dart';
import 'package:app/utils/nav.utils.dart';
import 'package:app/utils/substance.data.dart';

/*
  * Page/Component imports 
 */
import 'package:app/components/substance.component.dart';

class LowerPhLevels extends StatelessWidget {
  const LowerPhLevels({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 40, left: 15, right: 15),
        child: Column(
          children: [
            // Main text
            const Padding(
              padding: EdgeInsets.only(bottom: 25),
              child: Text(
                'Lower the pH level with substances',
                style: TextStyle(fontSize: 23, color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),

            // Search bar
            Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: Container(
                width: 300,
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                    hintText: "Search for a substance",
                    hintStyle: TextStyle(color: Colors.black),
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),

            SubstanceComponent(
              title: SubstanceData.sulAcid,
              desc: '',
              pressed: () {
                NavUtils.navigate(context, SubstanceData.sulAcid,
                    SubstanceData.descSulAcid, 'Coming Soon!');
              },
            ),
            SubstanceComponent(
              title: SubstanceData.hydAcid,
              desc: '',
              pressed: () {
                NavUtils.navigate(context, SubstanceData.hydAcid,
                    SubstanceData.descHydAcid, 'Coming Soon!');
              },
            ),
            SubstanceComponent(
              title: SubstanceData.phosAcid,
              desc: '',
              pressed: () {
                NavUtils.navigate(context, SubstanceData.phosAcid,
                    SubstanceData.descPhosAcid, 'Coming Soon!');
              },
            ),
            SubstanceComponent(
              title: SubstanceData.aceAcid,
              desc: '',
              pressed: () {
                NavUtils.navigate(context, SubstanceData.aceAcid,
                    SubstanceData.descAceAcid, 'Coming Soon!');
              },
            ),
            SubstanceComponent(
              title: SubstanceData.citAcid,
              desc: '',
              pressed: () {
                NavUtils.navigate(context, SubstanceData.citAcid,
                    SubstanceData.descCitAcid, 'Coming Soon!');
              },
            ),
          ],
        ),
      ),
    );
  }
}
