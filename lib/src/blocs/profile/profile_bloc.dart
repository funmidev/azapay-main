import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:azapay/app/app.dart';
import 'package:azapay/src/blocs/blocs.dart';
import 'package:azapay/src/models/models.dart';
import 'package:azapay/src/resources/resources.dart';
import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_freshchat/flutter_freshchat.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:logger/logger.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:meta/meta.dart';
import 'dart:convert';

import 'package:universal_platform/universal_platform.dart';

part 'profile_event.dart';
part 'profile_state.dart';
part 'profile_bloc.freezed.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final Repository repository;
  final WalletBloc walletBloc;
  final _logger = Logger();
  final NotificationBloc notificationBloc;
  final GlobalKey<NavigatorState> navigatorState;

  ProfileBloc({this.repository, this.walletBloc, this.navigatorState, this.notificationBloc}) : super(ProfileInitial());
  final _previousState = <ProfileState>[];

  @override
  void onTransition(Transition<ProfileEvent, ProfileState> transition) {
    _previousState.add(transition.currentState);
    print(transition);
    super.onTransition(transition);
  }

  @override
  Stream<ProfileState> mapEventToState(
    ProfileEvent event,
  ) async* {
    if (event is FetchProfile) {
      if (repository.retrievePersonalData() != null) {
        final jsonState = await rootBundle.loadString(AppDoc.nigeriaState);
        final jsonResponse = json.decode(jsonState);
        yield ProfileLoaded().copyWith(
            signUp: SignUp(
              data: repository.retrievePersonalData(),
            ),
            profilepic: repository.getcacheFilename(index: 0),
            helpandsupportRestoreId: AppStrings.empty,
            stateList: (jsonResponse['states'] as List)?.map((e) => e as String)?.toList());
      }
    } else if (event is UpdateProfile) {
      try {
        final response =
            UniversalPlatform.isWeb ? await repository.retrieveMerchantProfile() : await repository.retrieveProfile();
        final profilepicsresponse = await repository.getprofilepic();
        final jsonState = await rootBundle.loadString(AppDoc.nigeriaState);
        final jsonResponse = json.decode(jsonState);
        _logger.i(response.status, response.message);
        // if (response.status == 200 || profilepicsresponse?.data?.isNotEmpty) {
        await repository.addPersonalData(personalData: response.data);
        // if (repository.getcacheFilename(index: 0) == null) {
        await repository.storecacheFilename(index: 0, picturebyte: base64Decode(profilepicsresponse.data));
        yield response.status == 200
            ? ProfileLoaded().copyWith(
                signUp: response,
                stateList: (jsonResponse['states'] as List)?.map((e) => e as String)?.toList(),
                profilepic: profilepicsresponse?.data?.isNotEmpty
                    ? base64Decode(profilepicsresponse.data)
                    : repository.getcacheFilename(index: 0),
                helpandsupportRestoreId: AppStrings.empty)
            : ProfileLoaded().copyWith(
                stateList: (jsonResponse['states'] as List)?.map((e) => e as String)?.toList(),
                profilepic: profilepicsresponse?.data?.isNotEmpty
                    ? base64Decode(profilepicsresponse.data)
                    : repository.getcacheFilename(index: 0),
                helpandsupportRestoreId: AppStrings.empty);
        // (!response.data.bvn) ? await navigatorState.currentState.pushNamed(AppRouteName.completeprofile) : null;
        //   } else {
        //     yield ProfileLoaded().copyWith(
        //         signUp: response,
        //         stateList: (jsonResponse['states'] as List)?.map((e) => e as String)?.toList(),
        //         profilepic: repository.getcacheFilename(index: 0),
        //         helpandsupportRestoreId: AppStrings.empty);
        //   }
        // }
        // }
      } catch (e) {
        if (repository.retrievePersonalData() != null) {
          final jsonState = await rootBundle.loadString(AppDoc.nigeriaState);
          final jsonResponse = json.decode(jsonState);
          yield ProfileLoaded().copyWith(
              signUp: SignUp(
                data: repository.retrievePersonalData(),
              ),
              profilepic: repository.getcacheFilename(index: 0),
              helpandsupportRestoreId: AppStrings.empty,
              stateList: (jsonResponse['states'] as List)?.map((e) => e as String)?.toList());
        }
      }
    } else if (event is ProfileImage) {
      final file = await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: ['jpg']);
      File croppedFile;
      if (UniversalPlatform.isAndroid || UniversalPlatform.isIOS) {
        croppedFile = await ImageCropper.cropImage(
            sourcePath: file.files.single.path,
            aspectRatioPresets: UniversalPlatform.isAndroid
                ? [
                    CropAspectRatioPreset.square,
                    CropAspectRatioPreset.ratio3x2,
                    CropAspectRatioPreset.original,
                    CropAspectRatioPreset.ratio4x3,
                    CropAspectRatioPreset.ratio16x9
                  ]
                : [
                    CropAspectRatioPreset.original,
                    CropAspectRatioPreset.square,
                    CropAspectRatioPreset.ratio3x2,
                    CropAspectRatioPreset.ratio4x3,
                    CropAspectRatioPreset.ratio5x3,
                    CropAspectRatioPreset.ratio5x4,
                    CropAspectRatioPreset.ratio7x5,
                    CropAspectRatioPreset.ratio16x9
                  ],
            androidUiSettings: AndroidUiSettings(
                toolbarTitle: 'Azapay',
                toolbarColor: ColorSets.colorPrimaryWhite,
                toolbarWidgetColor: ColorSets.colorPrimaryLightYellow,
                initAspectRatio: CropAspectRatioPreset.original,
                lockAspectRatio: false),
            iosUiSettings: IOSUiSettings(
              title: 'Edit Photo',
              minimumAspectRatio: 1.0,
            ));
      }
      //_logger.i(file.toString());
      if (file != null) {
        // yield ProfileLoading();
        // final profile = _previousState.whereType<ProfileLoaded>().last;
        try {
          final response = await repository.modifyProfilePic(file: croppedFile);
          //_logger.i(response.message);
          if (response.status == 200) {
            await repository.storecacheFilename(index: 0, picturebyte: croppedFile.readAsBytesSync());
            yield (state as ProfileLoaded).copyWith(profilepic: repository.getcacheFilename(index: 0), success: 200);
          }
        } catch (e) {}
      }
    } else if (event is ValidIdProfile) {
      final file = await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: ['jpg']);
      File croppedFile;
      if (UniversalPlatform.isAndroid || UniversalPlatform.isIOS) {
        croppedFile = await ImageCropper.cropImage(
            sourcePath: file.files.single.path,
            aspectRatioPresets: UniversalPlatform.isAndroid
                ? [
                    CropAspectRatioPreset.square,
                    CropAspectRatioPreset.ratio3x2,
                    CropAspectRatioPreset.original,
                    CropAspectRatioPreset.ratio4x3,
                    CropAspectRatioPreset.ratio16x9
                  ]
                : [
                    CropAspectRatioPreset.original,
                    CropAspectRatioPreset.square,
                    CropAspectRatioPreset.ratio3x2,
                    CropAspectRatioPreset.ratio4x3,
                    CropAspectRatioPreset.ratio5x3,
                    CropAspectRatioPreset.ratio5x4,
                    CropAspectRatioPreset.ratio7x5,
                    CropAspectRatioPreset.ratio16x9
                  ],
            androidUiSettings: AndroidUiSettings(
                toolbarTitle: 'Azapay',
                toolbarColor: ColorSets.colorPrimaryWhite,
                toolbarWidgetColor: ColorSets.colorPrimaryLightYellow,
                initAspectRatio: CropAspectRatioPreset.original,
                lockAspectRatio: false),
            iosUiSettings: IOSUiSettings(
              title: 'Edit Photo',
              minimumAspectRatio: 1.0,
            ));
      }
      //_logger.i(file.toString());
      if (file != null) {
        yield (state as ProfileLoaded).copyWith(validid: croppedFile ?? File(file.files.single.path));
      }
    } else if (event is AzaTagProfile) {
      yield (state as ProfileLoaded).copyWith(tag: event.tag);
    } else if (event is GenderProfile) {
      yield (state as ProfileLoaded).copyWith(gender: event.gender);
    } else if (event is BvnProfile) {
      if (state is ProfileLoaded) {
        //_logger.i(event.bvn);
        yield (state as ProfileLoaded).copyWith(bvn: event.bvn);
      } else {
        yield ProfileLoaded().copyWith(bvn: event.bvn);
      }
    } else if (event is AddressProfile) {
      yield (state as ProfileLoaded).copyWith(address: event.address);
    } else if (event is BusinessAddressProfile) {
      yield (state as ProfileLoaded).copyWith(businessaddress: event.businessaddress);
    } else if (event is BusinessNameProfile) {
      yield (state as ProfileLoaded).copyWith(businessname: event.businessname);
    } else if (event is RCProfile) {
      yield (state as ProfileLoaded).copyWith(rc: event.rc);
    } else if (event is StateProfile) {
      yield (state as ProfileLoaded).copyWith(state: event.state);
    } else if (event is EmailProfile) {
      yield (state as ProfileLoaded).copyWith(email: event.email);
    } else if (event is DoBProfile) {
      yield (state as ProfileLoaded).copyWith(dob: event.dob);
    } else if (event is SubmitProfile) {
      yield ProfileLoading();
      final profile = _previousState.whereType<ProfileLoaded>().last;
      // final formatter = DateFormat('dd-MM-yyyy');
      // formatted = formatter.format(date);
      try {
        final profileresponse = UniversalPlatform.isWeb
            ? await repository.modifyMerchantProfile(
                data: Data(
                  tag: profile.tag.isEmpty ? profile.signUp.data.tag : profile.tag,
                  email: profile.email.isEmpty ? profile.signUp.data.email : profile.email,
                  address: profile.address.isEmpty ? profile.signUp.data.state ?? AppStrings.empty : profile.address,
                  rc: profile.rc.isEmpty ? profile.signUp.data.rc ?? AppStrings.empty : profile.rc,
                  businessAddress: profile.businessaddress.isEmpty
                      ? profile.signUp.data.businessAddress ?? AppStrings.empty
                      : profile.businessaddress,
                  businessName: profile.businessname.isEmpty
                      ? profile.signUp.data.businessName ?? AppStrings.empty
                      : profile.businessname,
                  state: profile.state,
                ),
              )
            : await repository.modifyProfile(
                data: Data(
                  tag: profile.tag.isEmpty ? profile.signUp.data.tag : profile.tag,
                  email: profile.email.isEmpty ? profile.signUp.data.email : profile.email,
                  address: profile.address.isEmpty ? profile.signUp.data.state ?? AppStrings.empty : profile.address,
                  state: profile.state,
                ),
              );
        if (profileresponse.status == 200) {
          final response = await repository.retrieveProfile();
          await repository.addPersonalData(personalData: response.data);
          yield profile.copyWith(success: profileresponse.status, responsemessage: profileresponse.message);
        } else {
          yield profile.copyWith(error: profileresponse.status, responsemessage: profileresponse.message);
        }
      } catch (e) {
        yield profile.copyWith(
            responsemessage: BasicResponse(
              message: AppDioErrorHandling().handleError(e),
              status: 400,
            ).message,
            error: 400);
      }
    } else if (event is SubmitBvnProfile) {
      yield ProfileLoading();
      final profile = _previousState.whereType<ProfileLoaded>().last;
      try {
        final response = await repository.validateBVN(bvn: profile.bvn);
        if (response.status == 200) {
          yield profile.copyWith(success: response.status, responsemessage: response.message);
        } else {
          yield profile.copyWith(error: response.status, responsemessage: response.message);
        }
      } catch (e) {
        yield profile.copyWith(
            responsemessage: BasicResponse(
              message: AppDioErrorHandling().handleError(e),
              status: 400,
            ).message,
            error: 400);
      }
    } else if (event is SubmitValidIdProfile) {
      yield ProfileLoading();
      final profile = _previousState.whereType<ProfileLoaded>().last;
      try {
        final response = await repository.modifyDocs(file: profile.validid);
        // //_logger.i(response.data + response.message + '${response.status}');
        if (response.status == 200) {
          yield profile.copyWith(success: 200, responsemessage: response.message);
        } else {
          yield profile.copyWith(error: response.status, responsemessage: response.message);
        }
      } catch (e) {
        yield profile.copyWith(
            responsemessage: BasicResponse(
              message: AppDioErrorHandling().handleError(e),
              status: 400,
            ).message,
            error: 400);
      }
    } else if (event is DeleteEveryResponse) {
      await InMemoryTokenHiveStorage().delete();
      await repository.deleteAzapayUser();
      await repository.deleteSwitchAzapayUser();
      await repository.deleteTransactionPin();
      await repository.deletenavigation();
      await repository.deleterecentContacts();
      await repository.deletecacheFilename();
      await repository.deletePersonalData();
      await walletBloc.clear();
      await walletBloc.add(ResetWalletPage());
      await notificationBloc.add(ClearNotificationResponse());
      if (state is ProfileLoaded) {
        yield ProfileLoaded();
        yield ProfileInitial();
      }
      UniversalPlatform.isWeb
          ? await navigatorState.currentState.pushNamedAndRemoveUntil(AppRouteName.signinWeb, (routes) => false)
          : await navigatorState.currentState.pushNamedAndRemoveUntil(AppRouteName.signin, (routes) => false);
    } else if (event is ClearProfileResponse) {
      if (state is ProfileLoaded) {
        yield (state as ProfileLoaded).copyWith(success: 100, error: 100);
      }
    } else if (event is HelpandSupport) {
      if (repository.retrieveFreshchatRestoreId() == null) {
        // await FlutterFreshchat.init(
        //     appID: AppEnv.appID, appKey: AppEnv.appKEY, domain: 'https://msdk.freshchat.com', cameraEnabled: false);
        // final azapayuser = await repository.retrieveAzapayUser();
        // //_logger.i(azapayuser.tag);
        // final user = await FreshchatUser.initial();
        // user.id = azapayuser.tag;
        // user.email = '${azapayuser.tag}@azapay.com.ng';
        // user.firstName = azapayuser.tag;
        // user.lastName = azapayuser.tag;
        // user.phoneCountryCode = '+234';
        // user.phone = '';

        // await FlutterFreshchat.updateUserInfo(user: user);
        // final newRestoreId = await FlutterFreshchat.identifyUser(externalID: user.id, restoreID: azapayuser.tag);
        // await repository.addfreshcharestoreId(restoreID: newRestoreId);
        // yield (state as ProfileLoaded)
        //     .copyWith(helpandsupportRestoreId: repository.retrieveFreshchatRestoreId().restoreId);
      } else {
        // await FlutterFreshchat.init(
        //     appID: AppEnv.appID, appKey: AppEnv.appKEY, domain: 'https://msdk.freshchat.com', cameraEnabled: false);
        // yield (state as ProfileLoaded)
        //     .copyWith(helpandsupportRestoreId: repository.retrieveFreshchatRestoreId().restoreId);
      }
    } else if (event is ValidCACIdMerchantProfile) {
      final file = await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: ['jpg']);

      //_logger.i(file.toString());
      if (file != null) {
        yield (state as ProfileLoaded).copyWith(cac: File(file.files.single.path));
      }
    }
  }
}
