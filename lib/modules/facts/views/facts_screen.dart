import 'package:final_project/modules/facts/models/factmodel.dart';
import 'package:flutter/material.dart';

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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Material(
                        borderRadius: BorderRadius.circular(1000),
                        elevation: 4,
                        child: ListTile(
                          selected: true,
                          selectedColor: Colors.black,
                          onTap: onBothPressed,
                          title: const Text(
                            'Both',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.teal),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Material(
                        borderRadius: BorderRadius.circular(1000),
                        elevation: 4,
                        child: ListTile(
                          onTap: onCatsPressed,
                          title: const Text(
                            'Cats',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.teal),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Material(
                        borderRadius: BorderRadius.circular(1000),
                        elevation: 4,
                        child: ListTile(
                          onTap: onDogsPressed,
                          title: const Text(
                            'Dogs',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.teal),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
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
