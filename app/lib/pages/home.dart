/*
  * Library imports
 */
import 'package:app/utils/global.vars.dart';
import 'package:flutter/material.dart';

/*
  * Page/Component imports
 */
import 'package:app/components/home/ph.level.dart';
import 'package:app/components/home/suggested.substances.dart';
import 'package:app/components/home/charts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 25, left: 15, right: 15),
            child: Column(
              children: [
                // Current and wanted soil pH levels
                SoilpHLevels(),

                // Suggested substances to use for soil
                Padding(
                  padding:
                      EdgeInsets.only(top: 40, left: 12, right: 12, bottom: 30),
                  child: SuggestedSubstances(),
                ),
              ],
            ),
          ),

          // Data charts
          Container(
            decoration: const BoxDecoration(
              color: GlobalVariables.primaryColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(15),
                topLeft: Radius.circular(15),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 25, left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10, left: 9),
                    child: Text(
                      'Charts:',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ChartsView(
                    title: "pH Levels:",
                    btnPressed: () {},
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ChartsView(
                    title: "Moisture\nLevels:",
                    btnPressed: () {},
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
