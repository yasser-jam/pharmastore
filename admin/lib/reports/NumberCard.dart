import 'package:flutter/material.dart';

class NumberCard extends StatelessWidget {
  final String label;
  final String number;
  final Color color;
  final Color textColor;
  final IconData icon;

  const NumberCard(
      {required this.label,
      required this.number,
      required this.color,
      required this.icon,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          Column(
            children: [
              Icon(
                icon,
                color: textColor,
                size: 65,
              )
            ],
          ),
          const SizedBox(width: 30),
          Column(
            children: [
              Text(
                label,
                style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              ),
              const SizedBox(height: 8),
              Text(
                number,
                style: TextStyle(
                    color: textColor,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
