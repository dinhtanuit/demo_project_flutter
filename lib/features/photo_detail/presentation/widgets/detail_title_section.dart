import 'package:flutter/material.dart';
import 'favorite_widget.dart';

class DetailTitleSection extends StatelessWidget {
  final String name;
  final String location;
  final bool isFavorite;
  final int favoriteCount;
  final VoidCallback onFavoriteToggle;

  const DetailTitleSection({
    super.key,
    required this.name,
    required this.location,
    required this.isFavorite,
    required this.favoriteCount,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(location, style: TextStyle(color: Colors.grey[500])),
              ],
            ),
          ),
          FavoriteWidget(
            isFavorite: isFavorite,
            favoriteCount: favoriteCount,
            onToggle: onFavoriteToggle,
          ),
        ],
      ),
    );
  }
}
