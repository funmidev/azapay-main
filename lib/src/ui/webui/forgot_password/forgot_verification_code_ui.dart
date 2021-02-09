import 'package:azapay/app/app.dart';
import 'package:azapay/src/blocs/blocs.dart';
import 'package:azapay/src/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';

class ForgotVerificationCodeWebUI extends StatefulWidget {
  @override
  _ForgotVerificationCodeWebUIState createState() => _ForgotVerificationCodeWebUIState();
}

class _ForgotVerificationCodeWebUIState extends State<ForgotVerificationCodeWebUI> {
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
      builder: (context, state) {
        return AuthBackgroundUI(
          child: Padding(
            padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 6),
            child: Column(
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
                    style: AppTextStyles.h3style.copyWith(fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Text(
                    AppStrings.verifyUserone,
                    style: AppTextStyles.h2style.copyWith(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Text(
                    AppStrings.verifyUsertwo,
                    style: AppTextStyles.h3style,
                  ),
                ),
                SizedBox(
                  height: 60,
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(right: MediaQuery.of(context).size.width / 2, top: 10),
                          child: PinInputTextField(
                            pinLength: 6,
                            decoration: BoxLooseDecoration(
                              strokeColorBuilder:
                                  PinListenColorBuilder(ColorSets.colorPrimaryLightYellow, ColorSets.colorPin),
                              bgColorBuilder: PinListenColorBuilder(ColorSets.colorPin, ColorSets.colorPrimaryWhite),
                              obscureStyle: ObscureStyle(
                                isTextObscure: true,
                                obscureText: '*',
                              ),
                              hintText: '------',
                            ),
                            controller: _tokenController,
                            textInputAction: TextInputAction.go,
                            enabled: true,
                            inputFormatter: [LengthLimitingTextInputFormatter(6)],
                            keyboardType: TextInputType.number,
                            textCapitalization: TextCapitalization.characters,
                            // onSubmit: (pin) {
                            //   debugPrint('submit pin:$pin');
                            // },
                            onChanged: (pin) => _bloc.add(ModifyPasswordToken(verificationToken: pin)),
                            enableInteractiveSelection: false,
                          ),
                          // PinCodeTextField(
                          //       controller: _tokenController,
                          //       textStyle: TextStyle(fontWeight: FontWeight.normal),
                          //       obsecureText: true,
                          //       textInputType: TextInputType.number,
                          //       textInputAction: TextInputAction.done,
                          //       enableActiveFill: true,
                          //       pinTheme: PinTheme(
                          //           shape: PinCodeFieldShape.box,
                          //           borderRadius: BorderRadius.circular(5),
                          //           fieldHeight: 50,
                          //           selectedFillColor: ColorSets.colorPrimaryWhite,
                          //           disabledColor: ColorSets.colorPrimaryWhite,
                          //           selectedColor: ColorSets.colorPrimaryLightYellow,
                          //           fieldWidth: 40,
                          //           activeColor: ColorSets.colorPrimaryLightYellow,
                          //           inactiveColor: ColorSets.colorGrey.withOpacity(0.7),
                          //           inactiveFillColor: ColorSets.colorGrey.withOpacity(0.7),
                          //           activeFillColor: ColorSets.colorPrimaryWhite),
                          //       // backgroundColor: ColorSets.colorPrimaryBlack.withOpacity(0.7),
                          //       length: 6,
                          //       enabled: true,
                          //       onChanged: (pin) => _bloc.add(ModifyPasswordToken(verificationToken: pin)),
                          //     ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width / 3, top: MediaQuery.of(context).size.width / 12),
                  child: BorderButtonUI(
                    onPressed: () async {
                      await _bloc.add(ModifyPasswordToken(verificationToken: _tokenController.text));
                      await Navigator.pushNamed(
                        context,
                        AppRouteName.reset_password,
                      );
                    },
                    title: AppStrings.verifyUserthree,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
