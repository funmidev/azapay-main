import 'dart:async';

import 'package:azapay/app/app.dart';
import 'package:azapay/src/blocs/blocs.dart';
import 'package:azapay/src/models/models.dart';
import 'package:azapay/src/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileWebUI extends StatefulWidget {
  @override
  _ProfileWebUIState createState() => _ProfileWebUIState();
}

class _ProfileWebUIState extends State<ProfileWebUI> {
  ProfileBloc _profileBloc;
  TextEditingController _azapaytagController;
  TextEditingController _emailController;
  // TextEditingController _lastnameController;
  // TextEditingController _firstnameController;
  TextEditingController _rcController;
  TextEditingController _businessaddressController;
  TextEditingController _businessnameController;
  TextEditingController _stateController;
  TextEditingController _bvnController;
  StreamSubscription _profilesub;

  @override
  void initState() {
    super.initState();
    _profileBloc = context.bloc<ProfileBloc>();
    _profileBloc.add(UpdateProfile());
    _profilesub = _profileBloc.listen((state) {
      if (state is ProfileLoaded) {
        _rcController = TextEditingController(text: state.signUp.data.rc);
        _emailController = TextEditingController(text: state.signUp.data.email);
        _stateController = TextEditingController(text: state.signUp.data.state);
        _businessaddressController = TextEditingController(text: state.signUp.data.businessAddress);
        _businessnameController = TextEditingController(text: state.signUp.data.businessName);
        _azapaytagController = TextEditingController(text: state.signUp.data.tag);
        _bvnController = TextEditingController(text: state.signUp.data.bvn ? AppStrings.empty : AppStrings.empty);
        _profilesub.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (context, state) async {
        if (state is ProfileLoaded) {
          if (state.success == 200) {
            await showGeneralDialog(
                context: context,
                pageBuilder: (context, _, __) {
                  return CustomDialogUI(
                      loading: false,
                      icontitle: false,
                      titleheader: AppVectors.greenMark,
                      subtitle: state.responsemessage,
                      twobutton: false,
                      discardtitle: AppStrings.empty,
                      discardtitleColor: Colors.transparent,
                      discardColor: Colors.transparent,
                      acceptedbutton: null,
                      acceptedtitle: AppStrings.empty,
                      acceptedtitleColor: Colors.transparent,
                      acceptedColor: Colors.transparent,
                      centerbutton: null,
                      centertitle: AppStrings.empty,
                      centerColor: null,
                      centertitleColor: null);
                },
                barrierDismissible: true,
                barrierLabel: '',
                useRootNavigator: true,
                barrierColor: Colors.black.withOpacity(0.8),
                transitionDuration: Duration(milliseconds: 300),
                transitionBuilder: (context, animation, __, child) {
                  return SlideTransition(
                    position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(animation),
                    child: child,
                  );
                });
            // await Navigator.push(
            //   context,
            //   PageRouteBuilder(
            //     pageBuilder: (context, animation, secondaryAnimation) {
            //       return TransactionResponseUI(
            //         icon: Icons.done,
            //         color: ColorSets.colorPrimaryLightGreen,
            //         iconcolor: ColorSets.colorPrimaryWhite,
            //         responsetitle: AppStrings.successTransactPinTitle,
            //         responsemessage: state.responsemessage,
            //       );
            //     },
            //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
            //       var begin = Offset(0.0, 1.0);
            //       var end = Offset.zero;
            //       Curve curve = Curves.ease;
            //       var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            //       return SlideTransition(position: animation.drive(tween), child: child);
            //     },
            //   ),
            // );
            await _profileBloc.add(ClearProfileResponse());
          } else if (state.error >= 203) {
            await showGeneralDialog(
                context: context,
                pageBuilder: (context, _, __) {
                  return CustomDialogUI(
                      loading: false,
                      icontitle: false,
                      titleheader: AppVectors.redMark,
                      subtitle: state.responsemessage,
                      twobutton: false,
                      discardtitle: AppStrings.empty,
                      discardtitleColor: Colors.transparent,
                      discardColor: Colors.transparent,
                      acceptedbutton: null,
                      acceptedtitle: AppStrings.empty,
                      acceptedtitleColor: Colors.transparent,
                      acceptedColor: Colors.transparent,
                      centerbutton: null,
                      centertitle: AppStrings.empty,
                      centerColor: null,
                      centertitleColor: null);
                },
                barrierDismissible: true,
                barrierLabel: '',
                useRootNavigator: true,
                barrierColor: Colors.black.withOpacity(0.8),
                transitionDuration: Duration(milliseconds: 300),
                transitionBuilder: (context, animation, __, child) {
                  return SlideTransition(
                    position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(animation),
                    child: child,
                  );
                });
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
          } else if (state is ProfileLoading) {
            await showGeneralDialog(
                context: context,
                pageBuilder: (context, _, __) {
                  return CustomDialogUI(
                      loading: true,
                      icontitle: false,
                      titleheader: null,
                      subtitle: AppStrings.empty,
                      twobutton: false,
                      discardtitle: AppStrings.empty,
                      discardtitleColor: Colors.transparent,
                      discardColor: Colors.transparent,
                      acceptedbutton: null,
                      acceptedtitle: AppStrings.empty,
                      acceptedtitleColor: Colors.transparent,
                      acceptedColor: Colors.transparent,
                      centerbutton: null,
                      centertitle: AppStrings.empty,
                      centerColor: null,
                      centertitleColor: null);
                },
                barrierDismissible: true,
                barrierLabel: '',
                useRootNavigator: true,
                barrierColor: Colors.black.withOpacity(0.8),
                transitionDuration: Duration(milliseconds: 300),
                transitionBuilder: (context, animation, __, child) {
                  return SlideTransition(
                    position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(animation),
                    child: child,
                  );
                });
          }
        }
      },
      builder: (context, state) => Padding(
        padding: EdgeInsets.only(left: 10, right: MediaQuery.of(context).size.width / 10, top: 40),
        child: ListView(
          children: [
            Column(
              children: [
                ProfileHeaderWebUI(),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 50),
                              child: AccountFormUI(
                                title: AppStrings.profilewebTAG,
                                borderradius: 10,
                                contentpad: 13,
                                controller: _azapaytagController,
                                node: null,
                                readOnly: false,
                                hint: AppStrings.empty,
                                action: TextInputAction.next,
                                type: TextInputType.text,
                                prefixicon: null,
                                error: null,
                                onChanged: (tag) {
                                  _profileBloc.add(AzaTagProfile(tag: tag));
                                },
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 50),
                              child: AccountFormUI(
                                title: AppStrings.profilewebEmail,
                                borderradius: 10,
                                contentpad: 13,
                                controller: _emailController,
                                node: null,
                                readOnly: false,
                                hint: AppStrings.empty,
                                action: TextInputAction.next,
                                type: TextInputType.text,
                                prefixicon: null,
                                error: null,
                                onChanged: (email) {
                                  _profileBloc.add(EmailProfile(email: email));
                                },
                              ),
                            ),
                            // AccountFormUI(
                            //     title: AppStrings.profilewebBVN,
                            //     borderradius: 10,
                            //     contentpad: 13,
                            //     controller: null,
                            //     node: null,
                            //     hint: AppStrings.empty,
                            //     action: TextInputAction.next,
                            //     type: TextInputType.text,
                            //     prefixicon: null,
                            //     error: null,
                            //     onChanged: (bv) {},
                            //     passwordvisible: false),
                            Container(
                              margin: EdgeInsets.only(right: 50),
                              child: AccountFormUI(
                                title: AppStrings.profilewebBussinessName,
                                borderradius: 10,
                                contentpad: 13,
                                controller: _businessnameController,
                                node: null,
                                readOnly: false,
                                hint: AppStrings.empty,
                                action: TextInputAction.next,
                                type: TextInputType.text,
                                prefixicon: null,
                                error: null,
                                onChanged: (businessname) {
                                  _profileBloc.add(BusinessNameProfile(businessname: businessname));
                                },
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 50),
                              child: AccountFormUI(
                                title: AppStrings.profilewebBusinessAddresss,
                                borderradius: 10,
                                contentpad: 13,
                                controller: _businessaddressController,
                                node: null,
                                readOnly: false,
                                hint: AppStrings.empty,
                                action: TextInputAction.next,
                                type: TextInputType.text,
                                prefixicon: null,
                                error: null,
                                onChanged: (businessaddress) {
                                  _profileBloc.add(BusinessAddressProfile(businessaddress: businessaddress));
                                },
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 50),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                                  child: SizedBox(
                                    // height: MediaQuery.of(context).size.height / 14,
                                    child: ButtonArrow(
                                        navigatorfunc: () {
                                          _profileBloc.add(SubmitProfile());
                                        },
                                        buttontitle: AppStrings.proceed,
                                        arrow: false,
                                        buttontitleColor: ColorSets.colorPrimaryWhite),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 50),
                              child: AccountFormUI(
                                title: AppStrings.profilewebRC,
                                borderradius: 10,
                                contentpad: 13,
                                controller: _rcController,
                                node: null,
                                readOnly: false,
                                hint: AppStrings.empty,
                                action: TextInputAction.next,
                                type: TextInputType.text,
                                prefixicon: null,
                                error: null,
                                onChanged: (rc) {
                                  _profileBloc.add(RCProfile(rc: rc));
                                },
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(AppStrings.profilewebState, style: AppTextStyles.h3style),
                                Padding(
                                  padding: const EdgeInsets.only(top: 15.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: ColorSets.colorPin, borderRadius: BorderRadius.circular(10)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 60,
                                      ),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton<String>(
                                            icon: Icon(Icons.arrow_drop_down),
                                            hint: Text('State'),
                                            value: state is ProfileLoaded
                                                ? state.state.isEmpty ? state.signUp.data?.state.isEmpty ? 'Abia' : state.signUp.data?.state : state.state
                                                : AppStrings.empty,
                                            items: state is ProfileLoaded
                                                ? state.stateList
                                                    .map<DropdownMenuItem<String>>(
                                                        (state) => DropdownMenuItem(child: Text(state), value: state,),).toList()
                                                : [],
                                            onChanged: (state) {
                                              _profileBloc.add(StateProfile(state: state));
                                            },),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Container(
                                // margin: EdgeInsets.only(right: MediaQuery.of(context).size.width / 9),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: ColorSets.colorPin,
                                  border: Border.all(
                                    color: Color(0XFFFFB300),
                                    width: 1,
                                  ),
                                ),
                                child: Center(
                                  child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: CircleAvatar(
                                                      backgroundColor: ColorSets.colorGrey,
                                                      child: Icon(
                                                        Icons.move_to_inbox,
                                                        color: ColorSets.colorPin,
                                                        size: 25,
                                                      )),
                                                ),
                                                Text(AppStrings.settingsWebchangeUpload),
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: SizedBox(
                                                    width: MediaQuery.of(context).size.width / 3,
                                                    child: BorderButtonUI(
                                                      backgroundColor: ColorSets.colorPrimaryWhite,
                                                      onPressed: () {
                                                        _profileBloc.add(ValidIdProfile());
                                                      },
                                                      fontSize: 13,
                                                      fontWeight: FontWeight.w500,
                                                      title: AppStrings.uploadItem,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: SizedBox(
                                                    width: MediaQuery.of(context).size.width / 3,
                                                    child: BorderButtonUI(
                                                      backgroundColor: ColorSets.colorPrimaryWhite,
                                                      onPressed: () {
                                                        _profileBloc.add(ValidCACIdMerchantProfile());
                                                      },
                                                      fontSize: 13,
                                                      fontWeight: FontWeight.w500,
                                                      title: AppStrings.uploadCACItem,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Image.asset(
                                              AppImages.webwebupload,
                                              scale: 1.2,
                                            ),
                                          ),
                                        ],
                                      )),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
