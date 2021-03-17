import 'package:azapay/app/app.dart';
import 'package:azapay/src/blocs/blocs.dart';
import 'package:azapay/src/widget/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CreatePasswordUI extends StatefulWidget {
  const CreatePasswordUI({Key key}) : super(key: key);

  @override
  _CreatePasswordUIState createState() => _CreatePasswordUIState();
}

class _CreatePasswordUIState extends State<CreatePasswordUI> {
  final FocusNode _passwordnode = FocusNode();
  final TextEditingController _passwordcontroller = TextEditingController();

  bool _passwordvisible;
  SignupBloc _bloc;
  final GlobalKey<FormState> _formKey = GlobalKey();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _bloc = context.bloc<SignupBloc>();
    _passwordvisible = false;
  }

  ///-------- my own editing of the focusNode-----
  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    _passwordnode.dispose();

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
                    AppRouteName.azapay_tag,
                  ).then((value) => _bloc.add(ReturnToInitial()));
                } else if (state.basicResponse.status == 400) {
                  await Navigator.of(context, rootNavigator: true).pop();
                  _bloc.add(ReturnToInitial());
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
                          padding: const EdgeInsets.symmetric(vertical: 25.0),
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
                          ),
                        ),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(
                                AppStrings.createPinone,
                                style: AppTextStyles.h3style
                                    .copyWith(fontWeight: FontWeight.normal),
                              ),
                            )),
                        Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FormFieldUI(
                                currentnode: _passwordnode,
                                fieldController: _passwordcontroller,
                                hint: AppStrings.createPintwo,
                                textInputAction: TextInputAction.next,
                                textInputType: TextInputType.number,
                                focusNode: _passwordnode,
                                passwordvisible: _passwordvisible,
                                suffixicon: InkWell(
                                    child: Icon(
                                      _passwordvisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.grey[500],
                                    ),
                                    onTap: () {
                                      setState(() {
                                        _passwordvisible = !_passwordvisible;
                                      });
                                    }),
                                maxLength: 6,
                                errorText: (state is SignupLoaded)
                                    ? state.password.isNotEmpty
                                        ? state.isPasswordValid
                                            ? null
                                            : AppStrings.passworderrorText
                                        : null
                                    : null,
                                onchanged: (password) => _bloc.add(
                                  PasswordSignUp(
                                    password: password,
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
                              horizontal: 70, vertical: 10),
                          child: ButtonArrow(
                            buttontitleColor: ColorSets.colorPrimaryWhite,
                            arrow: true,
                            navigatorfunc: (state is SignupLoaded)
                                ? state.isPasswordValid
                                    ? () async {
                                        await _bloc
                                            .add(SubmitSignUpForm(screen: 3));
                                      }
                                    : null
                                : null,
                            buttontitle: AppStrings.createPinfour,
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
