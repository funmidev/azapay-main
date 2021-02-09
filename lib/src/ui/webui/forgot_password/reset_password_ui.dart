import 'package:azapay/app/app.dart';
import 'package:azapay/src/blocs/blocs.dart';
import 'package:azapay/src/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class ResetPasswordWebUI extends StatefulWidget {
  @override
  _ResetPasswordWebUIState createState() => _ResetPasswordWebUIState();
}

class _ResetPasswordWebUIState extends State<ResetPasswordWebUI> {
  ModifypasswordBloc _bloc;
  bool _newpasswordvisible;
  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<ModifypasswordBloc>(context);
    _newpasswordvisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ModifypasswordBloc, ModifypasswordState>(
      listener: (cntext, state) async {
        if (state is InputDataModifypasswordState) {
          if (state.message == '200') {
            //TODO: Navigate to completed processs ui
          } else {
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
          }
        } else if (state is LoadinglModifypasswordState) {
          await showGeneralDialog(
              context: context,
              pageBuilder: (context, _, __) {
                return CustomDialogUI(
                    loading: true,
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
                    centerbutton: null,
                    centertitle: AppStrings.empty,
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
        }
      },
      builder: (context, state) => AuthBackgroundUI(
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
                padding: const EdgeInsets.only(top: 15.0, bottom: 10),
                child: Text(
                  AppStrings.resetPasswordone,
                  style: AppTextStyles.h3style.copyWith(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: MediaQuery.of(context).size.width / 2),
                child: FormFieldUI(
                  currentnode: null,
                  fieldController: null,
                  hint: AppStrings.transactionPinHint,
                  contentpad: 13,
                  borderradius: 10,
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.number,
                  maxLength: 6,
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
                  errorText: null,
                  onchanged: (password) => _bloc.add(
                    ModifyPasswordChanged(password: password),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width / 3, top: MediaQuery.of(context).size.width / 15),
                child: BorderButtonUI(
                  onPressed: (state is InputDataModifypasswordState)
                      ? state.password.length >= 6
                          ? () async {
                              await _bloc.add(FormSubmitModifyPassword());
                            }
                          : null
                      : null,
                  title: AppStrings.signInfive,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
