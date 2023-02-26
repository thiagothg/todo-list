import 'package:flutter_modular/flutter_modular.dart';
import 'package:listinha/src/configuration/services/configuration_service.dart';
import 'package:realm/realm.dart';

import 'configuration/configuration_page.dart';
import 'home/home_module.dart';
import 'shared/services/realm/realm_config.dart';
import 'shared/stores/app_store.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.instance<Realm>(Realm(config)),
        AutoBind.factory<ConfigurationService>(ConfigurationServiceImpl.new),
        AutoBind.singleton(AppStore.new),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/configuration',
          child: (context, args) => const ConfigurationPage(),
        ),
        ModuleRoute('/home', module: HomeModule()),
      ];
}
