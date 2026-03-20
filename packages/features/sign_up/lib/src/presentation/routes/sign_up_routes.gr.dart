// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'sign_up_routes.dart';

/// generated route for
/// [SignUpPage]
class SignUpRoute extends PageRouteInfo<SignUpRouteArgs> {
  SignUpRoute({Key? key, String? halo, List<PageRouteInfo>? children})
    : super(
        SignUpRoute.name,
        args: SignUpRouteArgs(key: key, halo: halo),
        rawPathParams: {'halo': halo},
        initialChildren: children,
      );

  static const String name = 'SignUpRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<SignUpRouteArgs>(
        orElse: () => SignUpRouteArgs(halo: pathParams.optString('halo')),
      );
      return SignUpPage(key: args.key, halo: args.halo);
    },
  );
}

class SignUpRouteArgs {
  const SignUpRouteArgs({this.key, this.halo});

  final Key? key;

  final String? halo;

  @override
  String toString() {
    return 'SignUpRouteArgs{key: $key, halo: $halo}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SignUpRouteArgs) return false;
    return key == other.key && halo == other.halo;
  }

  @override
  int get hashCode => key.hashCode ^ halo.hashCode;
}
