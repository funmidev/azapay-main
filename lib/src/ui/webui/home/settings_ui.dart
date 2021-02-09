import 'package:azapay/app/app.dart';
import 'package:azapay/src/blocs/blocs.dart';
import 'package:azapay/src/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsUIWeb extends StatefulWidget {
  @override
  _SettingsUIWebState createState() => _SettingsUIWebState();
}

class _SettingsUIWebState extends State<SettingsUIWeb> {
  ProfileBloc _profileBloc;

  @override
  void initState() {
    super.initState();
    _profileBloc = context.bloc<ProfileBloc>();
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
        padding: EdgeInsets.only(left: 50, right: MediaQuery.of(context).size.width / 9, top: 40),
        child: ListView(
          children: [
            ProfileHeaderWebUI(),
            // Padding(
            //   padding: const EdgeInsets.only(top: 15.0),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Padding(
            //         padding: const EdgeInsets.only(left: 8.0),
            //         child: Text(AppStrings.settingsWebPassword, style: AppTextStyles.h2style),
            //       ),
            //       Row(
            //         // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           SizedBox(
            //             width: MediaQuery.of(context).size.width / 5,
            //             child: FormFieldUI(
            //               borderradius: 10,
            //               contentpad: 13,
            //               currentnode: null,
            //               fieldController: null,
            //               // nextnode: _emailnode,
            //               hint: AppStrings.settingsWebchangePassword,
            //               textInputAction: TextInputAction.done,
            //               textInputType: TextInputType.text,
            //               // maxLength: 100,
            //               errorText: null,
            //               onchanged: (search) {},
            //             ),
            //           ),
            //           SizedBox(
            //             width: 60,
            //           ),
            //           SizedBox(
            //             width: MediaQuery.of(context).size.width / 5,
            //             child: FormFieldUI(
            //               borderradius: 10,
            //               contentpad: 13,
            //               currentnode: null,
            //               fieldController: null,
            //               // nextnode: _emailnode,
            //               hint: AppStrings.settingsWebchangeTransactionPin,
            //               textInputAction: TextInputAction.done,
            //               textInputType: TextInputType.text,
            //               // maxLength: 100,
            //               errorText: null,
            //               onchanged: (search) {},
            //             ),
            //           ),
            //           //todo: password
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: MediaQuery.of(context).size.width / 9),
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
                                        ),
                                      ),
                                    ),
                                    Text(AppStrings.settingsWebchangeUpload),
                                    SizedBox(
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
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorSets.colorPin,
                      border: Border.all(
                        color: Color(0XFFFFB300),
                        width: 1,
                      ),
                    ),
                  ),
                  //todo: upload id
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
