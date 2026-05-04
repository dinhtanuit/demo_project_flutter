import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/routes/app_routes.dart';

/// Model mô tả một tính năng trong app
class _FeatureItem {
  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final String route;

  const _FeatureItem({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    required this.route,
  });
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const _features = <_FeatureItem>[
    _FeatureItem(
      title: 'Login',
      description:
          'Màn hình đăng nhập với form validation, mock API và '
          'Either<Failure, T> error handling. Demo credentials: '
          'demo@example.com / 123456.',
      icon: Icons.lock_outline,
      color: Color(0xFF6C63FF),
      route: AppRoutes.login,
    ),
    _FeatureItem(
      title: 'Weather',
      description:
          'Hiển thị nhiệt độ realtime của 5 thành phố Việt Nam '
          'qua Open-Meteo API. Có pull-to-refresh và error state.',
      icon: Icons.cloud_queue,
      color: Color(0xFF00B4D8),
      route: AppRoutes.weather,
    ),
    _FeatureItem(
      title: 'Profile Card',
      description:
          'Demo UI profile card với avatar, tên và chức danh. '
          'Dữ liệu mock từ DataSource, sẵn sàng kết nối API thật.',
      icon: Icons.person_outline,
      color: Color(0xFF2EC4B6),
      route: AppRoutes.profile,
    ),
    _FeatureItem(
      title: 'Photo Detail',
      description:
          'Màn hình chi tiết ảnh phong cảnh với image, title, '
          'favorite toggle, action buttons (Call, Route, Share) '
          'và mô tả dài.',
      icon: Icons.photo_library_outlined,
      color: Color(0xFFFF6B6B),
      route: AppRoutes.photoDetail,
    ),
    _FeatureItem(
      title: 'Browzzin Discovery',
      description:
          'Component UI được chuyển từ Figma design. '
          'Hiển thị logo và caption theo phong cách landing page.',
      icon: Icons.design_services_outlined,
      color: Color(0xFFFFBE0B),
      route: AppRoutes.browzzin,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Header
          SliverAppBar(
            expandedHeight: 180,
            pinned: true,
            backgroundColor: theme.colorScheme.inversePrimary,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.only(left: 20, bottom: 16),
              title: Text(
                'Flutter Demo',
                style: TextStyle(
                  color: theme.colorScheme.onPrimaryContainer,
                  fontWeight: FontWeight.bold,
                ),
              ),
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      theme.colorScheme.primary,
                      theme.colorScheme.inversePrimary,
                    ],
                  ),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 16, 20, 60),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.flutter_dash,
                          size: 40,
                          color: theme.colorScheme.onPrimary.withAlpha(200),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Clean Architecture + GetX',
                          style: TextStyle(
                            fontSize: 14,
                            color: theme.colorScheme.onPrimary.withAlpha(200),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Hướng dẫn
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Chọn tính năng',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Nhấn vào một mục bên dưới để xem demo.',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Danh sách tính năng
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
            sliver: SliverList.separated(
              itemCount: _features.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final feature = _features[index];
                return _FeatureCard(feature: feature);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final _FeatureItem feature;

  const _FeatureCard({required this.feature});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: theme.colorScheme.outlineVariant.withAlpha(120),
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () => Get.toNamed(feature.route),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              // Icon
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: feature.color.withAlpha(30),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(feature.icon, color: feature.color, size: 28),
              ),
              const SizedBox(width: 16),

              // Text
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      feature.title,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      feature.description,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                        height: 1.4,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),

              // Arrow
              Icon(
                Icons.chevron_right,
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
