import 'package:flutter/material.dart';

class FavoriteWidget extends StatelessWidget {
  final bool isFavorite;
  final int favoriteCount;
  final VoidCallback onToggle;

  const FavoriteWidget({
    super.key,
    required this.isFavorite,
    required this.favoriteCount,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            padding: const EdgeInsets.all(0),
            icon: Icon(isFavorite ? Icons.star : Icons.star_border),
            color: Colors.red[500],
            onPressed: onToggle,
          ),
        ),
        SizedBox(width: 18, child: Text('$favoriteCount')),
      ],
    );
  }
}
