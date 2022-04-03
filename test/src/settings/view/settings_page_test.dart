import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:working_with_real_projects/src/settings/settings.dart';

import '../../../helpers/helpers.dart';

class MockSettingsBloc extends MockBloc<SettingsEvent, SettingsState>
    implements SettingsBloc {}

class SettingsEventFake extends Fake implements SettingsEvent {}

class SettingsStateFake extends Fake implements SettingsState {}

void main() {
  group('Settings view', () {
    const themeKey = '__key_theme_mode_';
    late SettingsBloc bloc;
    late Widget widget;

    setUp(() {
      registerFallbackValue(SettingsEventFake());
      registerFallbackValue(SettingsStateFake());
      bloc = MockSettingsBloc();

      widget = BlocProvider<SettingsBloc>(
        create: (_) => bloc,
        child: const SettingsPage(),
      );
    });

    testWidgets(
      'Theme mode values size check',
      (WidgetTester tester) async {
        when(() => bloc.state)
            .thenReturn(const SettingsState(ThemeMode.system));

        await tester.pumpApp(widget);

        expect(
          find.byType(SelectableTheme).evaluate().length,
          ThemeMode.values.length,
        );
      },
    );

    for (final theme in ThemeMode.values) {
      testWidgets(
        'Check selected $theme',
        (WidgetTester tester) async {
          when(() => bloc.state).thenReturn(SettingsState(theme));

          await tester.pumpApp(widget);

          final selectableWidget = tester.widget<SelectableTheme>(
            find.byKey(
              Key('$themeKey${theme.index}'),
            ),
          );

          expect(selectableWidget.selected, isTrue);
          expect(selectableWidget.themeMode, theme);

          final notSelectedThemes = ThemeMode.values.where(
            (element) => element != theme,
          );

          for (final notSelectedTheme in notSelectedThemes) {
            final selectableWidget = tester.widget<SelectableTheme>(
              find.byKey(
                Key('$themeKey${notSelectedTheme.index}'),
              ),
            );

            expect(selectableWidget.selected, false);
            expect(selectableWidget.themeMode, notSelectedTheme);
          }
        },
      );
    }

    testWidgets(
      'Tap selected theme and calls ChangeThemeEvent',
      (WidgetTester tester) async {
        when(() => bloc.state)
            .thenReturn(const SettingsState(ThemeMode.system));

        await tester.pumpApp(widget);

        for (final theme in ThemeMode.values) {
          await tester.tap(find.byKey(Key('$themeKey${theme.index}')));
          verify(() => bloc.add(ChangeThemeEvent(theme)));
        }
      },
    );
  });
}
