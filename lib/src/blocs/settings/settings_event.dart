part of 'settings_bloc.dart';

@immutable
abstract class SettingsEvent {}

class UpdateSettings extends SettingsEvent {
  final int position;
  final bool value;
  UpdateSettings({this.value, this.position});
}

class CheckSettings extends SettingsEvent {
  final int position;
  CheckSettings({this.position});
}
