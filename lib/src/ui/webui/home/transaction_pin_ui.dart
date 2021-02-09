import 'package:azapay/app/app.dart';
import 'package:azapay/src/blocs/blocs.dart';
import 'package:azapay/src/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionPinWebUI extends StatefulWidget {
  @override
  _TransactionPinWebUIState createState() => _TransactionPinWebUIState();
}

class _TransactionPinWebUIState extends State<TransactionPinWebUI> {
  TransactionpinBloc _bloc;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bloc = context.bloc<TransactionpinBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TransactionpinBloc, TransactionpinState>(
      listener: (context, state) async {
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
          await showGeneralDialog(
            barrierDismissible: true,
            barrierLabel: '',
            barrierColor: Colors.black.withOpacity(0.8),
            transitionDuration: Duration(milliseconds: 300),
            transitionBuilder: (context, animation, __, child) {
              return SlideTransition(
                position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(animation),
                child: child,
              );
            },
            context: context,
            useRootNavigator: true,
            pageBuilder: (context, _, __) {
              return CustomDialogUI(
                  input: true,
                  inputdetails: AppStrings.transactionPindetails,
                  inputhint: AppStrings.setTransactionPinTokenSub,
                  inputtitle: AppStrings.setTransactionPinToken,
                  onChanged: (otp) => otp.length >= 5
                      ? _bloc.add(
                          TransactionPinInput(verificationToken: otp, pinOrverificationToken: 1),
                        )
                      : null,
                  loading: false,
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
                  centerbutton: () async {
                    await _bloc.add(SetTransactionPin());
                    Navigator.of(context, rootNavigator: true).pop();
                  },
                  centertitle: AppStrings.doneBtn,
                  centerColor: ColorSets.colorPrimaryLightGreen,
                  centertitleColor: ColorSets.colorPrimaryWhite);
            },
          );
        }
      },
      builder: (context, state) {
        return AuthBackgroundUI(
          child: Padding(
            padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 6),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
                  child: Image.asset(
                    AppImages.azaPayLogo,
                    scale: 18,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    AppStrings.onBoardingOneWeb,
                    style: AppTextStyles.h3style,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 10, bottom: 10),
                    child: Text(
                      AppStrings.merchantTransactionPin,
                      textAlign: TextAlign.left,
                      style: AppTextStyles.h2style.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Form(
                  // key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: MediaQuery.of(context).size.width / 2),
                        child: FormFieldUI(
                          currentnode: null,
                          fieldController: null,
                          hint: AppStrings.transactionPinHint,
                          contentpad: 13,
                          borderradius: 10,
                          textInputAction: TextInputAction.next,
                          textInputType: TextInputType.text,
                          maxLength: null,
                          errorText: null,
                          onchanged: (tag) => (pin) => pin.length == 4
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
                SizedBox(
                  height: 10,
                ),
                // Row(
                //   children: [
                //     InkWell(
                //         onTap: () {},
                //         child: Text(
                //           AppStrings.signInfour,
                //           style: AppTextStyles.h3style.copyWith(color: ColorSets.colorGrey),
                //         )),
                //     Padding(
                //       padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 5, top: 10),
                //       child: BorderButtonUI(
                //         onPressed: (state is InputDataSigninState)
                //             ? state.password.length >= 6 && state.azatag.length >= 4
                //                 ? () async {
                //                     await _bloc.add(FormSubmittedSignIn());
                //                   }
                //                 : null
                //             : null,
                //         title: AppStrings.signInfive,
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        );
      },
    );
  }
}

//  await showGeneralDialog(
//             barrierDismissible: true,
//             barrierLabel: '',
//             barrierColor: Colors.black.withOpacity(0.8),
//             transitionDuration: Duration(milliseconds: 300),
//             transitionBuilder: (context, animation, __, child) {
//               return SlideTransition(
//                 position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(animation),
//                 child: child,
//               );
//             },
//             context: context,
//             useRootNavigator: true,
//             pageBuilder: (context, _, __) {
//               return CustomDialogUI(
//                   input: true,
//                   inputdetails: AppStrings.transactionPindetails,
//                   inputhint: AppStrings.transactionPinHint,
//                   inputtitle: AppStrings.transactionPinTitle,
//                   onChanged: (pin) {},
//                   loading: false,
//                   icontitle: false,
//                   titleheader: null,
//                   subtitle: AppStrings.empty,
//                   twobutton: false,
//                   discardtitle: AppStrings.empty,
//                   discardtitleColor: Colors.transparent,
//                   discardColor: Colors.transparent,
//                   acceptedbutton: null,
//                   acceptedtitle: AppStrings.empty,
//                   acceptedtitleColor: Colors.transparent,
//                   acceptedColor: Colors.transparent,
//                   centerbutton: () {},
//                   centertitle: AppStrings.empty,
//                   centerColor: ColorSets.colorPrimaryLightGreen,
//                   centertitleColor: ColorSets.colorPrimaryWhite);

//             },
//           );
