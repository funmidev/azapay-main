import 'package:azapay/app/app.dart';
import 'package:azapay/src/blocs/blocs.dart';
import 'package:azapay/src/ui/ui.dart';
import 'package:azapay/src/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompleteProfileUI extends StatefulWidget {
  @override
  _CompleteProfileUIState createState() => _CompleteProfileUIState();
}

class _CompleteProfileUIState extends State<CompleteProfileUI> {
  final Color _blackOpac = Colors.black.withOpacity(0.6);
  ProfileBloc _profileBloc;
  TextEditingController _bvnController;
  bool visibillity;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    visibillity = true;
    _profileBloc = context.bloc<ProfileBloc>();
    _bvnController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Theme(
        data: ThemeData(
          appBarTheme: AppBarTheme(color: Colors.transparent, elevation: 0.0),
          scaffoldBackgroundColor: Colors.transparent,
          // /bottomAppBarColor: Colors.transparent ,
        ),
        child: Scaffold(
            key: _scaffoldKey,
            backgroundColor: _blackOpac,
            resizeToAvoidBottomInset: true,
            appBar: visibillity
                ? AppBar(
                    automaticallyImplyLeading: false,
                    backgroundColor: Colors.transparent,
                    actions: [
                      Row(
                        children: [
                          RawMaterialButton(
                            onPressed: null,
                            child: Icon(
                              Icons.account_circle,
                              size: 20,
                              color: ColorSets.colorPrimaryWhite,
                            ),
                            elevation: 0.0,
                            shape: CircleBorder(
                              side: BorderSide(color: Colors.yellow[800], width: 3),
                            ),
                            fillColor: ColorSets.colorPrimaryLightYellowDashBoard.withOpacity(0.4),
                          ),
                        ],
                      ),
                    ],
                  )
                : AppBar(
                    automaticallyImplyLeading: false,
                    backgroundColor: Colors.transparent,
                  ),
            body: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      visibillity = false;
                    });
                    showModalBottomSheet(
                      enableDrag: true,
                      isDismissible: false,
                      isScrollControlled: true,
                      useRootNavigator: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      ),
                      context: context,
                      builder: (_) {
                        return BlocConsumer<ProfileBloc, ProfileState>(
                          listener: (context, state) async {
                            if (state is ProfileLoaded) {
                              if (state.success == 200) {
                                await _profileBloc.add(UpdateProfile());
                                await Navigator.of(context, rootNavigator: true).pop();
                                await Navigator.of(context, rootNavigator: true).pop();
                                await Navigator.of(context).pop();
                                _bvnController.clear();
                                await _profileBloc.add(ClearProfileResponse());
                              } else if (state.error >= 203) {
                                // await Navigator.of(context, rootNavigator: true).pop();
                                await Navigator.of(context, rootNavigator: true).pop();
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
                                      fullscreenDialog: true),
                                );
                                // _bvnController.clear();
                                await _profileBloc.add(ClearProfileResponse());
                              }
                            } else if (state is ProfileLoading) {
                              await showDialog(
                                useSafeArea: false,
                                context: context,
                                useRootNavigator: true,
                                builder: (context) {
                                  return LoadingUI(function: (_) {}, showtext: true);
                                },
                              );
                            }
                          },
                          builder: (context, state) => WillPopScope(
                            onWillPop: () async => false,
                            child: SingleChildScrollView(
                              child: Container(
                                padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Align(
                                        alignment: Alignment.center,
                                        child: Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Text(
                                            AppStrings.accountinfoTitleBVNtitle,
                                            style: AppTextStyles.h2style,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0, top: 12.0, right: 8.0, bottom: 8.0),
                                        child: AccountFormUI(
                                          title: AppStrings.accountinfoTitleBVNdetails,
                                          node: null,
                                          controller: _bvnController,
                                          hint: AppStrings.accountinfoTitleBVN,
                                          action: TextInputAction.done,
                                          type: TextInputType.number,
                                          error: (state is ProfileLoaded)
                                              ? state.bvn.length < 11
                                                  ? AppStrings.accountinfoBVNerrorText
                                                  : null
                                              : null,
                                          maxlength: 11,
                                          readOnly: false,
                                          onChanged: (bvn) => _profileBloc.add(
                                            BvnProfile(
                                              bvn: bvn,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            right: 20, left: MediaQuery.of(context).size.width / 2, bottom: 20.0),
                                        child: ButtonArrow(
                                          navigatorfunc: (state is ProfileLoaded)
                                              ? state.bvn.length < 11
                                                  ? null
                                                  : () async {
                                                      await _profileBloc.add(SubmitBvnProfile());
                                                    }
                                              : null,
                                          buttontitle: AppStrings.doneBtn,
                                          arrow: false,
                                          buttontitleColor: ColorSets.colorPrimaryBlack,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                    // Navigator.pushNamed(context, AppRouteName.profile);
                  },
                  child: visibillity
                      ? Padding(
                          padding: const EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              width: 200,
                              height: 80,
                              decoration: ShapeDecoration(
                                shape: CompleteProfile(),
                                color: ColorSets.colorPrimaryLightYellowDashBoard,
                              ),
                              child: Align(
                                  alignment: Alignment.topCenter,
                                  child: Text(
                                    AppStrings.completeProfileOne,
                                    style: AppTextStyles.h3style
                                        .copyWith(fontSize: 18, color: ColorSets.colorPrimaryWhite),
                                  )),
                            ),
                          ),
                        )
                      : EmptyWidgetUI(),
                ),
                // GestureDetector(
                //   onTap: () {
                //     Navigator.pop(context);
                //     context.bloc<DashboardBloc>().add(CompleteProfileDash(completeprofile: true));
                //   },
                //   child: Padding(
                //     padding: const EdgeInsets.symmetric(horizontal: 10.0),
                //     child: Align(
                //       alignment: Alignment.topRight,
                //       child: Container(
                //         width: 120,
                //         height: 35,
                //         decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(40),
                //           color: ColorSets.colorPrimaryWhite,
                //         ),
                //         child: Align(
                //             alignment: Alignment.center,
                //             child: Text(
                //               AppStrings.completeProfileTwo,
                //               style:
                //                   AppTextStyles.h3style.copyWith(fontSize: 18, color: ColorSets.colorPrimaryLightGreen),
                //             )),
                //       ),
                //     ),
                //   ),
                // )
              ],
            )),
      ),
    );
  }
}

class CompleteProfile extends ShapeBorder {
  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.all(20);

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) => null;

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    rect = Rect.fromPoints(
      rect.topLeft - Offset(0, -13),
      rect.bottomRight - Offset(0, 30), // draw a rectangle
    );
    return Path()
      ..moveTo(rect.topRight.dx - 40, rect.topRight.dy) // move the starting point to the top right
      ..relativeLineTo(10, -15) //draw a line
      ..relativeLineTo(25, 50)
      ..addRRect(RRect.fromRectAndRadius(rect, Radius.circular(rect.height / 2))) //give it a border radius curve
      ..close();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {}

  @override
  ShapeBorder scale(double t) => this;
}

class Later extends ShapeBorder {
  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.all(20);

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) => null;

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    rect = Rect.fromPoints(
      rect.topLeft,
      rect.bottomRight - Offset(0, 20),
    );
    return Path()
      ..moveTo(rect.bottomRight.dx - 10, rect.bottomCenter.dy)
      ..relativeLineTo(20, -20)
      ..relativeLineTo(-20, 20)
      ..addRRect(RRect.fromRectAndRadius(rect, Radius.circular(rect.height / 2)))
      ..close();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {}

  @override
  ShapeBorder scale(double t) => this;
}

// Align(
//   alignment: Alignment.topLeft,
//   child: AlertDialog(
//     content: Column(
//       children: [

//         Expanded(
//                                         child: Material(
//             color:
//                 ColorSets.colorPrimaryLightYellowDashBoard,
//             shape: Later(),
//             child: InkWell(
//               onTap: () {},
//             ),
//           ),
//         )
//       ],
//     ),
//   ),
// ),
