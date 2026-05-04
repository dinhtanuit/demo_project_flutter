import 'package:flutter/material.dart';

/// Widget hiển thị profile card - tách riêng để tái sử dụng
class ProfileCardWidget extends StatelessWidget {
  final String name;
  final String title;
  final String? avatarUrl;

  const ProfileCardWidget({
    super.key,
    required this.name,
    required this.title,
    this.avatarUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 400,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            spreadRadius: 5,
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: avatarUrl != null
                      ? DecorationImage(
                          image: NetworkImage(avatarUrl!),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
                child: avatarUrl == null
                    ? CircleAvatar(
                        radius: 36,
                        child: Text(
                          name.isNotEmpty ? name[0].toUpperCase() : '?',
                          style: const TextStyle(fontSize: 28),
                        ),
                      )
                    : null,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: null,
                      overflow: TextOverflow.visible,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
