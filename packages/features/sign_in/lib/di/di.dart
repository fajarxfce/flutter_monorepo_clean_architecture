import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:sign_in/di/di.config.dart';

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
void configureSignInDependencies(GetIt getIt) => $initGetIt(getIt);
