part of 'settings_bloc.dart';

@freezed
abstract class SettingsState with _$SettingsState {
  factory SettingsState({
    @Default(false) bool securityvalue,
    @Default(false) bool tagvisibilityvalue,
    @Default(false) bool alloweveryonevalue,
    @Default(false) bool contactsonlyvalue,
  }) = _SettingsState;
}
