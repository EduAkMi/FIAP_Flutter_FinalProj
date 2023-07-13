import 'package:flutter/material.dart';

class FactsInfoTexts extends StatelessWidget {
  const FactsInfoTexts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          'Random Cat and Dogs',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        Text(
          'Facts',
          style: TextStyle(color: Colors.white, fontSize: 26),
        ),
        Text(
          'Select an option to discover more',
          style: TextStyle(color: Colors.white, fontSize: 13),
        ),
        SizedBox(height: 4,)
      ],
    );
  }
}
