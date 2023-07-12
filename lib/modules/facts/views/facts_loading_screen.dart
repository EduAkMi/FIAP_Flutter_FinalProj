import 'package:flutter/material.dart';

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
