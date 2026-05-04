import 'package:flutter/material.dart';

class DetailImageSection extends StatelessWidget {
  final String imagePath;

  const DetailImageSection({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Image.asset(imagePath, width: 600, height: 240, fit: BoxFit.cover);
  }
}
