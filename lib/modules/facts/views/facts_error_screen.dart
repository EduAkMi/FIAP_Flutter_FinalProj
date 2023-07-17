import 'package:flutter/material.dart';

import '../../components/facts_info_texts.dart';
import 'components/facts_types_buttons.dart';

class FactsErrorScreen extends StatelessWidget {
  final String errorMessage;
  final VoidCallback onBothPressed;
  final VoidCallback onCatsPressed;
  final VoidCallback onDogsPressed;

  const FactsErrorScreen({
    super.key,
    required this.errorMessage,
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
              Expanded(
                child: Center(
                  child: Text(
                    'Ops, parece que ocorreu uma falha\n\nErro retornado: $errorMessage',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
