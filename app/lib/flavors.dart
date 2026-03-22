enum Flavor { dev, prod }

class F {
  static late final Flavor appFlavor;

  static String get name => appFlavor.name;

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'Belajar Dev';
      case Flavor.prod:
        return 'Belajar';
    }
  }

  static String get baseUrl {
    switch (appFlavor) {
      case Flavor.dev:
        return 'https://pos.karuhundeveloper.com/api';
      case Flavor.prod:
        return 'https://pos.karuhundeveloper.com/api';
    }
  }
}
