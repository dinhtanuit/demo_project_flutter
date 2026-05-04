import 'package:get/get.dart';
import '../../features/home/presentation/bindings/home_binding.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/login/presentation/bindings/login_binding.dart';
import '../../features/login/presentation/views/login_view.dart';
import '../../features/weather/presentation/bindings/weather_binding.dart';
import '../../features/weather/presentation/views/weather_view.dart';
import '../../features/profile/presentation/bindings/profile_binding.dart';
import '../../features/profile/presentation/views/profile_view.dart';
import '../../features/photo_detail/presentation/bindings/photo_detail_binding.dart';
import '../../features/photo_detail/presentation/views/photo_detail_view.dart';
import '../../features/browzzin/presentation/bindings/browzzin_binding.dart';
import '../../features/browzzin/presentation/views/browzzin_view.dart';
import 'app_routes.dart';

/// Tập trung tất cả routes của app
class AppPages {
  AppPages._();

  static const initial = AppRoutes.home;

  static final routes = <GetPage>[
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.weather,
      page: () => const WeatherView(),
      binding: WeatherBinding(),
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: AppRoutes.photoDetail,
      page: () => const PhotoDetailView(),
      binding: PhotoDetailBinding(),
    ),
    GetPage(
      name: AppRoutes.browzzin,
      page: () => const BrowzzinView(),
      binding: BrowzzinBinding(),
    ),
  ];
}
