import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:working_with_real_projects/src/settings/bloc/settings_bloc.dart';

import 'selectable_theme.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  static const routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          return Center(
            child: FittedBox(
              child: Column(
                children: ThemeMode.values
                    .map(
                      (themeMode) => SelectableTheme(
                        key: Key('__key_theme_mode_${themeMode.index}'),
                        themeMode: themeMode,
                        selected: themeMode == state.themeMode,
                      ),
                    )
                    .toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}
