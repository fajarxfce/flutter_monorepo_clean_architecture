enum Flavor { dev, prod, devproxy, prodproxy }

class F {
  static late final Flavor appFlavor;

  static String get name => appFlavor.name;

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'Belajar Dev';
      case Flavor.prod:
        return 'Belajar';
      case Flavor.devproxy:
        return 'Belajar Dev Proxy';
      case Flavor.prodproxy:
        return 'Belajar Proxy';
    }
  }

  static String get baseUrl {
    switch (appFlavor) {
      case Flavor.dev:
      case Flavor.devproxy:
        return 'https://pos.karuhundeveloper.com/api';
      case Flavor.prod:
      case Flavor.prodproxy:
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
      case Flavor.devproxy:
        return true;
      case Flavor.prodproxy:
        return true;
    }
  }
}
