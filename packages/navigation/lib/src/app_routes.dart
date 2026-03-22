abstract final class AppRoutes {
  static const splash = '/splash';
  static const signIn = '/sign-in';
  static const signUp = '/sign-up/:halo';
  static String signUpPath(String halo) => '/sign-up/$halo';
  static const main = '/main';
  static const home = 'home';
  static const history = 'history';
  static const inventory = 'inventory';
  static const profile = 'profile';
  static const detail = '/detail/:id';
}
