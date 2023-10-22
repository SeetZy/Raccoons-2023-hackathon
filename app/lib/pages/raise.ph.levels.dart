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

class RaisePhLevels extends StatelessWidget {
  const RaisePhLevels({super.key});

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
                'Raise the pH level with substances',
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
              title: SubstanceData.magHyd,
              desc: '',
              pressed: () {
                NavUtils.navigate(context, SubstanceData.magHyd,
                    SubstanceData.descMagHyd, 'Coming Soon!');
              },
            ),
            SubstanceComponent(
              title: SubstanceData.ammHyd,
              desc: '',
              pressed: () {
                NavUtils.navigate(context, SubstanceData.ammHyd,
                    SubstanceData.descAmmHyd, 'Coming Soon!');
              },
            ),
            SubstanceComponent(
              title: SubstanceData.potHyd,
              desc: '',
              pressed: () {
                NavUtils.navigate(context, SubstanceData.potHyd,
                    SubstanceData.descpotHyd, 'Coming Soon!');
              },
            ),
            SubstanceComponent(
              title: SubstanceData.sodCar,
              desc: '',
              pressed: () {
                NavUtils.navigate(context, SubstanceData.sodCar,
                    SubstanceData.descSodCar, 'Coming Soon!');
              },
            ),
            SubstanceComponent(
              title: SubstanceData.limeSl,
              desc: '',
              pressed: () {
                NavUtils.navigate(context, SubstanceData.limeSl,
                    SubstanceData.descLimeSl, 'Coming Soon!');
              },
            ),
          ],
        ),
      ),
    );
  }
}
