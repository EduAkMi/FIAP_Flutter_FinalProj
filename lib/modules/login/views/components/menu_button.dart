import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  final Function() onPressed;
  final String text;

  final double radius = 30;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(radius),
      elevation: 4,
      color: Colors.amberAccent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(radius),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
