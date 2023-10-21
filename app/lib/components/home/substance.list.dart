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
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Substance:',
                style: TextStyle(fontSize: 21.0),
              ),
              for (int i = 0; i < substances.length; i++)
                Text(
                  '${i + 1}. ${substances[i]}',
                  style: const TextStyle(fontSize: 21.0),
                ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Mass:',
                style: TextStyle(fontSize: 21.0),
              ),
              for (int i = 0; i < masses.length; i++)
                Text(
                  masses[i],
                  style: const TextStyle(fontSize: 21.0),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
