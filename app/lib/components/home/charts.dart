// ignore_for_file: library_private_types_in_public_api

/*
  * Library imports
 */
import 'package:flutter/material.dart';
// ? https://pub.dev/packages/syncfusion_flutter_charts
import 'package:syncfusion_flutter_charts/charts.dart';

/*
  * Page/Component imports
 */
import 'package:app/components/options.buttons.dart';

// ignore: must_be_immutable
class ChartsView extends StatelessWidget {
  ChartsView({
    super.key,
    required this.title,
    required this.btnPressed,
    // required this.data,
  });

  final String title;
  final void Function() btnPressed;
  // final List<_DataLevels> data;

  final List<_DataLevels> data = [
    _DataLevels('Mon', 6.5),
    _DataLevels('Tue', 7.0),
    _DataLevels('Wed', 6.8),
  ];

  final List<_DataLevels> moistureData = [
    _DataLevels('Mon', 45.0),
    _DataLevels('Tue', 48.2),
    _DataLevels('Wed', 47.5),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10, left: 10),
          child: Row(
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
              OptionsButtons(pressed: btnPressed, title: 'Montly'),
              OptionsButtons(pressed: btnPressed, title: 'Yearly'),
            ],
          ),
        ),
        SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          series: <ChartSeries<_DataLevels, String>>[
            LineSeries<_DataLevels, String>(
              dataSource: data,
              xValueMapper: (_DataLevels stats, _) => stats.timeSpace,
              yValueMapper: (_DataLevels stats, _) => stats.data,
            ),
          ],
        ),
      ],
    );
  }
}

class _DataLevels {
  _DataLevels(this.timeSpace, this.data);

  final String timeSpace;
  final double data;
}
