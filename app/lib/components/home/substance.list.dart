/*
  * Library imports
 */
import 'package:flutter/material.dart';

class SubstanceList extends StatelessWidget {
  final List<String> substances;
  final List<String> masses;

  const SubstanceList(
      {Key? key, required this.substances, required this.masses})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 35),
      child: Table(
        columnWidths: const {
          0: IntrinsicColumnWidth(),
          1: FlexColumnWidth(),
        },
        children: [
          const TableRow(
            children: [
              TableCell(
                child: Text(
                  'Substances:',
                  style: TextStyle(
                      fontSize: 21.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              TableCell(
                child: Center(
                  child: Text(
                    'Mass:',
                    style: TextStyle(
                        fontSize: 21.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
          for (int i = 0; i < substances.length; i++)
            TableRow(
              children: [
                TableCell(
                  child: Text(
                    substances[i],
                    style: const TextStyle(fontSize: 21.0, color: Colors.black),
                  ),
                ),
                TableCell(
                  child: Center(
                    child: Text(
                      masses[i],
                      style:
                          const TextStyle(fontSize: 21.0, color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
