import 'package:flutter/material.dart';

class FactsTypesButtons extends StatelessWidget {
  final VoidCallback onBothPressed;
  final VoidCallback onCatsPressed;
  final VoidCallback onDogsPressed;
  final double radius = 1000;

  const FactsTypesButtons({
    super.key,
    required this.onBothPressed,
    required this.onCatsPressed,
    required this.onDogsPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Expanded(
              child: Material(
                borderRadius: BorderRadius.circular(radius),
                elevation: 4,
                child: InkWell(
                  onTap: onBothPressed,
                  borderRadius: BorderRadius.circular(radius),
                  child: const Padding(
                    padding: EdgeInsets.all(16),
                    child: Center(
                      child: Text(
                        'Both',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.teal,
                        ),
                      ),
                    ),
                  ),
                ),
              )
          ),
          const SizedBox(width: 16),
          Expanded(
              child: Material(
                borderRadius: BorderRadius.circular(radius),
                elevation: 4,
                child: InkWell(
                  onTap: onCatsPressed,
                  borderRadius: BorderRadius.circular(radius),
                  child: const Padding(
                    padding: EdgeInsets.all(16),
                    child: Center(
                      child: Text(
                        'Cats',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.teal,
                        ),
                      ),
                    ),
                  ),
                ),
              )
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Material(
              borderRadius: BorderRadius.circular(radius),
              elevation: 4,
              child: InkWell(
                onTap: onDogsPressed,
                borderRadius: BorderRadius.circular(radius),
                child: const Padding(
                  padding: EdgeInsets.all(16),
                  child: Center(
                    child: Text(
                      'Dogs',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.teal,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ),
        ],
      ),
    );
  }
}
