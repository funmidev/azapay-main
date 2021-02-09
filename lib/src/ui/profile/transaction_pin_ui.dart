import 'package:azapay/app/app.dart';
import 'package:azapay/src/blocs/blocs.dart';
import 'package:azapay/src/ui/ui.dart';
import 'package:azapay/src/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keyboard_avoider/keyboard_avoider.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionUI extends StatefulWidget {
  final int value;
  TransactionUI({this.value = 0});
  @override
  _TransactionUIState createState() => _TransactionUIState();
}

class _TransactionUIState extends State<TransactionUI> {
  TransactionpinBloc _bloc;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController _verificationToken;

  @override
  void initState() {
    super.initState();
    _bloc = context.bloc<TransactionpinBloc>();
    _verificationToken = TextEditingController();
    // print(widget.value);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //setttings page
    if (widget.value != 1) {
      _bloc.add(ConfirmTransactionPin(change: 0));
    } else {
      _bloc.add(ConfirmTransactionPin(change: 1));
    }
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.add(ClearTransactionPin());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TransactionpinBloc, TransactionpinState>(
      listenWhen: (previous, current) {
        if (previous is TransactionpinLoaded && current is TransactionpinLoaded) {
          return false;
        } else {
          return true;
        }
      },
      listener: (context, state) async {
        // if (state is TransactionpinChecked) {
        //   await Navigator.of(context, rootNavigator: true).pop();
        //   return Navigator.push(
        //     context,
        //     PageRouteBuilder(
        //       pageBuilder: (context, animation, secondaryAnimation) {
        //         return TransactionResponseUI(
        //           icon: Icons.done,
        //           color: ColorSets.colorPrimaryLightGreen,
        //           responsetitle: AppStrings.successTransactPinTitle,
        //           responsemessage: AppStrings.successTransactPinSubTitle,
        //         );
        //       },
        //       transitionsBuilder: (context, animation, secondaryAnimation, child) {
        //         var begin = Offset(0.0, 1.0);
        //         var end = Offset.zero;
        //         Curve curve = Curves.ease;
        //         var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        //         return SlideTransition(position: animation.drive(tween), child: child);
        //       },
        //     ),
        //   );
        // await showDialog(
        //     context: context,
        //     useSafeArea: false,
        //     useRootNavigator: true,
        //     builder: (context) {
        //       return VerifiedSuccessUI(
        //           verifiedSuccessResponse: VerifiedSuccessResponse(
        //               vector: AppVectors.greenMark,
        //               title: AppStrings.successTransactPinTitle,
        //               subtitle: AppStrings.successTransactPinSubTitle,
        //               subtitlevisibility: true,
        //               titletextsyle: AppTextStyles.h2style.copyWith(fontWeight: FontWeight.bold),
        //               onPressedbutton: null,
        //               buttonvisibility: false,
        //               widgetbinding: (_) {
        //                 Future.delayed(Duration(seconds: 2), () async {
        //                   await Navigator.of(context, rootNavigator: true).pop();
        //                 });
        //               },
        //               buttontitle: ''));
        //     }).then((value) async => await Navigator.pop(_scaffoldKey.currentContext));
        // } else

        if (state is TransactionpinError) {
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
            ),
          );
          // Scaffold.of(context).showSnackBar(
          //   SnackBar(
          //     duration: Duration(milliseconds: 2000),
          //     elevation: 0.0,
          //     backgroundColor: ColorSets.colorPrimaryRed,
          //     content: Row(
          //       mainAxisSize: MainAxisSize.min,
          //       children: [
          //         Expanded(
          //           child: Text(
          //             AppStrings.failedTransactPinTitle,
          //             style: AppTextStyles.h3style,
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // );
          // await Navigator.of(context, rootNavigator: true).pop();
          // return Navigator.push(
          //   context,
          //   PageRouteBuilder(
          //     pageBuilder: (context, animation, secondaryAnimation) {
          //       return TransactionResponseUI(
          //         icon: Icons.clear,
          //         color: ColorSets.colorPrimaryRed,
          //         responsetitle: AppStrings.failedTransactPinTitle,
          //         responsemessage: AppStrings.failedTransactPinSubTile,
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
          // await showDialog(
          //     context: context,
          //     useSafeArea: false,
          //     useRootNavigator: true,
          //     builder: (context) {
          //       return VerifiedSuccessUI(
          //           verifiedSuccessResponse: VerifiedSuccessResponse(
          //               vector: AppVectors.greenMark,
          //               title: AppStrings.failedTransactPinTitle,
          //               subtitle: AppStrings.failedTransactPinSubTile,
          //               subtitlevisibility: true,
          //               titletextsyle: AppTextStyles.h2style.copyWith(fontWeight: FontWeight.bold),
          //               onPressedbutton: null,
          //               buttonvisibility: false,
          //               widgetbinding: (_) {
          //                 Future.delayed(Duration(seconds: 2), () async {
          //                   await Navigator.of(context, rootNavigator: true).pop();
          //                 });
          //               },
          //               buttontitle: ''));
          //     });
        } else if (state is TransactionpinChecked) {
          await Navigator.of(context, rootNavigator: true).pop();
          Navigator.pop(context);
        } else if (state is TransactionpinLoading) {
          await showGeneralDialog(
              context: context,
              pageBuilder: (context, _, __) {
                return LoadingUI(function: (_) {}, showtext: false);
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
        } else if (state is TransactionpinLoaded) {
          await showModalBottomSheet(
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
            builder: (context) {
              return WillPopScope(
                onWillPop: () async {
                  await Navigator.of(context, rootNavigator: true).pop();
                  await Navigator.pop(context);
                  return true;
                },
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
                                AppStrings.setTransactionPinToken,
                                style: AppTextStyles.h2style,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0, top: 12.0, right: 8.0, bottom: 8.0),
                            child: AccountFormUI(
                              title: AppStrings.setTransactionPinTokenSub,
                              node: null,
                              controller: _verificationToken,
                              hint: AppStrings.transactionpinOtp,
                              action: TextInputAction.done,
                              type: TextInputType.number,
                              error: null,
                              maxlength: 6,
                              readOnly: false,
                              onChanged: (otp) => otp.length >= 5
                                  ? _bloc.add(
                                      TransactionPinInput(verificationToken: otp, pinOrverificationToken: 1),
                                    )
                                  : null,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(right: 20, left: MediaQuery.of(context).size.width / 2, bottom: 20.0),
                            child: ButtonArrow(
                              navigatorfunc: () async {
                                await _bloc.add(SetTransactionPin());
                                Navigator.of(context, rootNavigator: true).pop();
                              },
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
              );
            },
          );
          // Navigator.pushNamed(context, AppRouteName.profile);

        }
      },
      builder: (context, state) {
        if (state is ConfirmTransactionPinInDB) {
          if (state.pinconfirmation == 0) {
            return Material(
              // key: _scaffoldKey,
              // appBar: AppBar(
              //   elevation: 0.0,
              // ),
              child: KeyboardAvoider(
                autoScroll: true,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: SvgPicture.asset(AppVectors.transactionpin),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              AppStrings.setTransactionPin,
                              style: AppTextStyles.h1style.copyWith(color: ColorSets.colorPrimaryLightYellow),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              AppStrings.setTransactionPinSub,
                              style: AppTextStyles.h3style.copyWith(
                                  color: ColorSets.colorPrimaryBlack, fontSize: 15, fontWeight: FontWeight.normal),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        AppStrings.transactionPinTwo,
                        style: AppTextStyles.h3style.copyWith(fontSize: 18, color: ColorSets.colorPrimaryBlack),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 60.0),
                      child: PinCodeTextField(
                        textStyle: TextStyle(fontWeight: FontWeight.normal),
                        obsecureText: true,
                        textInputType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        enableActiveFill: true,
                        pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(5),
                            fieldHeight: 50,
                            selectedFillColor: ColorSets.colorPrimaryWhite,
                            disabledColor: ColorSets.colorPrimaryWhite,
                            selectedColor: ColorSets.colorPrimaryLightYellow,
                            fieldWidth: 40,
                            activeColor: ColorSets.colorPrimaryLightYellow,
                            inactiveColor: ColorSets.colorGrey.withOpacity(0.7),
                            inactiveFillColor: ColorSets.colorGrey.withOpacity(0.7),
                            activeFillColor: ColorSets.colorPrimaryWhite),
                        // backgroundColor: ColorSets.colorPrimaryBlack.withOpacity(0.7),
                        length: 4,
                        onChanged: (pin) => pin.length == 4
                            ? _bloc.add(TransactionPinInput(
                                pin: pin,
                                pinOrverificationToken: 0,
                              ))
                            : null,
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Material(
              // key: _scaffoldKey,
              // resizeToAvoidBottomInset: true,
              // appBar: AppBar(
              //   elevation: 0.0,
              // ),
              child: KeyboardAvoider(
                // key: _scaffoldKey,
                // resizeToAvoidBottomInset: true,
                // appBar: AppBar(
                //   elevation: 0.0,
                // ),
                autoScroll: true,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AppVectors.transactionpin),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        AppStrings.transactionPinOne,
                        style: AppTextStyles.h2style.copyWith(color: ColorSets.colorPrimaryLightYellow),
                      ),
                    ),
                    Text(
                      AppStrings.transactionPinTwo,
                      style: AppTextStyles.h3style.copyWith(fontSize: 18, color: ColorSets.colorPrimaryBlack),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30.0),
                            child: PinCodeTextField(
                              textStyle: TextStyle(fontWeight: FontWeight.normal),
                              obsecureText: true,
                              textInputType: TextInputType.number,
                              textInputAction: TextInputAction.done,
                              enableActiveFill: true,
                              pinTheme: PinTheme(
                                  shape: PinCodeFieldShape.box,
                                  borderRadius: BorderRadius.circular(5),
                                  fieldHeight: 50,
                                  selectedFillColor: ColorSets.colorPrimaryWhite,
                                  disabledColor: ColorSets.colorPrimaryWhite,
                                  selectedColor: ColorSets.colorPrimaryLightYellow,
                                  fieldWidth: 40,
                                  activeColor: ColorSets.colorPrimaryLightYellow,
                                  inactiveColor: ColorSets.colorGrey.withOpacity(0.7),
                                  inactiveFillColor: ColorSets.colorGrey.withOpacity(0.7),
                                  activeFillColor: ColorSets.colorPrimaryWhite),
                              // backgroundColor: ColorSets.colorPrimaryBlack.withOpacity(0.7),
                              length: 4,
                              onChanged: (pin) => pin.length == 4 ? _bloc.add(CheckTransactionPin(pin: pin)) : null,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }
        } else {
          return LoadingUI(function: (_) {}, showtext: false);
        }
      },
    );
  }
}
