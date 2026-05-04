import 'package:flutter/material.dart';

/// Widget hiển thị Browzzin logo
class BrowzzinLogoWidget extends StatelessWidget {
  const BrowzzinLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: const BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle,
          ),
          child: const Center(
            child: Text(
              'B',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Browzzin',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              'Brand',
              style: TextStyle(fontSize: 12, color: Colors.black54),
            ),
          ],
        ),
      ],
    );
  }
}
