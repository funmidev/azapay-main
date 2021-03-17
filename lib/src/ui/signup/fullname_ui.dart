import 'package:azapay/app/app.dart';
import 'package:azapay/src/blocs/blocs.dart';
import 'package:azapay/src/widget/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CreateFullNameUI extends StatefulWidget {
  const CreateFullNameUI({Key key}) : super(key: key);

  @override
  _CreateFullNameUIState createState() => _CreateFullNameUIState();
}

class _CreateFullNameUIState extends State<CreateFullNameUI> {
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();

  final FocusNode _firstnamenode = FocusNode();
  final FocusNode _lastnamenode = FocusNode();

  SignupBloc _bloc;

  final GlobalKey<FormState> _formKey = GlobalKey();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _bloc = context.bloc<SignupBloc>();
    super.initState();
  }

  ///--------- adding focusNode------
  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    _firstnamenode.dispose();
    _lastnamenode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      // resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: BlocListener<SignupBloc, SignupState>(
            listener: (context, state) async {
              if (state is SignupLoaded) {
                if (state.basicResponse.status == 200) {
                  await Navigator.of(context, rootNavigator: true).pop();
                  await Navigator.pushReplacementNamed(
                    _scaffoldKey.currentContext,
                    AppRouteName.password_creation,
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
                  // Scaffold.of(context)
                  //   ..hideCurrentSnackBar()
                  //   ..showSnackBar(
                  //     SnackBar(
                  //       duration: Duration(milliseconds: 2000),
                  //       elevation: 0.0,
                  //       backgroundColor: ColorSets.colorPrimaryRed,
                  //       content: Row(
                  //         mainAxisSize: MainAxisSize.min,
                  //         children: [
                  //           Expanded(
                  //             child: Text(
                  //               '${state.basicResponse.message}',
                  //               style: AppTextStyles.h3style,
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   );
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
                        position: Tween(begin: Offset(0, 1), end: Offset(0, 0))
                            .animate(animation),
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
                        Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(
                                AppStrings.signUpone,
                                style: AppTextStyles.h2style,
                              ),
                            )),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              AppStrings.signUpseven,
                              style: AppTextStyles.h3style
                                  .copyWith(fontWeight: FontWeight.normal),
                            ),
                          ),
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FormFieldUI(

                                  currentnode: _firstnamenode,
                                  fieldController: _firstnameController,
                                  nextnode: _lastnamenode,
                                  hint: AppStrings.signUptwo,
                                  textInputAction: TextInputAction.next,
                                  textInputType: TextInputType.text,
                                  maxLength: 100,
                                  errorText: (state is SignupLoaded)
                                      ? state.firstname.isNotEmpty
                                          ? state.isFirstnameValid
                                              ? null
                                              : AppStrings.simpleerrorText
                                          : null
                                      : null,
                                  onchanged: (firstname) => _bloc.add(
                                        FirstNameSignUp(
                                          firstname: firstname,
                                        ),
                                      ),
                                  passwordvisible: false),
                              FormFieldUI(
                                currentnode: _lastnamenode,
                                fieldController: _lastnameController,
                                // nextnode: _emailnode,
                                hint: AppStrings.signUpthree,
                                textInputAction: TextInputAction.done,
                                textInputType: TextInputType.text,
                                maxLength: 100,
                                errorText: (state is SignupLoaded)
                                    ? state.lastname.isNotEmpty
                                        ? state.isLastnameValid
                                            ? null
                                            : AppStrings.simpleerrorText
                                        : null
                                    : null,
                                onchanged: (lastname) => _bloc.add(
                                  LastNameSignUp(
                                    lastname: lastname,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 80, vertical: 10),
                          child: ButtonArrow(
                            buttontitleColor: ColorSets.colorPrimaryWhite,
                            arrow: true,
                            navigatorfunc: (state is SignupLoaded)
                                ? state.isFirstnameValid &&
                                        state.isLastnameValid
                                    ? () async {
                                        await _bloc
                                            .add(SubmitSignUpForm(screen: 2));
                                      }
                                    : null
                                : null,
                            buttontitle: AppStrings.signUpsix,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
