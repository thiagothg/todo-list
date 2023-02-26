import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';

import '../../shared/stores/app_store.dart';

class CustomDrawer extends StatefulWidget {
  CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    final appStore = context.watch<AppStore>((store) => store.syncDate);

    final syncDate = appStore.syncDate.value;
    var syncDateText = 'Nunca';

    if (syncDate != null) {
      final format = DateFormat('dd/MM/yyyy as hh:mm');
      syncDateText = format.format(syncDate);
    }

    return NavigationDrawer(
      onDestinationSelected: (index) {
        if (index == 1) {
          Navigator.of(context).pop();
          Navigator.of(context).pushNamed('/configuration');
        }
      },
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 28, 16, 16),
          child: Text(
            'Opcoes',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        NavigationDrawerDestination(
          icon: const Icon(Icons.sync),
          label: SizedBox(
            width: 210,
            child: Row(
              children: [
                const Text('Sicronizar'),
                const Spacer(),
                Text(
                  syncDateText,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.settings),
          label: Text('Settings'),
        )
      ],
    );
  }
}
