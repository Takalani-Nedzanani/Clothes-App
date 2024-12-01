import 'package:flutter/material.dart';

class PromoBanner extends StatelessWidget {
  const PromoBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      padding: const EdgeInsets.all(16),
      child: const Column(
        children: [
          Text(
            "50% Off",
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
          Text(
            "Summer Sale",
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
