import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(const SettingsState(ThemeMode.system)) {
    on<ChangeThemeEvent>(
        (event, emit) => emit(const SettingsState(ThemeMode.dark)));
  }
}
