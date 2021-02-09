part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {}

class FetchProfile extends ProfileEvent {
  // final FetchProfileDetails initial;
  // FetchProfile({this.initial});
}

class UpdateProfile extends ProfileEvent {
  // final FetchProfileDetails initial;
  // FetchProfile({this.initial});
}

class AzaTagProfile extends ProfileEvent {
  final String tag;
  AzaTagProfile({this.tag});
}

class EmailProfile extends ProfileEvent {
  final String email;
  EmailProfile({this.email});
}

class GenderProfile extends ProfileEvent {
  final String gender;
  GenderProfile({this.gender});
}

class DoBProfile extends ProfileEvent {
  final DateTime dob;
  DoBProfile({this.dob});
}

class AddressProfile extends ProfileEvent {
  final String address;
  AddressProfile({this.address});
}

class BusinessAddressProfile extends ProfileEvent {
  final String businessaddress;
  BusinessAddressProfile({this.businessaddress});
}

class BusinessNameProfile extends ProfileEvent {
  final String businessname;
  BusinessNameProfile({this.businessname});
}

class RCProfile extends ProfileEvent {
  final String rc;
  RCProfile({this.rc});
}

class BvnProfile extends ProfileEvent {
  final String bvn;
  BvnProfile({this.bvn});
}

class StateProfile extends ProfileEvent {
  final String state;
  StateProfile({this.state});
}

class ValidIdProfile extends ProfileEvent {}

class ValidCACIdMerchantProfile extends ProfileEvent {}

class ProfileImage extends ProfileEvent {}

class TierProfile extends ProfileEvent {
  final String tier;
  TierProfile({this.tier});
}

class SubmitBvnProfile extends ProfileEvent {}

class SubmitValidIdProfile extends ProfileEvent {}

class SubmitProfile extends ProfileEvent {}

class DeleteEveryResponse extends ProfileEvent {}

class ClearProfileResponse extends ProfileEvent {}

class HelpandSupport extends ProfileEvent {}
