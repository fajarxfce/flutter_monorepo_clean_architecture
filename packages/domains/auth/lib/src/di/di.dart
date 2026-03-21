import 'package:shared/shared.dart';

import 'di.config.dart';

@InjectableInit(
  initializerName: 'init',
  asExtension: false,
  preferRelativeImports: true,
)
void configureAuthDomainDependencies(GetIt getIt) => init(getIt);
