import 'dart:async';

import 'package:azapay/src/resources/resources.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';
import 'package:flutter/foundation.dart';

part 'settings_event.dart';
part 'settings_state.dart';
part 'settings_bloc.freezed.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final Repository repository;

  SettingsBloc({this.repository})
      : super(SettingsState().copyWith(
          securityvalue: repository.getSettings(position: 0) ?? false,
          tagvisibilityvalue: repository.getSettings(position: 1) ?? false,
          alloweveryonevalue: repository.getSettings(position: 2) ?? false,
          contactsonlyvalue: repository.getSettings(position: 3) ?? false,
        ));

  @override
  Stream<SettingsState> mapEventToState(
    SettingsEvent event,
  ) async* {
    if (event is UpdateSettings) {
      await repository.addSettings(value: event.value, position: event.position);
      print(event.position);

      yield state.copyWith(
        securityvalue: repository.getSettings(position: 0) ?? false,
        tagvisibilityvalue: repository.getSettings(position: 1) ?? false,
        alloweveryonevalue: repository.getSettings(position: 2) ?? false,
        contactsonlyvalue: repository.getSettings(position: 3) ?? false,
      );
      //SettingsState(value: repository.getSettings(position: event.position), position: event.position);
    } else if (event is CheckSettings) {
      // yield SettingsState(value: repository.getSettings(position: event.position));
    }
  }
}
