/// Môi trường chạy của app
enum Flavor { uat, prod }

/// Cấu hình môi trường, đọc từ --dart-define khi build/run
class AppEnv {
  AppEnv._();

  static const String _flavorValue = String.fromEnvironment(
    'FLAVOR',
    defaultValue: 'uat',
  );

  static Flavor get flavor =>
      _flavorValue == 'prod' ? Flavor.prod : Flavor.uat;

  static bool get isUat => flavor == Flavor.uat;
  static bool get isProd => flavor == Flavor.prod;

  static const String baseUrl = String.fromEnvironment(
    'BASE_URL',
    defaultValue: 'https://api-uat.example.com',
  );

  static const String appName = String.fromEnvironment(
    'APP_NAME',
    defaultValue: 'Demo UAT',
  );
}
