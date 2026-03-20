import 'package:network/di/di.config.dart';
import 'package:shared/shared.dart';

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: false,
)
void initNetworkModule(GetIt getIt) => init(getIt);
