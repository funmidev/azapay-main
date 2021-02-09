import 'dart:io';

import 'package:azapay/app/app.dart';
import 'package:azapay/src/blocs/blocs.dart';
import 'package:azapay/src/models/models.dart';
import 'package:azapay/src/widget/widget.dart';
import 'package:azapay/utils/utils.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserProfileUI extends StatefulWidget {
  @override
  _UserProfileUIState createState() => _UserProfileUIState();
}

class _UserProfileUIState extends State<UserProfileUI> {
  ProfileBloc _profileBloc;

  @override
  void initState() {
    super.initState();
    _profileBloc = context.bloc<ProfileBloc>();
    // _profileBloc.add(FetchProfile());
  }

  @override
  void dispose() {
    super.dispose();
    _profileBloc.add(ClearProfileResponse());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        actions: [
          IconButton(
            icon: Icon(DashBoard.qrcode),
            onPressed: () {
              Navigator.pushNamed(context, AppRouteName.qrcode, arguments: QrScan(amount: '', whichscreen: 1));
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () async {
                        _profileBloc.add(ProfileImage());
                      },
                      child: Stack(
                        //todo: tenrary ops to change to circle avatar if image available
                        children: <Widget>[
                          BlocBuilder<ProfileBloc, ProfileState>(
                            builder: (context, state) {
                              if (state is ProfileLoaded) {
                                if (state.profilepic == null) {
                                  return ClipRRect(
                                    borderRadius: BorderRadius.circular(30.0),
                                    child: FadeInImage(
                                      placeholder: AssetImage(AppImages.avatar),
                                      image: CustomImageProvider(image: state?.profilepic),
                                      width: 60,
                                      height: 60,
                                    ),
                                  );
                                  // return Icon(Icons.account_circle, size: 60, color: Colors.grey[500]);
                                } else {
                                  return ClipRRect(
                                    borderRadius: BorderRadius.circular(30.0),
                                    child: FadeInImage(
                                      placeholder: AssetImage(AppImages.avatar),
                                      image: CustomImageProvider(image: state?.profilepic),
                                      width: 60,
                                      height: 60,
                                    ),
                                  );
                                }
                              } else {
                                return Icon(Icons.account_circle, size: 60, color: Colors.grey[500]);
                              }
                            },
                          ),
                          // (_profileBloc.state is ProfileLoaded)
                          //     ? (_profileBloc.state as ProfileLoaded).profilepic == null
                          //         ? Icon(Icons.account_circle, size: 60, color: Colors.grey[500])
                          //         : ClipRRect(
                          //             borderRadius: BorderRadius.circular(8.0),
                          //             child: Image.memory(
                          //               (_profileBloc.state as ProfileLoaded).profilepic.readAsBytesSync(),
                          //               width: 60,
                          //               height: 60,
                          //             ),
                          //           )
                          //     : Icon(Icons.account_circle, size: 60, color: Colors.grey[500]),
                          Positioned(
                            // draw a red marble
                            bottom: 0.0,
                            right: 0.0,
                            child: CircleAvatar(
                              radius: 12,
                              backgroundColor: Colors.yellow[800],
                              child: Icon(
                                Icons.camera_alt,
                                size: 15.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    BlocBuilder<ProfileBloc, ProfileState>(
                      builder: (context, state) {
                        return Text(
                          (state is ProfileLoaded) ? '#${state.signUp.data.tag}' : '---',
                          style: AppTextStyles.h3style.copyWith(fontWeight: FontWeight.w600),
                        );
                      },
                    ),
                    //tier
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, AppRouteName.tierprofile);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: ColorSets.colorPrimaryLightYellow,
                            borderRadius: BorderRadius.circular(
                              40,
                            ),
                          ),
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, AppRouteName.tierprofile);
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 5.0),
                              child: BlocBuilder<ProfileBloc, ProfileState>(
                                builder: (context, state) {
                                  return Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SvgPicture.asset(
                                        tier(
                                            level: (state is ProfileLoaded)
                                                ? state.signUp.data.accountType ?? '---'
                                                : '---'),
                                        color: ColorSets.colorPrimaryWhite,
                                        width: 20,
                                        height: 20,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 5.0),
                                        child: Text(
                                          (state is ProfileLoaded) ? state.signUp.data.accountType ?? '---' : '---',
                                          style: AppTextStyles.h3style,
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Padding(
                    //   padding: const EdgeInsets.symmetric(vertical: 10.0),
                    //   child: Container(
                    //     decoration: BoxDecoration(
                    //       color: ColorSets.colorPin,
                    //       borderRadius: BorderRadius.circular(
                    //         20,
                    //       ),
                    //     ),
                    //     child: Padding(
                    //       padding: const EdgeInsets.all(
                    //         7.0,
                    //       ),
                    //       child: Row(
                    //         mainAxisAlignment: MainAxisAlignment.center,
                    //         children: [
                    //           Text(
                    //             AppStrings.profileOneI,
                    //             style: AppTextStyles.h3style
                    //                 .copyWith(fontSize: 18, color: ColorSets.colorPrimaryLightYellow),
                    //           ),
                    //           Text(
                    //             AppStrings.profileOneII,
                    //             style:
                    //                 AppTextStyles.h3style.copyWith(fontSize: 18, color: ColorSets.colorPrimaryLightGreen),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorSets.colorPin,
                    borderRadius: BorderRadius.circular(
                      20,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(
                      4.0,
                    ),
                    child: Column(
                      children: [
                        BlocBuilder<ProfileBloc, ProfileState>(
                          builder: (context, state) {
                            return InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, AppRouteName.useraccountinfoprofile, arguments: 3);
                              },
                              child: InfoListUI(
                                icon: Icons.account_box,
                                infotitle: AppStrings.profileOneList,
                                notify: state is ProfileLoaded ? state.address != null ? false : true : false,
                              ),
                            );
                          },
                        ),
                        Divider(color: ColorSets.colorGrey),
                        BlocBuilder<NotificationBloc, NotificationState>(
                          builder: (context, state) {
                            return InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, AppRouteName.notificationprofile);
                              },
                              child: InfoListUI(
                                icon: Icons.notifications,
                                infotitle: AppStrings.profileTwoList,
                                notify: state is NotificationLoaded
                                    ? state.refFund?.any((refFund) => refFund.actionperformed == false) ?? false
                                    : false,
                              ),
                            );
                          },
                        ),
                        Divider(color: ColorSets.colorGrey),
                        InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, AppRouteName.documentprofile);
                            },
                            child: InfoListUI(icon: Icons.description, infotitle: AppStrings.profileThreeList)),
                        Divider(color: ColorSets.colorGrey),
                        InkWell(
                            onTap: () {
                              // Navigator.pushNamed(context, AppRouteName.privacysecurityprofile);
                              Navigator.pushNamed(context, AppRouteName.passwordsettings);
                            },
                            child: InfoListUI(icon: Icons.security, infotitle: AppStrings.privacyFourI)),
                        Divider(color: ColorSets.colorGrey),
                        InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, AppRouteName.helpsupportpprofile);
                            },
                            child: InfoListUI(icon: Icons.headset_mic, infotitle: AppStrings.profileFiveList)),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () async {
                  //SignoUT
                  await showGeneralDialog(
                      context: context,
                      pageBuilder: (context, _, __) {
                        return CustomDialogUI(
                            icontitle: false,
                            titleheader: AppStrings.signoutTitle,
                            subtitle: AppStrings.signoutSubTitle,
                            twobutton: true,
                            discardtitle: AppStrings.signoutNobtn,
                            discardtitleColor: ColorSets.colorPrimaryBlack,
                            discardColor: ColorSets.colorPrimaryLightYellowDashBoard,
                            acceptedbutton: () async {
                              //todo: empty db
                              await Navigator.of(context, rootNavigator: true).pop();
                              _profileBloc.add(DeleteEveryResponse());
                            },
                            acceptedtitle: AppStrings.signoutYesbtn,
                            acceptedtitleColor: ColorSets.colorPrimaryBlack,
                            acceptedColor: ColorSets.colorPrimaryWhite,
                            centerbutton: null,
                            centertitle: null,
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
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorSets.colorPin,
                    borderRadius: BorderRadius.circular(
                      20,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(
                      4.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // InkWell(
                        //   onTap: () {
                        //     Navigator.pushNamed(context, AppRouteName.referralprofile);
                        //   },
                        //   child: Padding(
                        //     padding: const EdgeInsets.all(8.0),
                        //     child: Text(
                        //       AppStrings.profileTwoI,
                        //       style:
                        //           AppTextStyles.h3style.copyWith(fontSize: 18, color: ColorSets.colorPrimaryLightYellow),
                        //     ),
                        //   ),
                        // ),
                        // Padding(
                        //   padding: EdgeInsets.symmetric(horizontal: 30.0),
                        //   child: Divider(
                        //     color: Color(0xFFE7E7E7),
                        //   ),
                        // ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            AppStrings.profileTwoII,
                            style:
                                AppTextStyles.h3style.copyWith(fontSize: 18, color: ColorSets.colorPrimaryLightYellow),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: GestureDetector(
                  onTap: () {
                    //pRIVACY POLICY
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorSets.colorPin,
                      borderRadius: BorderRadius.circular(
                        20,
                      ),
                    ),
                    child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.library_books, size: 30),
                            Text(
                              AppStrings.profileThree,
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ],
                        )),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class InfoListUI extends StatelessWidget {
  final IconData icon;
  final String infotitle;
  final bool notify;

  const InfoListUI({Key key, @required this.icon, @required this.infotitle, this.notify = false}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, AppRouteName.useraccountinfoprofile, arguments: 3);
            },
            child: Stack(
              children: [
                Icon(
                  icon,
                  size: 30,
                ),
                Positioned(
                  // draw a red marble
                  top: 0.0,
                  right: 0.0,
                  child: Icon(Icons.brightness_1, size: 8.0, color: notify ? Colors.redAccent : Colors.transparent),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              infotitle,
              style: AppTextStyles.h3style.copyWith(fontSize: 18, fontWeight: FontWeight.normal),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.topRight,
              child: Icon(
                Icons.arrow_forward_ios,
                color: ColorSets.colorGrey,
              ),
            ),
          )
        ],
      ),
    );
  }
}

String tier({String level}) {
  switch (level) {
    case 'TIER1':
      return AppVectors.tierone;
      break;
    case 'TIER2':
      return AppVectors.tiertwo;
      break;
    case 'TIER3':
      return AppVectors.tierthree;
      break;
    default:
      return AppVectors.tierone;
  }
}

// List<Widget> _iteminfolist({BuildContext context, bool notify}) {
//   return <Widget>[];
// }
