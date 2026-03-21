import 'package:shared/shared.dart';

import 'di.config.dart';

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: false,
)
void configureNetworkModule(GetIt getIt) => init(getIt);
