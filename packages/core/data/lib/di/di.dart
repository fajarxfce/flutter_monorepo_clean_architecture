import 'package:shared/shared.dart';

import 'di.config.dart';

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: false,
)
void configureDataModule(GetIt getIt) => init(getIt);
