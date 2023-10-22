/*
  * Library imports
 */
import 'dart:developer';
import 'package:flutter/services.dart';
// ? https://pub.dev/packages/excel
import 'package:excel/excel.dart';

class MeasurementData {
  static List<String> lastSetValues = [];
  static List<String> averages = [];

  static void init() async {
    const filePath = 'assets/data.xlsx';
    final ByteData data = await rootBundle.load(filePath);
    final buffer = data.buffer.asUint8List();
    final excel = Excel.decodeBytes(buffer);
    List<String> resultList = [];

    for (var table in excel.tables.keys) {
      for (var rowIndex = 0;
          rowIndex < excel.tables[table]!.maxRows;
          rowIndex++) {
        var row = excel.tables[table]!.rows[rowIndex];
        if (row.length > 2) {
          var cellValue = row[2]?.value;
          if (cellValue != null) {
            var cellText = cellValue.toString();
            var parts = cellText.split(' ');
            if (parts.isNotEmpty) {
              var desiredPortion = parts[0];
              resultList.add(desiredPortion);
            }
          }
        }
      }
    }

    if (resultList.isNotEmpty) {
      resultList.removeAt(0);
    }

    List<double> currentSet = [];

    for (var i = 0; i < resultList.length; i++) {
      currentSet.add(double.parse(resultList[i]));
      if (currentSet.length == 6) {
        double average = currentSet.reduce((a, b) => a + b) / currentSet.length;
        averages.add(average.toStringAsFixed(1));
        lastSetValues =
            currentSet.map((value) => value.toStringAsFixed(1)).toList();
        currentSet.clear();
      }
    }

    if (currentSet.isNotEmpty) {
      double average = currentSet.reduce((a, b) => a + b) / currentSet.length;
      averages.add(average.toStringAsFixed(1));
      lastSetValues =
          currentSet.map((value) => value.toStringAsFixed(1)).toList();
    }

    log("Averages: $averages");
    log("Last Set Values: $lastSetValues");
  }

  static List<String> getLastSetValues() {
    return lastSetValues;
  }

  static List<String> getAverages() {
    return averages;
  }
}
