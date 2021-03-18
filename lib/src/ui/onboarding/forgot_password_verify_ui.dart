import 'package:azapay/app/app.dart';
import 'package:azapay/src/blocs/blocs.dart';
import 'package:azapay/src/blocs/modifypasssword/modifypassword_bloc.dart';
import 'package:azapay/src/models/models.dart';
import 'package:azapay/src/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ForgotPasswordVerifyUI extends StatefulWidget {
  @override
  _ForgotPasswordVerifyUIState createState() => _ForgotPasswordVerifyUIState();
}

class _ForgotPasswordVerifyUIState extends State<ForgotPasswordVerifyUI> {
  TextEditingController _tokenController;
  ModifypasswordBloc _bloc;
  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<ModifypasswordBloc>(context);
    _tokenController = TextEditingController();
    // text: (context.bloc<ForgotpasswordBloc>().state as InputDataForgotpasswordState)
    //     .acquireResetToken
    //     .data
    //     .verificationToken
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ModifypasswordBloc, ModifypasswordState>(
      builder: (context, state) => Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppVectors.forgotPasswordVerifying),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                AppStrings.verifyUserone,
                style: AppTextStyles.h2style.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                AppStrings.verifyUsertwo,
                style: AppTextStyles.h3style.copyWith(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 50,
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: PinCodeTextField(
                        controller: _tokenController,
                        textStyle: TextStyle(fontWeight: FontWeight.normal),
                        obscureText: true,
                        keyboardType: TextInputType.number,
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
                        length: 6,
                        enabled: true,
                        onChanged: (pin) => _bloc.add(ModifyPasswordToken(verificationToken: pin)),
                      ),
                    ),
                  ),
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
                navigatorfunc: () async {
                  await _bloc.add(ModifyPasswordToken(verificationToken: _tokenController.text));
                  await Navigator.pushNamed(
                    context,
                    AppRouteName.forgot_password_verified_user_success,
                    arguments: VerifiedSuccessResponse(
                        vector: AppVectors.phoneVerified,
                        title: AppStrings.verifiedUserone,
                        subtitle: AppStrings.verifiedUsertwo,
                        subtitlevisibility: true,
                        titletextsyle: AppTextStyles.h2style.copyWith(fontWeight: FontWeight.bold),
                        onPressedbutton: null,
                        buttonvisibility: false,
                        widgetbinding: (_) {
                          Future.delayed(Duration(seconds: 2), () async {
                            await Navigator.pushReplacementNamed(context, AppRouteName.reset_password);
                          });
                        },
                        buttontitle: ''),
                  );
                },
                buttontitle: AppStrings.verifyUserthree,
                arrow: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
