import 'package:final_project/modules/facts/views/components/facts_types_buttons.dart';
import 'package:flutter/material.dart';

import '/modules/facts/models/factmodel.dart';
import '/modules/facts/views/components/facts_info_texts.dart';
import 'components/facts_list_cell.dart';

class FactsScreen extends StatelessWidget {
  final List<FactModel> facts;
  final VoidCallback onBothPressed;
  final VoidCallback onCatsPressed;
  final VoidCallback onDogsPressed;

  const FactsScreen({
    super.key,
    required this.facts,
    required this.onBothPressed,
    required this.onCatsPressed,
    required this.onDogsPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            children: [
              const FactsInfoTexts(),
              FactsTypesButtons(
                onBothPressed: onBothPressed,
                onCatsPressed: onCatsPressed,
                onDogsPressed: onDogsPressed,
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: facts.length,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  separatorBuilder: (_, __) => const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    final fact = facts[index];
                    return FactsListCell(
                      factModel: fact,
                    );
                  },
                ),
              )
            ],
          ),
        ));
  }
}
