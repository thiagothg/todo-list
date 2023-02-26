import 'package:realm/realm.dart';

import '../../shared/services/realm/models/configuration_model.dart';

abstract class ConfigurationService {
  ConfigurationModel getConfiguration();
  void saveConfiguration(String themeModeName, DateTime? syncDate);
  void deleteeAll();
}

class ConfigurationServiceImpl implements ConfigurationService {
  final Realm realm;

  ConfigurationServiceImpl(this.realm);

  @override
  void deleteeAll() {
    // TODO: implement deleteeAll
  }

  @override
  ConfigurationModel getConfiguration() {
    return realm.all<ConfigurationModel>().first;
  }

  @override
  void saveConfiguration(String themeModeName, DateTime? syncDate) {
    final model = getConfiguration();
    realm.write(() {
      model.themeModeName = themeModeName;
      model.syncDate = syncDate;
    });
  }
}
