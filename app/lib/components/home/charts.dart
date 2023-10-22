// ignore_for_file: library_private_types_in_public_api

/*
  * Library imports
 */
import 'package:app/methods/methods.dart';
import 'package:app/utils/global.vars.dart';
import 'package:flutter/material.dart';
// ? https://pub.dev/packages/syncfusion_flutter_charts
import 'package:syncfusion_flutter_charts/charts.dart';

/*
  * Page/Component imports
 */
import 'package:app/components/options.buttons.dart';

class ChartsView extends StatefulWidget {
  const ChartsView({
    super.key,
    required this.title,
    required this.btnPressed,
  });

  final String title;
  final void Function() btnPressed;

  @override
  _ChartsViewState createState() => _ChartsViewState();
}

class _ChartsViewState extends State<ChartsView> {
  bool isYearlyView = false;
  Color montlyColor = GlobalVariables.secondaryColor;
  Color yearlyColor = Colors.white;
  List<String> lastSetValues = [];
  List<String> averages = [];

  List<_DataLevels> monthlyData = [];
  List<_DataLevels> yearlyData = [];

  @override
  void initState() {
    super.initState();
    MeasurementData.init();
    lastSetValues = MeasurementData.getLastSetValues();
    averages = MeasurementData.getAverages();

    monthlyData = [
      _DataLevels('0-5',
          lastSetValues.isNotEmpty ? double.parse(lastSetValues[0]) : 0.0),
      _DataLevels('5-10',
          lastSetValues.isNotEmpty ? double.parse(lastSetValues[1]) : 0.0),
      _DataLevels('10-15',
          lastSetValues.isNotEmpty ? double.parse(lastSetValues[2]) : 0.0),
      _DataLevels('15-20',
          lastSetValues.isNotEmpty ? double.parse(lastSetValues[3]) : 0.0),
      _DataLevels('20-25',
          lastSetValues.isNotEmpty ? double.parse(lastSetValues[4]) : 0.0),
      _DataLevels('25-30',
          lastSetValues.isNotEmpty ? double.parse(lastSetValues[5]) : 0.0),
    ];

    yearlyData = [
      _DataLevels('Jan', averages.isNotEmpty ? double.parse(averages[0]) : 0.0),
      _DataLevels('Feb', averages.isNotEmpty ? double.parse(averages[1]) : 0.0),
      _DataLevels('Mar', averages.isNotEmpty ? double.parse(averages[2]) : 0.0),
      _DataLevels('Apr', averages.isNotEmpty ? double.parse(averages[3]) : 0.0),
      _DataLevels('May', averages.isNotEmpty ? double.parse(averages[4]) : 0.0),
      _DataLevels('Jun', averages.isNotEmpty ? double.parse(averages[5]) : 0.0),
      _DataLevels('Jul', averages.isNotEmpty ? double.parse(averages[6]) : 0.0),
      _DataLevels('Aug', averages.isNotEmpty ? double.parse(averages[7]) : 0.0),
      _DataLevels('Sep', averages.isNotEmpty ? double.parse(averages[8]) : 0.0),
      _DataLevels('Oct', averages.isNotEmpty ? double.parse(averages[9]) : 0.0),
      _DataLevels(
          'Nov', averages.isNotEmpty ? double.parse(averages[10]) : 0.0),
      _DataLevels(
          'Dec', averages.isNotEmpty ? double.parse(averages[11]) : 0.0),
    ];
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<_DataLevels> data = isYearlyView ? yearlyData : monthlyData;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10, left: 10),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  widget.title,
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              OptionsButtons(
                pressed: () {
                  setState(() {
                    isYearlyView = false;
                    montlyColor = GlobalVariables.secondaryColor;
                    yearlyColor = Colors.white;
                  });
                },
                color: montlyColor,
                title: 'Month',
              ),
              const SizedBox(width: 10),
              OptionsButtons(
                  pressed: () {
                    setState(() {
                      isYearlyView = true;
                      montlyColor = Colors.white;
                      yearlyColor = GlobalVariables.secondaryColor;
                    });
                  },
                  color: yearlyColor,
                  title: 'Year'),
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
              dataLabelSettings: const DataLabelSettings(isVisible: true),
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
