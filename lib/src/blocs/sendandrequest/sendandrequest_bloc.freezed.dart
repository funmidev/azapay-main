// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'sendandrequest_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$SendandrequestEventTearOff {
  const _$SendandrequestEventTearOff();

// ignore: unused_element
  _Contacts contacts({double amount, bool screen}) {
    return _Contacts(
      amount: amount,
      screen: screen,
    );
  }

// ignore: unused_element
  _AddNote addnote({String note}) {
    return _AddNote(
      note: note,
    );
  }

// ignore: unused_element
  _Client clientid({String clientid}) {
    return _Client(
      clientid: clientid,
    );
  }

// ignore: unused_element
  _IsRadioSelectedPhoneNumber isRadioSelectedPhoneNumber({int selecteditem}) {
    return _IsRadioSelectedPhoneNumber(
      selecteditem: selecteditem,
    );
  }

// ignore: unused_element
  _IsContactFetched isContactFetched({bool fetched}) {
    return _IsContactFetched(
      fetched: fetched,
    );
  }

// ignore: unused_element
  _Submit submit({String pin}) {
    return _Submit(
      pin: pin,
    );
  }

// ignore: unused_element
  _Clear clear({bool exit = false}) {
    return _Clear(
      exit: exit,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $SendandrequestEvent = _$SendandrequestEventTearOff();

/// @nodoc
mixin _$SendandrequestEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult contacts(double amount, bool screen),
    @required TResult addnote(String note),
    @required TResult clientid(String clientid),
    @required TResult isRadioSelectedPhoneNumber(int selecteditem),
    @required TResult isContactFetched(bool fetched),
    @required TResult submit(String pin),
    @required TResult clear(bool exit),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult contacts(double amount, bool screen),
    TResult addnote(String note),
    TResult clientid(String clientid),
    TResult isRadioSelectedPhoneNumber(int selecteditem),
    TResult isContactFetched(bool fetched),
    TResult submit(String pin),
    TResult clear(bool exit),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult contacts(_Contacts value),
    @required TResult addnote(_AddNote value),
    @required TResult clientid(_Client value),
    @required
        TResult isRadioSelectedPhoneNumber(_IsRadioSelectedPhoneNumber value),
    @required TResult isContactFetched(_IsContactFetched value),
    @required TResult submit(_Submit value),
    @required TResult clear(_Clear value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult contacts(_Contacts value),
    TResult addnote(_AddNote value),
    TResult clientid(_Client value),
    TResult isRadioSelectedPhoneNumber(_IsRadioSelectedPhoneNumber value),
    TResult isContactFetched(_IsContactFetched value),
    TResult submit(_Submit value),
    TResult clear(_Clear value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $SendandrequestEventCopyWith<$Res> {
  factory $SendandrequestEventCopyWith(
          SendandrequestEvent value, $Res Function(SendandrequestEvent) then) =
      _$SendandrequestEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$SendandrequestEventCopyWithImpl<$Res>
    implements $SendandrequestEventCopyWith<$Res> {
  _$SendandrequestEventCopyWithImpl(this._value, this._then);

  final SendandrequestEvent _value;
  // ignore: unused_field
  final $Res Function(SendandrequestEvent) _then;
}

/// @nodoc
abstract class _$ContactsCopyWith<$Res> {
  factory _$ContactsCopyWith(_Contacts value, $Res Function(_Contacts) then) =
      __$ContactsCopyWithImpl<$Res>;
  $Res call({double amount, bool screen});
}

/// @nodoc
class __$ContactsCopyWithImpl<$Res>
    extends _$SendandrequestEventCopyWithImpl<$Res>
    implements _$ContactsCopyWith<$Res> {
  __$ContactsCopyWithImpl(_Contacts _value, $Res Function(_Contacts) _then)
      : super(_value, (v) => _then(v as _Contacts));

  @override
  _Contacts get _value => super._value as _Contacts;

  @override
  $Res call({
    Object amount = freezed,
    Object screen = freezed,
  }) {
    return _then(_Contacts(
      amount: amount == freezed ? _value.amount : amount as double,
      screen: screen == freezed ? _value.screen : screen as bool,
    ));
  }
}

/// @nodoc
class _$_Contacts with DiagnosticableTreeMixin implements _Contacts {
  _$_Contacts({this.amount, this.screen});

  @override
  final double amount;
  @override
  final bool screen;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SendandrequestEvent.contacts(amount: $amount, screen: $screen)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SendandrequestEvent.contacts'))
      ..add(DiagnosticsProperty('amount', amount))
      ..add(DiagnosticsProperty('screen', screen));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Contacts &&
            (identical(other.amount, amount) ||
                const DeepCollectionEquality().equals(other.amount, amount)) &&
            (identical(other.screen, screen) ||
                const DeepCollectionEquality().equals(other.screen, screen)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(amount) ^
      const DeepCollectionEquality().hash(screen);

  @JsonKey(ignore: true)
  @override
  _$ContactsCopyWith<_Contacts> get copyWith =>
      __$ContactsCopyWithImpl<_Contacts>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult contacts(double amount, bool screen),
    @required TResult addnote(String note),
    @required TResult clientid(String clientid),
    @required TResult isRadioSelectedPhoneNumber(int selecteditem),
    @required TResult isContactFetched(bool fetched),
    @required TResult submit(String pin),
    @required TResult clear(bool exit),
  }) {
    assert(contacts != null);
    assert(addnote != null);
    assert(clientid != null);
    assert(isRadioSelectedPhoneNumber != null);
    assert(isContactFetched != null);
    assert(submit != null);
    assert(clear != null);
    return contacts(amount, screen);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult contacts(double amount, bool screen),
    TResult addnote(String note),
    TResult clientid(String clientid),
    TResult isRadioSelectedPhoneNumber(int selecteditem),
    TResult isContactFetched(bool fetched),
    TResult submit(String pin),
    TResult clear(bool exit),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (contacts != null) {
      return contacts(amount, screen);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult contacts(_Contacts value),
    @required TResult addnote(_AddNote value),
    @required TResult clientid(_Client value),
    @required
        TResult isRadioSelectedPhoneNumber(_IsRadioSelectedPhoneNumber value),
    @required TResult isContactFetched(_IsContactFetched value),
    @required TResult submit(_Submit value),
    @required TResult clear(_Clear value),
  }) {
    assert(contacts != null);
    assert(addnote != null);
    assert(clientid != null);
    assert(isRadioSelectedPhoneNumber != null);
    assert(isContactFetched != null);
    assert(submit != null);
    assert(clear != null);
    return contacts(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult contacts(_Contacts value),
    TResult addnote(_AddNote value),
    TResult clientid(_Client value),
    TResult isRadioSelectedPhoneNumber(_IsRadioSelectedPhoneNumber value),
    TResult isContactFetched(_IsContactFetched value),
    TResult submit(_Submit value),
    TResult clear(_Clear value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (contacts != null) {
      return contacts(this);
    }
    return orElse();
  }
}

abstract class _Contacts implements SendandrequestEvent {
  factory _Contacts({double amount, bool screen}) = _$_Contacts;

  double get amount;
  bool get screen;
  @JsonKey(ignore: true)
  _$ContactsCopyWith<_Contacts> get copyWith;
}

/// @nodoc
abstract class _$AddNoteCopyWith<$Res> {
  factory _$AddNoteCopyWith(_AddNote value, $Res Function(_AddNote) then) =
      __$AddNoteCopyWithImpl<$Res>;
  $Res call({String note});
}

/// @nodoc
class __$AddNoteCopyWithImpl<$Res>
    extends _$SendandrequestEventCopyWithImpl<$Res>
    implements _$AddNoteCopyWith<$Res> {
  __$AddNoteCopyWithImpl(_AddNote _value, $Res Function(_AddNote) _then)
      : super(_value, (v) => _then(v as _AddNote));

  @override
  _AddNote get _value => super._value as _AddNote;

  @override
  $Res call({
    Object note = freezed,
  }) {
    return _then(_AddNote(
      note: note == freezed ? _value.note : note as String,
    ));
  }
}

/// @nodoc
class _$_AddNote with DiagnosticableTreeMixin implements _AddNote {
  _$_AddNote({this.note});

  @override
  final String note;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SendandrequestEvent.addnote(note: $note)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SendandrequestEvent.addnote'))
      ..add(DiagnosticsProperty('note', note));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AddNote &&
            (identical(other.note, note) ||
                const DeepCollectionEquality().equals(other.note, note)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(note);

  @JsonKey(ignore: true)
  @override
  _$AddNoteCopyWith<_AddNote> get copyWith =>
      __$AddNoteCopyWithImpl<_AddNote>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult contacts(double amount, bool screen),
    @required TResult addnote(String note),
    @required TResult clientid(String clientid),
    @required TResult isRadioSelectedPhoneNumber(int selecteditem),
    @required TResult isContactFetched(bool fetched),
    @required TResult submit(String pin),
    @required TResult clear(bool exit),
  }) {
    assert(contacts != null);
    assert(addnote != null);
    assert(clientid != null);
    assert(isRadioSelectedPhoneNumber != null);
    assert(isContactFetched != null);
    assert(submit != null);
    assert(clear != null);
    return addnote(note);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult contacts(double amount, bool screen),
    TResult addnote(String note),
    TResult clientid(String clientid),
    TResult isRadioSelectedPhoneNumber(int selecteditem),
    TResult isContactFetched(bool fetched),
    TResult submit(String pin),
    TResult clear(bool exit),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (addnote != null) {
      return addnote(note);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult contacts(_Contacts value),
    @required TResult addnote(_AddNote value),
    @required TResult clientid(_Client value),
    @required
        TResult isRadioSelectedPhoneNumber(_IsRadioSelectedPhoneNumber value),
    @required TResult isContactFetched(_IsContactFetched value),
    @required TResult submit(_Submit value),
    @required TResult clear(_Clear value),
  }) {
    assert(contacts != null);
    assert(addnote != null);
    assert(clientid != null);
    assert(isRadioSelectedPhoneNumber != null);
    assert(isContactFetched != null);
    assert(submit != null);
    assert(clear != null);
    return addnote(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult contacts(_Contacts value),
    TResult addnote(_AddNote value),
    TResult clientid(_Client value),
    TResult isRadioSelectedPhoneNumber(_IsRadioSelectedPhoneNumber value),
    TResult isContactFetched(_IsContactFetched value),
    TResult submit(_Submit value),
    TResult clear(_Clear value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (addnote != null) {
      return addnote(this);
    }
    return orElse();
  }
}

abstract class _AddNote implements SendandrequestEvent {
  factory _AddNote({String note}) = _$_AddNote;

  String get note;
  @JsonKey(ignore: true)
  _$AddNoteCopyWith<_AddNote> get copyWith;
}

/// @nodoc
abstract class _$ClientCopyWith<$Res> {
  factory _$ClientCopyWith(_Client value, $Res Function(_Client) then) =
      __$ClientCopyWithImpl<$Res>;
  $Res call({String clientid});
}

/// @nodoc
class __$ClientCopyWithImpl<$Res>
    extends _$SendandrequestEventCopyWithImpl<$Res>
    implements _$ClientCopyWith<$Res> {
  __$ClientCopyWithImpl(_Client _value, $Res Function(_Client) _then)
      : super(_value, (v) => _then(v as _Client));

  @override
  _Client get _value => super._value as _Client;

  @override
  $Res call({
    Object clientid = freezed,
  }) {
    return _then(_Client(
      clientid: clientid == freezed ? _value.clientid : clientid as String,
    ));
  }
}

/// @nodoc
class _$_Client with DiagnosticableTreeMixin implements _Client {
  _$_Client({this.clientid});

  @override
  final String clientid;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SendandrequestEvent.clientid(clientid: $clientid)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SendandrequestEvent.clientid'))
      ..add(DiagnosticsProperty('clientid', clientid));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Client &&
            (identical(other.clientid, clientid) ||
                const DeepCollectionEquality()
                    .equals(other.clientid, clientid)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(clientid);

  @JsonKey(ignore: true)
  @override
  _$ClientCopyWith<_Client> get copyWith =>
      __$ClientCopyWithImpl<_Client>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult contacts(double amount, bool screen),
    @required TResult addnote(String note),
    @required TResult clientid(String clientid),
    @required TResult isRadioSelectedPhoneNumber(int selecteditem),
    @required TResult isContactFetched(bool fetched),
    @required TResult submit(String pin),
    @required TResult clear(bool exit),
  }) {
    assert(contacts != null);
    assert(addnote != null);
    assert(clientid != null);
    assert(isRadioSelectedPhoneNumber != null);
    assert(isContactFetched != null);
    assert(submit != null);
    assert(clear != null);
    return clientid(this.clientid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult contacts(double amount, bool screen),
    TResult addnote(String note),
    TResult clientid(String clientid),
    TResult isRadioSelectedPhoneNumber(int selecteditem),
    TResult isContactFetched(bool fetched),
    TResult submit(String pin),
    TResult clear(bool exit),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (clientid != null) {
      return clientid(this.clientid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult contacts(_Contacts value),
    @required TResult addnote(_AddNote value),
    @required TResult clientid(_Client value),
    @required
        TResult isRadioSelectedPhoneNumber(_IsRadioSelectedPhoneNumber value),
    @required TResult isContactFetched(_IsContactFetched value),
    @required TResult submit(_Submit value),
    @required TResult clear(_Clear value),
  }) {
    assert(contacts != null);
    assert(addnote != null);
    assert(clientid != null);
    assert(isRadioSelectedPhoneNumber != null);
    assert(isContactFetched != null);
    assert(submit != null);
    assert(clear != null);
    return clientid(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult contacts(_Contacts value),
    TResult addnote(_AddNote value),
    TResult clientid(_Client value),
    TResult isRadioSelectedPhoneNumber(_IsRadioSelectedPhoneNumber value),
    TResult isContactFetched(_IsContactFetched value),
    TResult submit(_Submit value),
    TResult clear(_Clear value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (clientid != null) {
      return clientid(this);
    }
    return orElse();
  }
}

abstract class _Client implements SendandrequestEvent {
  factory _Client({String clientid}) = _$_Client;

  String get clientid;
  @JsonKey(ignore: true)
  _$ClientCopyWith<_Client> get copyWith;
}

/// @nodoc
abstract class _$IsRadioSelectedPhoneNumberCopyWith<$Res> {
  factory _$IsRadioSelectedPhoneNumberCopyWith(
          _IsRadioSelectedPhoneNumber value,
          $Res Function(_IsRadioSelectedPhoneNumber) then) =
      __$IsRadioSelectedPhoneNumberCopyWithImpl<$Res>;
  $Res call({int selecteditem});
}

/// @nodoc
class __$IsRadioSelectedPhoneNumberCopyWithImpl<$Res>
    extends _$SendandrequestEventCopyWithImpl<$Res>
    implements _$IsRadioSelectedPhoneNumberCopyWith<$Res> {
  __$IsRadioSelectedPhoneNumberCopyWithImpl(_IsRadioSelectedPhoneNumber _value,
      $Res Function(_IsRadioSelectedPhoneNumber) _then)
      : super(_value, (v) => _then(v as _IsRadioSelectedPhoneNumber));

  @override
  _IsRadioSelectedPhoneNumber get _value =>
      super._value as _IsRadioSelectedPhoneNumber;

  @override
  $Res call({
    Object selecteditem = freezed,
  }) {
    return _then(_IsRadioSelectedPhoneNumber(
      selecteditem:
          selecteditem == freezed ? _value.selecteditem : selecteditem as int,
    ));
  }
}

/// @nodoc
class _$_IsRadioSelectedPhoneNumber
    with DiagnosticableTreeMixin
    implements _IsRadioSelectedPhoneNumber {
  _$_IsRadioSelectedPhoneNumber({this.selecteditem});

  @override
  final int selecteditem;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SendandrequestEvent.isRadioSelectedPhoneNumber(selecteditem: $selecteditem)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'SendandrequestEvent.isRadioSelectedPhoneNumber'))
      ..add(DiagnosticsProperty('selecteditem', selecteditem));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _IsRadioSelectedPhoneNumber &&
            (identical(other.selecteditem, selecteditem) ||
                const DeepCollectionEquality()
                    .equals(other.selecteditem, selecteditem)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(selecteditem);

  @JsonKey(ignore: true)
  @override
  _$IsRadioSelectedPhoneNumberCopyWith<_IsRadioSelectedPhoneNumber>
      get copyWith => __$IsRadioSelectedPhoneNumberCopyWithImpl<
          _IsRadioSelectedPhoneNumber>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult contacts(double amount, bool screen),
    @required TResult addnote(String note),
    @required TResult clientid(String clientid),
    @required TResult isRadioSelectedPhoneNumber(int selecteditem),
    @required TResult isContactFetched(bool fetched),
    @required TResult submit(String pin),
    @required TResult clear(bool exit),
  }) {
    assert(contacts != null);
    assert(addnote != null);
    assert(clientid != null);
    assert(isRadioSelectedPhoneNumber != null);
    assert(isContactFetched != null);
    assert(submit != null);
    assert(clear != null);
    return isRadioSelectedPhoneNumber(selecteditem);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult contacts(double amount, bool screen),
    TResult addnote(String note),
    TResult clientid(String clientid),
    TResult isRadioSelectedPhoneNumber(int selecteditem),
    TResult isContactFetched(bool fetched),
    TResult submit(String pin),
    TResult clear(bool exit),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (isRadioSelectedPhoneNumber != null) {
      return isRadioSelectedPhoneNumber(selecteditem);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult contacts(_Contacts value),
    @required TResult addnote(_AddNote value),
    @required TResult clientid(_Client value),
    @required
        TResult isRadioSelectedPhoneNumber(_IsRadioSelectedPhoneNumber value),
    @required TResult isContactFetched(_IsContactFetched value),
    @required TResult submit(_Submit value),
    @required TResult clear(_Clear value),
  }) {
    assert(contacts != null);
    assert(addnote != null);
    assert(clientid != null);
    assert(isRadioSelectedPhoneNumber != null);
    assert(isContactFetched != null);
    assert(submit != null);
    assert(clear != null);
    return isRadioSelectedPhoneNumber(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult contacts(_Contacts value),
    TResult addnote(_AddNote value),
    TResult clientid(_Client value),
    TResult isRadioSelectedPhoneNumber(_IsRadioSelectedPhoneNumber value),
    TResult isContactFetched(_IsContactFetched value),
    TResult submit(_Submit value),
    TResult clear(_Clear value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (isRadioSelectedPhoneNumber != null) {
      return isRadioSelectedPhoneNumber(this);
    }
    return orElse();
  }
}

abstract class _IsRadioSelectedPhoneNumber implements SendandrequestEvent {
  factory _IsRadioSelectedPhoneNumber({int selecteditem}) =
      _$_IsRadioSelectedPhoneNumber;

  int get selecteditem;
  @JsonKey(ignore: true)
  _$IsRadioSelectedPhoneNumberCopyWith<_IsRadioSelectedPhoneNumber>
      get copyWith;
}

/// @nodoc
abstract class _$IsContactFetchedCopyWith<$Res> {
  factory _$IsContactFetchedCopyWith(
          _IsContactFetched value, $Res Function(_IsContactFetched) then) =
      __$IsContactFetchedCopyWithImpl<$Res>;
  $Res call({bool fetched});
}

/// @nodoc
class __$IsContactFetchedCopyWithImpl<$Res>
    extends _$SendandrequestEventCopyWithImpl<$Res>
    implements _$IsContactFetchedCopyWith<$Res> {
  __$IsContactFetchedCopyWithImpl(
      _IsContactFetched _value, $Res Function(_IsContactFetched) _then)
      : super(_value, (v) => _then(v as _IsContactFetched));

  @override
  _IsContactFetched get _value => super._value as _IsContactFetched;

  @override
  $Res call({
    Object fetched = freezed,
  }) {
    return _then(_IsContactFetched(
      fetched: fetched == freezed ? _value.fetched : fetched as bool,
    ));
  }
}

/// @nodoc
class _$_IsContactFetched
    with DiagnosticableTreeMixin
    implements _IsContactFetched {
  _$_IsContactFetched({this.fetched});

  @override
  final bool fetched;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SendandrequestEvent.isContactFetched(fetched: $fetched)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SendandrequestEvent.isContactFetched'))
      ..add(DiagnosticsProperty('fetched', fetched));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _IsContactFetched &&
            (identical(other.fetched, fetched) ||
                const DeepCollectionEquality().equals(other.fetched, fetched)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(fetched);

  @JsonKey(ignore: true)
  @override
  _$IsContactFetchedCopyWith<_IsContactFetched> get copyWith =>
      __$IsContactFetchedCopyWithImpl<_IsContactFetched>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult contacts(double amount, bool screen),
    @required TResult addnote(String note),
    @required TResult clientid(String clientid),
    @required TResult isRadioSelectedPhoneNumber(int selecteditem),
    @required TResult isContactFetched(bool fetched),
    @required TResult submit(String pin),
    @required TResult clear(bool exit),
  }) {
    assert(contacts != null);
    assert(addnote != null);
    assert(clientid != null);
    assert(isRadioSelectedPhoneNumber != null);
    assert(isContactFetched != null);
    assert(submit != null);
    assert(clear != null);
    return isContactFetched(fetched);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult contacts(double amount, bool screen),
    TResult addnote(String note),
    TResult clientid(String clientid),
    TResult isRadioSelectedPhoneNumber(int selecteditem),
    TResult isContactFetched(bool fetched),
    TResult submit(String pin),
    TResult clear(bool exit),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (isContactFetched != null) {
      return isContactFetched(fetched);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult contacts(_Contacts value),
    @required TResult addnote(_AddNote value),
    @required TResult clientid(_Client value),
    @required
        TResult isRadioSelectedPhoneNumber(_IsRadioSelectedPhoneNumber value),
    @required TResult isContactFetched(_IsContactFetched value),
    @required TResult submit(_Submit value),
    @required TResult clear(_Clear value),
  }) {
    assert(contacts != null);
    assert(addnote != null);
    assert(clientid != null);
    assert(isRadioSelectedPhoneNumber != null);
    assert(isContactFetched != null);
    assert(submit != null);
    assert(clear != null);
    return isContactFetched(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult contacts(_Contacts value),
    TResult addnote(_AddNote value),
    TResult clientid(_Client value),
    TResult isRadioSelectedPhoneNumber(_IsRadioSelectedPhoneNumber value),
    TResult isContactFetched(_IsContactFetched value),
    TResult submit(_Submit value),
    TResult clear(_Clear value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (isContactFetched != null) {
      return isContactFetched(this);
    }
    return orElse();
  }
}

abstract class _IsContactFetched implements SendandrequestEvent {
  factory _IsContactFetched({bool fetched}) = _$_IsContactFetched;

  bool get fetched;
  @JsonKey(ignore: true)
  _$IsContactFetchedCopyWith<_IsContactFetched> get copyWith;
}

/// @nodoc
abstract class _$SubmitCopyWith<$Res> {
  factory _$SubmitCopyWith(_Submit value, $Res Function(_Submit) then) =
      __$SubmitCopyWithImpl<$Res>;
  $Res call({String pin});
}

/// @nodoc
class __$SubmitCopyWithImpl<$Res>
    extends _$SendandrequestEventCopyWithImpl<$Res>
    implements _$SubmitCopyWith<$Res> {
  __$SubmitCopyWithImpl(_Submit _value, $Res Function(_Submit) _then)
      : super(_value, (v) => _then(v as _Submit));

  @override
  _Submit get _value => super._value as _Submit;

  @override
  $Res call({
    Object pin = freezed,
  }) {
    return _then(_Submit(
      pin: pin == freezed ? _value.pin : pin as String,
    ));
  }
}

/// @nodoc
class _$_Submit with DiagnosticableTreeMixin implements _Submit {
  _$_Submit({this.pin});

  @override
  final String pin;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SendandrequestEvent.submit(pin: $pin)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SendandrequestEvent.submit'))
      ..add(DiagnosticsProperty('pin', pin));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Submit &&
            (identical(other.pin, pin) ||
                const DeepCollectionEquality().equals(other.pin, pin)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(pin);

  @JsonKey(ignore: true)
  @override
  _$SubmitCopyWith<_Submit> get copyWith =>
      __$SubmitCopyWithImpl<_Submit>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult contacts(double amount, bool screen),
    @required TResult addnote(String note),
    @required TResult clientid(String clientid),
    @required TResult isRadioSelectedPhoneNumber(int selecteditem),
    @required TResult isContactFetched(bool fetched),
    @required TResult submit(String pin),
    @required TResult clear(bool exit),
  }) {
    assert(contacts != null);
    assert(addnote != null);
    assert(clientid != null);
    assert(isRadioSelectedPhoneNumber != null);
    assert(isContactFetched != null);
    assert(submit != null);
    assert(clear != null);
    return submit(pin);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult contacts(double amount, bool screen),
    TResult addnote(String note),
    TResult clientid(String clientid),
    TResult isRadioSelectedPhoneNumber(int selecteditem),
    TResult isContactFetched(bool fetched),
    TResult submit(String pin),
    TResult clear(bool exit),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (submit != null) {
      return submit(pin);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult contacts(_Contacts value),
    @required TResult addnote(_AddNote value),
    @required TResult clientid(_Client value),
    @required
        TResult isRadioSelectedPhoneNumber(_IsRadioSelectedPhoneNumber value),
    @required TResult isContactFetched(_IsContactFetched value),
    @required TResult submit(_Submit value),
    @required TResult clear(_Clear value),
  }) {
    assert(contacts != null);
    assert(addnote != null);
    assert(clientid != null);
    assert(isRadioSelectedPhoneNumber != null);
    assert(isContactFetched != null);
    assert(submit != null);
    assert(clear != null);
    return submit(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult contacts(_Contacts value),
    TResult addnote(_AddNote value),
    TResult clientid(_Client value),
    TResult isRadioSelectedPhoneNumber(_IsRadioSelectedPhoneNumber value),
    TResult isContactFetched(_IsContactFetched value),
    TResult submit(_Submit value),
    TResult clear(_Clear value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (submit != null) {
      return submit(this);
    }
    return orElse();
  }
}

abstract class _Submit implements SendandrequestEvent {
  factory _Submit({String pin}) = _$_Submit;

  String get pin;
  @JsonKey(ignore: true)
  _$SubmitCopyWith<_Submit> get copyWith;
}

/// @nodoc
abstract class _$ClearCopyWith<$Res> {
  factory _$ClearCopyWith(_Clear value, $Res Function(_Clear) then) =
      __$ClearCopyWithImpl<$Res>;
  $Res call({bool exit});
}

/// @nodoc
class __$ClearCopyWithImpl<$Res> extends _$SendandrequestEventCopyWithImpl<$Res>
    implements _$ClearCopyWith<$Res> {
  __$ClearCopyWithImpl(_Clear _value, $Res Function(_Clear) _then)
      : super(_value, (v) => _then(v as _Clear));

  @override
  _Clear get _value => super._value as _Clear;

  @override
  $Res call({
    Object exit = freezed,
  }) {
    return _then(_Clear(
      exit: exit == freezed ? _value.exit : exit as bool,
    ));
  }
}

/// @nodoc
class _$_Clear with DiagnosticableTreeMixin implements _Clear {
  _$_Clear({this.exit = false}) : assert(exit != null);

  @JsonKey(defaultValue: false)
  @override
  final bool exit;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SendandrequestEvent.clear(exit: $exit)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SendandrequestEvent.clear'))
      ..add(DiagnosticsProperty('exit', exit));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Clear &&
            (identical(other.exit, exit) ||
                const DeepCollectionEquality().equals(other.exit, exit)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(exit);

  @JsonKey(ignore: true)
  @override
  _$ClearCopyWith<_Clear> get copyWith =>
      __$ClearCopyWithImpl<_Clear>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult contacts(double amount, bool screen),
    @required TResult addnote(String note),
    @required TResult clientid(String clientid),
    @required TResult isRadioSelectedPhoneNumber(int selecteditem),
    @required TResult isContactFetched(bool fetched),
    @required TResult submit(String pin),
    @required TResult clear(bool exit),
  }) {
    assert(contacts != null);
    assert(addnote != null);
    assert(clientid != null);
    assert(isRadioSelectedPhoneNumber != null);
    assert(isContactFetched != null);
    assert(submit != null);
    assert(clear != null);
    return clear(exit);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult contacts(double amount, bool screen),
    TResult addnote(String note),
    TResult clientid(String clientid),
    TResult isRadioSelectedPhoneNumber(int selecteditem),
    TResult isContactFetched(bool fetched),
    TResult submit(String pin),
    TResult clear(bool exit),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (clear != null) {
      return clear(exit);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult contacts(_Contacts value),
    @required TResult addnote(_AddNote value),
    @required TResult clientid(_Client value),
    @required
        TResult isRadioSelectedPhoneNumber(_IsRadioSelectedPhoneNumber value),
    @required TResult isContactFetched(_IsContactFetched value),
    @required TResult submit(_Submit value),
    @required TResult clear(_Clear value),
  }) {
    assert(contacts != null);
    assert(addnote != null);
    assert(clientid != null);
    assert(isRadioSelectedPhoneNumber != null);
    assert(isContactFetched != null);
    assert(submit != null);
    assert(clear != null);
    return clear(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult contacts(_Contacts value),
    TResult addnote(_AddNote value),
    TResult clientid(_Client value),
    TResult isRadioSelectedPhoneNumber(_IsRadioSelectedPhoneNumber value),
    TResult isContactFetched(_IsContactFetched value),
    TResult submit(_Submit value),
    TResult clear(_Clear value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (clear != null) {
      return clear(this);
    }
    return orElse();
  }
}

abstract class _Clear implements SendandrequestEvent {
  factory _Clear({bool exit}) = _$_Clear;

  bool get exit;
  @JsonKey(ignore: true)
  _$ClearCopyWith<_Clear> get copyWith;
}

/// @nodoc
class _$InputDataFundStateTearOff {
  const _$InputDataFundStateTearOff();

// ignore: unused_element
  _InputDataFundState call(
      {bool screen,
      double amount,
      String client = AppStrings.empty,
      String note = AppStrings.empty,
      int success = 100,
      int error = 100,
      String responsemessage,
      int isRadioSelectedPhoneNumber,
      bool isContactFetched = false,
      List<DeviceContacts> devicecontact = const [],
      List<Contacts> contacts = const []}) {
    return _InputDataFundState(
      screen: screen,
      amount: amount,
      client: client,
      note: note,
      success: success,
      error: error,
      responsemessage: responsemessage,
      isRadioSelectedPhoneNumber: isRadioSelectedPhoneNumber,
      isContactFetched: isContactFetched,
      devicecontact: devicecontact,
      contacts: contacts,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $InputDataFundState = _$InputDataFundStateTearOff();

/// @nodoc
mixin _$InputDataFundState {
  bool get screen;
  double get amount;
  String get client;
  String get note;
  int get success;
  int get error;
  String get responsemessage;
  int get isRadioSelectedPhoneNumber;
  bool get isContactFetched;
  List<DeviceContacts> get devicecontact;
  List<Contacts> get contacts;

  @JsonKey(ignore: true)
  $InputDataFundStateCopyWith<InputDataFundState> get copyWith;
}

/// @nodoc
abstract class $InputDataFundStateCopyWith<$Res> {
  factory $InputDataFundStateCopyWith(
          InputDataFundState value, $Res Function(InputDataFundState) then) =
      _$InputDataFundStateCopyWithImpl<$Res>;
  $Res call(
      {bool screen,
      double amount,
      String client,
      String note,
      int success,
      int error,
      String responsemessage,
      int isRadioSelectedPhoneNumber,
      bool isContactFetched,
      List<DeviceContacts> devicecontact,
      List<Contacts> contacts});
}

/// @nodoc
class _$InputDataFundStateCopyWithImpl<$Res>
    implements $InputDataFundStateCopyWith<$Res> {
  _$InputDataFundStateCopyWithImpl(this._value, this._then);

  final InputDataFundState _value;
  // ignore: unused_field
  final $Res Function(InputDataFundState) _then;

  @override
  $Res call({
    Object screen = freezed,
    Object amount = freezed,
    Object client = freezed,
    Object note = freezed,
    Object success = freezed,
    Object error = freezed,
    Object responsemessage = freezed,
    Object isRadioSelectedPhoneNumber = freezed,
    Object isContactFetched = freezed,
    Object devicecontact = freezed,
    Object contacts = freezed,
  }) {
    return _then(_value.copyWith(
      screen: screen == freezed ? _value.screen : screen as bool,
      amount: amount == freezed ? _value.amount : amount as double,
      client: client == freezed ? _value.client : client as String,
      note: note == freezed ? _value.note : note as String,
      success: success == freezed ? _value.success : success as int,
      error: error == freezed ? _value.error : error as int,
      responsemessage: responsemessage == freezed
          ? _value.responsemessage
          : responsemessage as String,
      isRadioSelectedPhoneNumber: isRadioSelectedPhoneNumber == freezed
          ? _value.isRadioSelectedPhoneNumber
          : isRadioSelectedPhoneNumber as int,
      isContactFetched: isContactFetched == freezed
          ? _value.isContactFetched
          : isContactFetched as bool,
      devicecontact: devicecontact == freezed
          ? _value.devicecontact
          : devicecontact as List<DeviceContacts>,
      contacts:
          contacts == freezed ? _value.contacts : contacts as List<Contacts>,
    ));
  }
}

/// @nodoc
abstract class _$InputDataFundStateCopyWith<$Res>
    implements $InputDataFundStateCopyWith<$Res> {
  factory _$InputDataFundStateCopyWith(
          _InputDataFundState value, $Res Function(_InputDataFundState) then) =
      __$InputDataFundStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool screen,
      double amount,
      String client,
      String note,
      int success,
      int error,
      String responsemessage,
      int isRadioSelectedPhoneNumber,
      bool isContactFetched,
      List<DeviceContacts> devicecontact,
      List<Contacts> contacts});
}

/// @nodoc
class __$InputDataFundStateCopyWithImpl<$Res>
    extends _$InputDataFundStateCopyWithImpl<$Res>
    implements _$InputDataFundStateCopyWith<$Res> {
  __$InputDataFundStateCopyWithImpl(
      _InputDataFundState _value, $Res Function(_InputDataFundState) _then)
      : super(_value, (v) => _then(v as _InputDataFundState));

  @override
  _InputDataFundState get _value => super._value as _InputDataFundState;

  @override
  $Res call({
    Object screen = freezed,
    Object amount = freezed,
    Object client = freezed,
    Object note = freezed,
    Object success = freezed,
    Object error = freezed,
    Object responsemessage = freezed,
    Object isRadioSelectedPhoneNumber = freezed,
    Object isContactFetched = freezed,
    Object devicecontact = freezed,
    Object contacts = freezed,
  }) {
    return _then(_InputDataFundState(
      screen: screen == freezed ? _value.screen : screen as bool,
      amount: amount == freezed ? _value.amount : amount as double,
      client: client == freezed ? _value.client : client as String,
      note: note == freezed ? _value.note : note as String,
      success: success == freezed ? _value.success : success as int,
      error: error == freezed ? _value.error : error as int,
      responsemessage: responsemessage == freezed
          ? _value.responsemessage
          : responsemessage as String,
      isRadioSelectedPhoneNumber: isRadioSelectedPhoneNumber == freezed
          ? _value.isRadioSelectedPhoneNumber
          : isRadioSelectedPhoneNumber as int,
      isContactFetched: isContactFetched == freezed
          ? _value.isContactFetched
          : isContactFetched as bool,
      devicecontact: devicecontact == freezed
          ? _value.devicecontact
          : devicecontact as List<DeviceContacts>,
      contacts:
          contacts == freezed ? _value.contacts : contacts as List<Contacts>,
    ));
  }
}

/// @nodoc
class _$_InputDataFundState
    with DiagnosticableTreeMixin
    implements _InputDataFundState {
  _$_InputDataFundState(
      {this.screen,
      this.amount,
      this.client = AppStrings.empty,
      this.note = AppStrings.empty,
      this.success = 100,
      this.error = 100,
      this.responsemessage,
      this.isRadioSelectedPhoneNumber,
      this.isContactFetched = false,
      this.devicecontact = const [],
      this.contacts = const []})
      : assert(client != null),
        assert(note != null),
        assert(success != null),
        assert(error != null),
        assert(isContactFetched != null),
        assert(devicecontact != null),
        assert(contacts != null);

  @override
  final bool screen;
  @override
  final double amount;
  @JsonKey(defaultValue: AppStrings.empty)
  @override
  final String client;
  @JsonKey(defaultValue: AppStrings.empty)
  @override
  final String note;
  @JsonKey(defaultValue: 100)
  @override
  final int success;
  @JsonKey(defaultValue: 100)
  @override
  final int error;
  @override
  final String responsemessage;
  @override
  final int isRadioSelectedPhoneNumber;
  @JsonKey(defaultValue: false)
  @override
  final bool isContactFetched;
  @JsonKey(defaultValue: const [])
  @override
  final List<DeviceContacts> devicecontact;
  @JsonKey(defaultValue: const [])
  @override
  final List<Contacts> contacts;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'InputDataFundState(screen: $screen, amount: $amount, client: $client, note: $note, success: $success, error: $error, responsemessage: $responsemessage, isRadioSelectedPhoneNumber: $isRadioSelectedPhoneNumber, isContactFetched: $isContactFetched, devicecontact: $devicecontact, contacts: $contacts)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'InputDataFundState'))
      ..add(DiagnosticsProperty('screen', screen))
      ..add(DiagnosticsProperty('amount', amount))
      ..add(DiagnosticsProperty('client', client))
      ..add(DiagnosticsProperty('note', note))
      ..add(DiagnosticsProperty('success', success))
      ..add(DiagnosticsProperty('error', error))
      ..add(DiagnosticsProperty('responsemessage', responsemessage))
      ..add(DiagnosticsProperty(
          'isRadioSelectedPhoneNumber', isRadioSelectedPhoneNumber))
      ..add(DiagnosticsProperty('isContactFetched', isContactFetched))
      ..add(DiagnosticsProperty('devicecontact', devicecontact))
      ..add(DiagnosticsProperty('contacts', contacts));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _InputDataFundState &&
            (identical(other.screen, screen) ||
                const DeepCollectionEquality().equals(other.screen, screen)) &&
            (identical(other.amount, amount) ||
                const DeepCollectionEquality().equals(other.amount, amount)) &&
            (identical(other.client, client) ||
                const DeepCollectionEquality().equals(other.client, client)) &&
            (identical(other.note, note) ||
                const DeepCollectionEquality().equals(other.note, note)) &&
            (identical(other.success, success) ||
                const DeepCollectionEquality()
                    .equals(other.success, success)) &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)) &&
            (identical(other.responsemessage, responsemessage) ||
                const DeepCollectionEquality()
                    .equals(other.responsemessage, responsemessage)) &&
            (identical(other.isRadioSelectedPhoneNumber,
                    isRadioSelectedPhoneNumber) ||
                const DeepCollectionEquality().equals(
                    other.isRadioSelectedPhoneNumber,
                    isRadioSelectedPhoneNumber)) &&
            (identical(other.isContactFetched, isContactFetched) ||
                const DeepCollectionEquality()
                    .equals(other.isContactFetched, isContactFetched)) &&
            (identical(other.devicecontact, devicecontact) ||
                const DeepCollectionEquality()
                    .equals(other.devicecontact, devicecontact)) &&
            (identical(other.contacts, contacts) ||
                const DeepCollectionEquality()
                    .equals(other.contacts, contacts)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(screen) ^
      const DeepCollectionEquality().hash(amount) ^
      const DeepCollectionEquality().hash(client) ^
      const DeepCollectionEquality().hash(note) ^
      const DeepCollectionEquality().hash(success) ^
      const DeepCollectionEquality().hash(error) ^
      const DeepCollectionEquality().hash(responsemessage) ^
      const DeepCollectionEquality().hash(isRadioSelectedPhoneNumber) ^
      const DeepCollectionEquality().hash(isContactFetched) ^
      const DeepCollectionEquality().hash(devicecontact) ^
      const DeepCollectionEquality().hash(contacts);

  @JsonKey(ignore: true)
  @override
  _$InputDataFundStateCopyWith<_InputDataFundState> get copyWith =>
      __$InputDataFundStateCopyWithImpl<_InputDataFundState>(this, _$identity);
}

abstract class _InputDataFundState implements InputDataFundState {
  factory _InputDataFundState(
      {bool screen,
      double amount,
      String client,
      String note,
      int success,
      int error,
      String responsemessage,
      int isRadioSelectedPhoneNumber,
      bool isContactFetched,
      List<DeviceContacts> devicecontact,
      List<Contacts> contacts}) = _$_InputDataFundState;

  @override
  bool get screen;
  @override
  double get amount;
  @override
  String get client;
  @override
  String get note;
  @override
  int get success;
  @override
  int get error;
  @override
  String get responsemessage;
  @override
  int get isRadioSelectedPhoneNumber;
  @override
  bool get isContactFetched;
  @override
  List<DeviceContacts> get devicecontact;
  @override
  List<Contacts> get contacts;
  @override
  @JsonKey(ignore: true)
  _$InputDataFundStateCopyWith<_InputDataFundState> get copyWith;
}
