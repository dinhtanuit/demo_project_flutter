import 'package:flutter/material.dart';

class DetailTextSection extends StatelessWidget {
  final String description;

  const DetailTextSection({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Text(description, softWrap: true),
    );
  }
}
