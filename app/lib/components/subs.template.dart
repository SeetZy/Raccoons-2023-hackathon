/*
  * Library imports
 */
import 'package:app/utils/global.vars.dart';
import 'package:flutter/material.dart';

class SubstanceTemplate extends StatelessWidget {
  const SubstanceTemplate(
      {super.key,
      required this.title,
      required this.desc,
      required this.usage});

  final String title;
  final String desc;
  final String usage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(title),
        backgroundColor: GlobalVariables.navColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 25, bottom: 15),
              child: Text(
                'Description:',
                style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            Text(
              desc,
              style: const TextStyle(fontSize: 20, color: Colors.black),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 35, bottom: 15),
              child: Text(
                'Usage:',
                style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            Text(
              usage,
              style: const TextStyle(fontSize: 20, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
