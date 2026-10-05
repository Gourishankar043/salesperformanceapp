enum AppEnvironment {
  asm,
  uat,
  production,
}

class EnvironmentConfig {
  static const String currentEnvironment = String.fromEnvironment(
    'APP_ENV',
    defaultValue: 'uat',
  );

  static AppEnvironment get environment {
    switch (currentEnvironment.toLowerCase()) {
      case 'asm':
        return AppEnvironment.asm;
      case 'production':
      case 'prod':
        return AppEnvironment.production;
      case 'uat':
      default:
        return AppEnvironment.uat;
    }
  }

  static String get baseUrl {
    switch (environment) {
      case AppEnvironment.asm:
        return '';
      case AppEnvironment.uat:
        return '';
      case AppEnvironment.production:
        return '';
    }
  }
}