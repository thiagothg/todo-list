import 'package:flutter_modular/flutter_modular.dart';
import 'package:listinha/src/configuration/configuration_page.dart';

import 'home/home_module.dart';

class AppModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/configuration',
          child: (context, args) => ConfigurationPage(),
        ),
        ModuleRoute('/home', module: HomeModule()),
      ];
}
