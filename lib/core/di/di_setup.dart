import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'di_setup.config.dart';

final getIt = GetIt.instance;

// const dev = Environment('dev');
// const prod = Environment('prod');

@InjectableInit()
GetIt configureDependencies() => getIt.init();
// environment: Environment.dev
