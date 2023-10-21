/*
  * Library imports
 */
import 'package:flutter/material.dart';

/*
  * Page/Component imports 
 */
import 'package:app/components/substance.component.dart';

class RaisePhLevels extends StatelessWidget {
  const RaisePhLevels({super.key});

  void uhuh() {
    Null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 15, right: 15),
      child: Column(
        children: [
          // Main text
          const Padding(
            padding: EdgeInsets.only(bottom: 25),
            child: Text(
              'Raise the pH level with substances',
              style: TextStyle(fontSize: 23),
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
                  hintText: "Search substance",
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
            title: 'Magnesium Hydroxide Slurry',
            pressed: uhuh,
          ),
          SubstanceComponent(
            title: 'Ammonium Hydroxide (NH4OH)',
            pressed: uhuh,
          ),
          SubstanceComponent(
            title: 'Potassium Hydroxide (KOH)',
            pressed: uhuh,
          ),
          SubstanceComponent(
            title: 'Sodium Carbonate (Soda Ash)',
            pressed: uhuh,
          ),
          SubstanceComponent(
            title: 'Lime Slurry',
            pressed: uhuh,
          ),
        ],
      ),
    );
  }
}
