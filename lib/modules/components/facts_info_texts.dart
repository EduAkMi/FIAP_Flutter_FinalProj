import 'package:flutter/material.dart';

class FactsInfoTexts extends StatelessWidget {
  final String description;

  const FactsInfoTexts({
    super.key,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Cat and Dogs',
          style: TextStyle(
            color: Colors.black,
            fontSize: 26,
          ),
        ),
        const Text(
          'Random Facts',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        Text(
          description,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 13,
          ),
        ),
        const SizedBox(height: 4)
      ],
    );
  }
}
