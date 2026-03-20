abstract final class AppRoutes {
  static const signIn = '/sign-in';
  static const signUp = '/sign-up/:halo';
  static String signUpPath(String halo) => '/sign-up/$halo';
}
