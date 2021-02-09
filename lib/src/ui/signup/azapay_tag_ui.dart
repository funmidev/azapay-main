import 'package:azapay/app/app.dart';
import 'package:azapay/src/blocs/blocs.dart';
import 'package:azapay/src/models/models.dart';
import 'package:azapay/src/widget/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AzaPayTagUI extends StatefulWidget {
  const AzaPayTagUI({Key key}) : super(key: key);

  @override
  _AzaPayTagUIState createState() => _AzaPayTagUIState();
}

class _AzaPayTagUIState extends State<AzaPayTagUI> {
  SignupBloc _bloc;
  final GlobalKey<FormState> _formKey = GlobalKey();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _bloc = context.bloc<SignupBloc>();
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
      // resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: BlocListener<SignupBloc, SignupState>(
          listener: (context, state) async {
            if (state is SignupLoaded) {
              if (state.basicResponse.status == 200) {
                await Navigator.of(context, rootNavigator: true).pop();
                await Navigator.pushNamed(
                  context,
                  AppRouteName.signup_success,
                  arguments: VerifiedSuccessResponse(
                      vector: AppVectors.registerSuccessfully,
                      title: AppStrings.signUpsuccessone,
                      subtitle: '',
                      titletextsyle: AppTextStyles.h1style.copyWith(
                        fontWeight: FontWeight.normal,
                      ),
                      subtitlevisibility: false,
                      onPressedbutton: () async {
                        await Navigator.pushReplacementNamed(context, AppRouteName.home).then((value) async {
                          await _bloc.add(ClearSignUp());
                          _formKey.currentState.reset();
                        });
                      },
                      buttonvisibility: true,
                      buttontitle: AppStrings.signUpsuccesstwo,
                      widgetbinding: (_) {}),
                ).then((value) => _bloc.add(ReturnToInitial()));
              } else if (state.basicResponse.status == 400) {
                await Navigator.of(context, rootNavigator: true).pop();
                _bloc.add(ReturnToInitial());
                showToast(state.basicResponse.message,
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
                //   Scaffold.of(context)
                //     ..hideCurrentSnackBar()
                //     ..showSnackBar(
                //       SnackBar(
                //         duration: Duration(milliseconds: 2000),
                //         elevation: 0.0,
                //         backgroundColor: ColorSets.colorPrimaryRed,
                //         content: Row(
                //           mainAxisSize: MainAxisSize.min,
                //           children: [
                //             Expanded(
                //               child: Text(
                //                 '${state.basicResponse.message}',
                //                 style: AppTextStyles.h3style,
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //     );
              }
            } else if (state is SignupLoading) {
              await showGeneralDialog(
                  context: context,
                  pageBuilder: (context, _, __) {
                    return LoadingUI(function: (_) {}, showtext: true);
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
          },
          child: BlocBuilder<SignupBloc, SignupState>(
              builder: (context, state) => Center(
                    child: SingleChildScrollView(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Form(
                              key: _formKey,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 35.0),
                                    child: Align(
                                      alignment: Alignment.topCenter,
                                      child: SvgPicture.asset(
                                        AppVectors.azaPayLogo,
                                        width: 80,
                                        height: 80,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Text(
                                      AppStrings.azaTagone,
                                      style: AppTextStyles.h2style,
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Text(
                                        AppStrings.azaTagtwo,
                                        style:
                                            AppTextStyles.h3style.copyWith(fontSize: 15, fontWeight: FontWeight.normal),
                                      ),
                                    ),
                                  ),
                                  FormFieldUI(
                                    currentnode: null,
                                    fieldController: null,
                                    hint: null,
                                    textInputAction: TextInputAction.done,
                                    textInputType: TextInputType.text,
                                    prefixicon: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CircleAvatar(
                                        radius: 10,
                                        backgroundColor: ColorSets.colorPrimaryLightYellow,
                                        child: Text(
                                          AppStrings.azaTagthree,
                                          style: AppTextStyles.h3style.copyWith(color: ColorSets.colorPrimaryWhite),
                                        ),
                                      ),
                                    ),
                                    suffixicon: IconButton(
                                        icon: Icon(Icons.info, color: ColorSets.colorPrimaryBlack),
                                        onPressed: () {
                                          showToast(AppStrings.azatagInfo,
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
                                        }),
                                    errorText: (state is SignupLoaded)
                                        ? state.azatag.isNotEmpty ? null : AppStrings.azatagerrorText
                                        : null,
                                    onchanged: (azatag) => _bloc.add(
                                      AzaTagSignUp(azatag: azatag),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 70,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 10),
                                    child: ButtonArrow(
                                      buttontitleColor: ColorSets.colorPrimaryWhite,
                                      arrow: true,
                                      navigatorfunc: (state is SignupLoaded)
                                          ? state.azatag.length >= 4
                                              ? () async {
                                                  await _bloc.add(SubmitSignUpForm(screen: 4));
                                                }
                                              : null
                                          : null,
                                      buttontitle: AppStrings.azaTagfour,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )),
        ),
      ),
    );
  }
}
