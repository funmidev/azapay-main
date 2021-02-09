import 'package:azapay/app/app.dart';
import 'package:azapay/src/blocs/modifypasssword/modifypassword_bloc.dart';
import 'package:azapay/src/models/models.dart';
import 'package:azapay/src/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class ResetPasswordUI extends StatefulWidget {
  // final int value;
  // ResetPasswordUI({this.value = 0});
  @override
  _ResetPasswordUIState createState() => _ResetPasswordUIState();
}

class _ResetPasswordUIState extends State<ResetPasswordUI> {
  final FocusNode _newpasswordnode = FocusNode();
  final FocusNode _confirmpasswordnode = FocusNode();
  TextEditingController _newpasswordController;
  TextEditingController _confirmpasswordController;

  bool _newpasswordvisible;
  bool _confirmpasswordvisible;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  ModifypasswordBloc _bloc;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<ModifypasswordBloc>(context);
    _newpasswordvisible = false;
    _confirmpasswordvisible = false;
    _newpasswordController = TextEditingController();
    _confirmpasswordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: BlocListener<ModifypasswordBloc, ModifypasswordState>(
          listener: (context, state) async {
            if (state is InputDataModifypasswordState) {
              if (state.message == '200') {
                // if (widget.value == 1) {
                //   await Navigator.of(context, rootNavigator: true).pop();
                //   await Navigator.pop(context);
                //   return;
                // }
                await Navigator.of(context, rootNavigator: true).pop();
                await Navigator.pushNamed(
                  context,
                  AppRouteName.reset_password_success,
                  arguments: VerifiedSuccessResponse(
                      vector: AppFlare.response,
                      title: AppStrings.resetPasswordSuccessone,
                      subtitle: AppStrings.resetPasswordSuccesstwo,
                      titletextsyle: AppTextStyles.h2style,
                      subtitlevisibility: true,
                      flare: true,
                      flareartboard: AppFlare.resetPassword,
                      flareanimation: AppFlare.resetPasswordanimation,
                      buttontitle: AppStrings.resetPasswordSuccessthree,
                      buttontitleColor: ColorSets.colorPrimaryBlack,
                      onPressedbutton: () async {
                        await Navigator.pushReplacementNamed(context, AppRouteName.signin);
                      },
                      buttonvisibility: true,
                      widgetbinding: (_) {}),
                );
              } else if (state.message == '400') {
                await Navigator.of(context, rootNavigator: true).pop();
                showToast('An Error Occurred, Try again.',
                    backgroundColor: ColorSets.colorPrimaryRed,
                    context: context,
                    animation: StyledToastAnimation.slideFromTop,
                    reverseAnimation: StyledToastAnimation.slideToTop,
                    position: StyledToastPosition.top,
                    startOffset: Offset(0.0, -3.0),
                    reverseEndOffset: Offset(0.0, -3.0),
                    duration: Duration(seconds: 4),
                    //Animation duration   animDuration * 2 <= duration
                    animDuration: Duration(seconds: 1),
                    curve: Curves.elasticOut,
                    reverseCurve: Curves.fastOutSlowIn);
                // Scaffold.of(context)
                //   ..hideCurrentSnackBar()
                //   ..showSnackBar(
                //     SnackBar(
                //       duration: Duration(milliseconds: 2000),
                //       // shape: RoundedRectangleBorder(
                //       //   borderRadius: BorderRadius.only(
                //       //     topLeft: Radius.circular(30),
                //       //     topRight: Radius.circular(30),
                //       //   ),
                //       // ),
                //       elevation: 0.0,
                //       backgroundColor: ColorSets.colorPrimaryRed,
                //       content: Row(
                //         mainAxisSize: MainAxisSize.min,
                //         children: [
                //           Expanded(
                //             child: Text(
                //               'An Error Occurred, Try again.',
                //               style: AppTextStyles.h3style,
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //   );
              }
            } else if (state is LoadinglModifypasswordState) {
              await showGeneralDialog(
                  context: context,
                  pageBuilder: (context, _, __) {
                    return LoadingUI(function: (_) {}, showtext: true);
                  },
                  barrierDismissible: true,
                  barrierLabel: '',
                  barrierColor: Colors.black.withOpacity(0.8),
                  transitionDuration: Duration(milliseconds: 300),
                  useRootNavigator: true,
                  transitionBuilder: (context, animation, __, child) {
                    return SlideTransition(
                      position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(animation),
                      child: child,
                    );
                  });
            }
          },
          child: BlocBuilder<ModifypasswordBloc, ModifypasswordState>(
              builder: (context, state) => Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ListView(
                        shrinkWrap: true,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              AppStrings.resetPasswordone,
                              textAlign: TextAlign.left,
                              style: AppTextStyles.h2style,
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                AppStrings.resetPasswordfive,
                                style: AppTextStyles.h3style.copyWith(fontWeight: FontWeight.normal),
                              ),
                            ),
                          ),
                          Form(
                            key: _formKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FormFieldUI(
                                  currentnode: _newpasswordnode,
                                  fieldController: _newpasswordController,
                                  hint: AppStrings.resetPasswordtwo,
                                  textInputAction: TextInputAction.next,
                                  textInputType: TextInputType.number,
                                  passwordvisible: _newpasswordvisible,
                                  suffixicon: InkWell(
                                      child: Icon(
                                        _newpasswordvisible ? Icons.visibility : Icons.visibility_off,
                                        color: Colors.grey[500],
                                      ),
                                      onTap: () {
                                        setState(() {
                                          _newpasswordvisible = !_newpasswordvisible;
                                        });
                                      }),
                                  maxLength: 6,
                                  errorText: (state is InputDataModifypasswordState)
                                      ? state.password.isNotEmpty
                                          ? state.isPasswordValid ? null : AppStrings.passworderrorText
                                          : null
                                      : null,
                                  onchanged: (password) => _bloc.add(
                                    ModifyPasswordChanged(password: password),
                                  ),
                                ),
                                // FormFieldUI(
                                //     currentnode: _confirmpasswordnode,
                                //     fieldController: _confirmpasswordController,
                                //     hint: AppStrings.resetPasswordthree,
                                //     textInputAction: TextInputAction.done,
                                //     textInputType: TextInputType.number,
                                //     passwordvisible: _confirmpasswordvisible,
                                //     suffixicon: InkWell(
                                //       child: Icon(_confirmpasswordvisible ? Icons.visibility : Icons.visibility_off,
                                //           color: Colors.grey[500]),
                                //       onTap: () {
                                //         setState(() {
                                //           _confirmpasswordvisible = !_confirmpasswordvisible;
                                //         });
                                //       },
                                //     ),
                                //     maxLength: 6,
                                //     errorText: _confirmpasswordController.text.length >= 5
                                //         ? _newpasswordController.text != _confirmpasswordController.text
                                //             ? AppStrings.errorRed
                                //             : AppStrings.errorGreen
                                //         : null,
                                //     errorColor: _confirmpasswordController.text.length >= 5
                                //         ? _newpasswordController.text != _confirmpasswordController.text ? false : true
                                //         : false,
                                //     onchanged: (value) {})
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 10),
                            child: ButtonArrow(
                                buttontitleColor: ColorSets.colorPrimaryBlack,
                                navigatorfunc: (state is InputDataModifypasswordState)
                                    ? state.password.length >= 6
                                        ? () async {
                                            // if (widget.value == 1) {
                                            //   await _bloc.add(TriggerModifyPasswordTokenApi());
                                            // }
                                            await _bloc.add(FormSubmitModifyPassword());
                                          }
                                        : null
                                    : null,
                                buttontitle: AppStrings.resetPasswordfour,
                                arrow: false),
                          ),
                        ],
                      ),
                    ),
                  )),
        ),
      ),
    );
  }
}
