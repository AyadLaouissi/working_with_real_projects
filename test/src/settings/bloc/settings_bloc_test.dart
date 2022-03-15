import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:working_with_real_projects/src/settings/settings.dart';

void main() {
  group('Settings bloc test', () {
    blocTest<SettingsBloc, SettingsState>(
      "Check's the initial value and should be the system",
      build: () => SettingsBloc(),
      verify: (bloc) => expect(
        bloc.state,
        const SettingsState(ThemeMode.system),
      ),
    );

    blocTest<SettingsBloc, SettingsState>(
      'Dark mode theme',
      build: () => SettingsBloc(),
      act: (bloc) => bloc.add(const ChangeThemeEvent(ThemeMode.dark)),
      expect: () => const <SettingsState>[SettingsState(ThemeMode.dark)],
    );

    blocTest<SettingsBloc, SettingsState>(
      'Light mode theme',
      build: () => SettingsBloc(),
      act: (bloc) => bloc.add(const ChangeThemeEvent(ThemeMode.light)),
      expect: () => const <SettingsState>[SettingsState(ThemeMode.light)],
    );
  });
}
