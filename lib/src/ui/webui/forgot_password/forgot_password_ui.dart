import 'package:azapay/app/app.dart';
import 'package:azapay/src/blocs/blocs.dart';
import 'package:azapay/src/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordWebUI extends StatefulWidget {
  @override
  _ForgotPasswordWebUIState createState() => _ForgotPasswordWebUIState();
}

class _ForgotPasswordWebUIState extends State<ForgotPasswordWebUI> {
  TextEditingController _tokenController;
  ModifypasswordBloc _bloc;
  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<ModifypasswordBloc>(context);
    _tokenController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgotpasswordBloc, ForgotpasswordState>(
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
                    AppStrings.forgotpasswordTitle,
                    style: AppTextStyles.h3style.copyWith(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0, bottom: 10),
                  child: Text(
                    AppStrings.forgotpasswordDetails,
                    style: AppTextStyles.h3style,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: MediaQuery.of(context).size.width / 2),
                  child: FormFieldUI(
                    currentnode: null,
                    fieldController: null,
                    hint: AppStrings.forgotpasswordHint,
                    contentpad: 13,
                    borderradius: 10,
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.text,
                    maxLength: null,
                    errorText: null,
                    onchanged: (password) => _bloc.add(
                      ModifyPasswordChanged(password: password),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width / 3, top: MediaQuery.of(context).size.width / 14),
                  child: BorderButtonUI(
                    onPressed: () {},
                    title: AppStrings.signInfive,
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
