import 'dart:async';

import 'package:azapay/app/app.dart';
import 'package:azapay/src/blocs/profile/profile_bloc.dart';
import 'package:azapay/src/models/models.dart';
import 'package:azapay/src/widget/widget.dart';
import 'package:azapay/utils/utils.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:universal_platform/universal_platform.dart';

class UserAccountInfoUI extends StatefulWidget {
  final int requireddetails;

  const UserAccountInfoUI({Key key, this.requireddetails}) : super(key: key);

  @override
  _UserAccountInfoUIState createState() => _UserAccountInfoUIState();
}

class _UserAccountInfoUIState extends State<UserAccountInfoUI> {
  TextEditingController _azapaytagController;
  TextEditingController _emailController;
  TextEditingController _lastnameController;
  TextEditingController _firstnameController;
  TextEditingController _phonenoController;
  TextEditingController _azaacctnumberController;
  TextEditingController _azaaccttypeController;
  TextEditingController _genderController;
  TextEditingController _stateController;
  TextEditingController _dobController;
  TextEditingController _addressController;
  TextEditingController _bvnController;
  StreamSubscription _profilesub;
  // final List<bool> gender = [false, false];
  // List<bool> _isSelected;
  ProfileBloc _profileBloc;
  //todo: the BVN in the list should be on tenary operator based on the tier and response details from the api endpoint

  @override
  void initState() {
    super.initState();
    _profileBloc = context.bloc<ProfileBloc>();
    _profileBloc.add(UpdateProfile());
    _profilesub = _profileBloc.listen((state) {
      if (state is ProfileLoaded) {
        _emailController = TextEditingController(text: state.signUp.data.email);
        _lastnameController = TextEditingController(text: state.signUp.data.lastName);
        _firstnameController = TextEditingController(text: state.signUp.data.firstName);
        _phonenoController = TextEditingController(text: state.signUp.data.phone);
        // _azaaccttypeController = TextEditingController(text: state.signUp.data.tag);
        _genderController = TextEditingController(text: state.signUp.data.gender);
        _stateController = TextEditingController(text: state.signUp.data.state);
        _dobController = TextEditingController(text: state.signUp.data.dateOfBirth);
        _addressController = TextEditingController(text: state.signUp.data.address);
        _azapaytagController = TextEditingController(text: state.signUp.data.tag);
        _bvnController = TextEditingController(text: state.signUp.data.bvn ? AppStrings.empty : AppStrings.empty);
        _profilesub.cancel();
      }
    });
    // _isSelected = <bool>[false, false];
  }

  @override
  void dispose() {
    super.dispose();
    _profileBloc.add(ClearProfileResponse());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (context, state) async {
        if (state is ProfileLoaded) {
          if (state.success == 200) {
            await Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) {
                  return TransactionResponseUI(
                    icon: Icons.done,
                    color: ColorSets.colorPrimaryLightGreen,
                    iconcolor: ColorSets.colorPrimaryWhite,
                    responsetitle: AppStrings.successTransactPinTitle,
                    responsemessage: state.responsemessage,
                  );
                },
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  var begin = Offset(0.0, 1.0);
                  var end = Offset.zero;
                  Curve curve = Curves.ease;
                  var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

                  return SlideTransition(position: animation.drive(tween), child: child);
                },
              ),
            );
            await _profileBloc.add(ClearProfileResponse());
          } else if (state.error >= 203) {
            await Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) {
                  return TransactionResponseUI(
                    icon: Icons.clear,
                    color: ColorSets.colorPrimaryRed,
                    iconcolor: ColorSets.colorPrimaryWhite,
                    responsetitle: AppStrings.failedTransactPinTitle,
                    responsemessage: state.responsemessage,
                  );
                },
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  var begin = Offset(0.0, 1.0);
                  var end = Offset.zero;
                  Curve curve = Curves.ease;
                  var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

                  return SlideTransition(position: animation.drive(tween), child: child);
                },
              ),
            );
            await _profileBloc.add(ClearProfileResponse());
          }
        }
      },
      // buildWhen: (previous, current) {
      //   if (previous is ProfileLoading && current is ProfileLoaded) {
      //     return true;
      //   } else {
      //     return false;
      //   }
      // },
      builder: (context, state) {
        if (state is ProfileLoaded) {
          return Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                AppStrings.accountinfoTitle,
                style: AppTextStyles.h3style.copyWith(fontWeight: FontWeight.w600, fontSize: 20),
              ),
              elevation: 0.0,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: AccountFormUI(
                            title: AppStrings.accountinfoTitleBVN,
                            node: null,
                            bvnverified: true,
                            controller: _bvnController,
                            hint: AppStrings.accountinfoTitleBVN,
                            action: TextInputAction.done,
                            type: TextInputType.number,
                            error: null,
                            onChanged: null),
                      ),
                      widget.requireddetails == 2
                          ? InkWell(
                              onTap: () async {
                                _profileBloc.add(ValidIdProfile());
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: state.validid?.path == null
                                              ? Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: CircleAvatar(
                                                          backgroundColor: ColorSets.colorPrimaryWhite,
                                                          child: Icon(Icons.move_to_inbox)),
                                                    ),
                                                    Text(AppStrings.uploadclickHere),
                                                    Text(AppStrings.uploadItem),
                                                  ],
                                                )
                                              : Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    FadeInImage(
                                                      placeholder: AssetImage(AppImages.avatar),
                                                      image:
                                                          CustomImageProvider(image: state.validid.readAsBytesSync()),
                                                      width: 60,
                                                      height: 60,
                                                    )
                                                    // Image.memory(
                                                    //   state.validid.readAsBytesSync(),
                                                    //   width: 40,
                                                    //   height: 40,
                                                    // )
                                                  ],
                                                ),
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: ColorSets.colorPin,
                                        border: Border.all(
                                          color: Color(0XFFFFB300),
                                          width: 1,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0, left: 100, right: 100, bottom: 20),
                                    child: ButtonArrow(
                                        navigatorfunc: state.validid != null
                                            ? () {
                                                _profileBloc.add(SubmitValidIdProfile());
                                              }
                                            : null,
                                        buttontitle: AppStrings.doneBtn,
                                        arrow: false,
                                        buttontitleColor: ColorSets.colorPrimaryBlack),
                                  )
                                ],
                              ),
                            )
                          : EmptyWidgetUI(),
                      AccountFormUI(
                          title: AppStrings.accountinfoAzaTag,
                          node: null,
                          controller: _azapaytagController,
                          hint: AppStrings.accountinfoAzaTag,
                          action: TextInputAction.done,
                          type: TextInputType.text,
                          readOnly: false,
                          error: null,
                          onChanged: (tag) => _profileBloc.add(AzaTagProfile(tag: tag))),

                      AccountFormUI(
                          title: AppStrings.accountinfoEmail,
                          node: null,
                          controller: _emailController,
                          hint: AppStrings.accountinfoEmail,
                          action: TextInputAction.done,
                          type: TextInputType.text,
                          readOnly: false,
                          error: null,
                          onChanged: (email) => _profileBloc.add(EmailProfile(email: email))),
                      AccountFormUI(
                          title: AppStrings.accountinfoFirstName,
                          node: null,
                          controller: _firstnameController,
                          hint: null,
                          action: null,
                          type: null,
                          error: null,
                          onChanged: null),
                      AccountFormUI(
                          title: AppStrings.accountinfoLastName,
                          node: null,
                          controller: _lastnameController,
                          hint: null,
                          action: null,
                          type: null,
                          error: null,
                          onChanged: null),
                      AccountFormUI(
                          title: AppStrings.accountinfoPhoneNumber,
                          node: null,
                          controller: _phonenoController,
                          hint: null,
                          action: null,
                          type: null,
                          error: null,
                          onChanged: null),
                      // AccountFormUI(
                      //     title: AppStrings.accountinfoAzaAccountAccount,
                      //     node: null,
                      //     controller: _azaaccttypeController,
                      //     hint: null,
                      //     action: null,
                      //     type: null,
                      //     error: null,
                      //     onChanged: null),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(AppStrings.accountinfoGender, style: AppTextStyles.h3style),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                FlatButton(
                                  disabledColor: ColorSets.colorPrimaryWhite,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    side: BorderSide(
                                      width: 3,
                                      color:
                                          state.gender == AppStrings.male || state.signUp.data.gender == AppStrings.male
                                              ? ColorSets.colorPrimaryLightYellow
                                              : ColorSets.colorPrimaryBlack.withOpacity(0.3),
                                    ),
                                  ),
                                  onPressed: null,
                                  // () {
                                  //   _profileBloc.add(GenderProfile(gender: AppStrings.male));
                                  // },
                                  child: Row(
                                    children: [SvgPicture.asset(AppVectors.male), Text(AppStrings.male)],
                                  ),
                                ),
                                FlatButton(
                                  disabledColor: ColorSets.colorPrimaryWhite,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    side: BorderSide(
                                      width: 3,
                                      color: state.gender == AppStrings.female ||
                                              state.signUp.data.gender == AppStrings.female
                                          ? ColorSets.colorPrimaryLightYellow
                                          : ColorSets.colorPrimaryBlack.withOpacity(0.3),
                                    ),
                                  ),
                                  onPressed: null,
                                  //  () {
                                  //   _profileBloc.add(GenderProfile(gender: AppStrings.female));
                                  // },
                                  child: Row(
                                    children: [SvgPicture.asset(AppVectors.female), Text(AppStrings.female)],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // UniversalPlatform.isIOS
                          // ? Column(
                          //     crossAxisAlignment: CrossAxisAlignment.start,
                          //     children: [
                          //       Padding(
                          //         padding: const EdgeInsets.only(left: 10.0),
                          //         child: Text(
                          //           AppStrings.accountinfoDateofBirth,
                          //           style: AppTextStyles.h3style,
                          //         ),
                          //       ),
                          //       CupertinoDatePicker(
                          //         onDateTimeChanged: (datetime) {
                          //           print(datetime.day);
                          //           _profileBloc.add(DoBProfile(dob: datetime));
                          //         },
                          //         initialDateTime: DateTime.now(),
                          //       ),
                          //     ],
                          //   )
                          // :
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    AppStrings.accountinfoDateofBirth,
                                    style: AppTextStyles.h3style,
                                  ),
                                ),
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                                    child: Text(state.signUp.data?.dateOfBirth ?? '0/0/0'),
                                  ),
                                  decoration:
                                      BoxDecoration(borderRadius: BorderRadius.circular(30), color: ColorSets.colorPin),
                                ),
                                // FlatButton(
                                //   color: ColorSets.colorGrey.withOpacity(0.3),
                                //   shape: RoundedRectangleBorder(
                                //     borderRadius: BorderRadius.circular(30),
                                //   ),
                                //   onPressed: () async {
                                //     final selectedDate = DateTime.now();
                                //     final dataTime = await showDatePicker(
                                //         context: context,
                                //         initialDate: selectedDate,
                                //         firstDate: DateTime.now(),
                                //         lastDate: DateTime.now());
                                //     if (dataTime != null && dataTime != selectedDate) {
                                //       print(selectedDate.day);
                                //       _profileBloc.add(DoBProfile(dob: selectedDate));
                                //     }
                                //   },
                                //   child: Padding(
                                //     padding: const EdgeInsets.symmetric(horizontal: 30.0),
                                //     child: Text(
                                //         state.signUp.data?.dob ??
                                //             '${state?.dob?.day}/${state?.dob?.month}/${state?.dob?.year}',
                                //         style: AppTextStyles.h3style),
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                           UniversalPlatform.isAndroid
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 15.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: ColorSets.colorPin, borderRadius: BorderRadius.circular(30)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 30),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton<String>(
                                            icon: Icon(Icons.arrow_drop_down),
                                            hint: Text('State'),
                                            value: state.state.isEmpty ? state.signUp.data?.state.isEmpty ? 'Abia' : state.signUp.data?.state : state.state,
                                            items: state.stateList
                                                .map<DropdownMenuItem<String>>(
                                                    (state) => DropdownMenuItem(child: Text(state), value: state))
                                                .toList(),
                                            onChanged: (state) {
                                              _profileBloc.add(StateProfile(state: state));
                                            }),
                                      ),
                                    ),
                                  ),
                                )
                              : Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: ColorSets.colorPin, borderRadius: BorderRadius.circular(30)),
                                    child: CupertinoPicker(
                                      backgroundColor: ColorSets.colorPin,
                                      itemExtent: 40,
                                      onSelectedItemChanged: (position) {
                                        _profileBloc.add(StateProfile(state: state.stateList.elementAt(position)));
                                      },
                                      children: state.stateList.map<Text>((state) => Text(state)).toList(),
                                    ),
                                  ),
                                ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: AccountFormUI(
                            title: AppStrings.accountinfoTitleAddress,
                            node: null,
                            controller: _addressController,
                            hint: null,
                            readOnly: false,
                            action: TextInputAction.done,
                            type: TextInputType.text,
                            error: null,
                            onChanged: (address) {
                              _profileBloc.add(AddressProfile(address: address));
                            }),
                      ),
                      widget.requireddetails <= 2
                          ? EmptyWidgetUI()
                          : Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
                              child: ButtonArrow(
                                  navigatorfunc: () {
                                    _profileBloc.add(SubmitProfile());
                                  },
                                  buttontitle: AppStrings.completeprofile,
                                  arrow: false,
                                  buttontitleColor: ColorSets.colorPrimaryBlack),
                            )
                    ],
                  ),
                ],
              ),
            ),
          );
        } else {
          return LoadingUI(function: (_) {}, showtext: true);
        }
      },
    );
  }
}
