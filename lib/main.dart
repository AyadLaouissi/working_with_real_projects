import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:working_with_real_projects/src/home/home_page.dart';
import 'package:working_with_real_projects/src/settings/settings.dart';

void main() {
  runApp(
    BlocProvider<SettingsBloc>(
      create: (_) => SettingsBloc(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(),
          darkTheme: ThemeData.dark(),
          themeMode: state.themeMode,
          onGenerateRoute: (RouteSettings routeSettings) {
            return MaterialPageRoute<void>(
              settings: routeSettings,
              builder: (BuildContext context) {
                switch (routeSettings.name) {
                  case SettingsPage.routeName:
                    return const SettingsPage();
                  default:
                    return const MyHomePage(title: 'Flutter Demo Home Page');
                }
              },
            );
          },
        );
      },
    );
  }
}
