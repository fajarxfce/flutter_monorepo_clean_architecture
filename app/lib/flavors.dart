enum Flavor { dev, prod, devProxy, prodProxy }

class F {
  static late final Flavor appFlavor;

  static String get name => appFlavor.name;

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'Belajar Dev';
      case Flavor.prod:
        return 'Belajar';
      case Flavor.devProxy:
        return 'Belajar Dev Proxy';
      case Flavor.prodProxy:
        return 'Belajar Proxy';
    }
  }

  static String get baseUrl {
    switch (appFlavor) {
      case Flavor.dev:
      case Flavor.devProxy:
        return 'https://pos.karuhundeveloper.com/api';
      case Flavor.prod:
      case Flavor.prodProxy:
        return 'https://pos.karuhundeveloper.com/api';
    }
  }

  static String get proxyUrl => '192.168.234.185:8080';

  static bool get isProxy {
    switch (appFlavor) {
      case Flavor.dev:
        return false;
      case Flavor.prod:
        return false;
      case Flavor.devProxy:
        return true;
      case Flavor.prodProxy:
        return true;
    }
  }
}
