import 'network_config.dart';

enum Flavor {
  development,
  release,
}

class Config {
  static Flavor? appFlavor;

  static String get baseUrl {
    switch (appFlavor) {
      case Flavor.development:
        return NetworkConfig.developBaseUrl;
      case Flavor.release:
        return NetworkConfig.releaseBaseUrl;
      default:
        return '';
    }
  }
}