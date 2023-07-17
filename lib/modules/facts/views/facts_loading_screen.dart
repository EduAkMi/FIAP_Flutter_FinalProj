import 'package:flutter/material.dart';

import '../../components/facts_info_texts.dart';
import 'components/facts_types_buttons.dart';

class FactsLoadingScreen extends StatelessWidget {
  final VoidCallback onBothPressed;
  final VoidCallback onCatsPressed;
  final VoidCallback onDogsPressed;

  const FactsLoadingScreen({
    super.key,
    required this.onBothPressed,
    required this.onCatsPressed,
    required this.onDogsPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.greenAccent,
        body: SafeArea(
          child: Column(
            children: [
              const FactsInfoTexts(description: 'Select an option to discover more'),
              FactsTypesButtons(
                onBothPressed: onBothPressed,
                onCatsPressed: onCatsPressed,
                onDogsPressed: onDogsPressed,
              ),
              const SizedBox(height: 16),
              const Expanded(
                child: Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
