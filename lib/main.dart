import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/config/app_env.dart';
import 'core/routes/app_pages.dart';
import 'core/theme/app_theme.dart';

void main() {
  debugPrint('Running in ${AppEnv.flavor.name.toUpperCase()} | ${AppEnv.baseUrl}');
  runApp(const MyApp());
}

class MyNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    debugPrint('push: ${route.settings.name}');
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    debugPrint('pop: ${route.settings.name}');
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    debugPrint('replace: ${oldRoute?.settings.name} -> ${newRoute?.settings.name}');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: AppEnv.isUat,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      title: AppEnv.appName,
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      navigatorObservers: [MyNavigatorObserver()],
    );
  }
}
