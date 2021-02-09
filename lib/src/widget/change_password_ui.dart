import 'package:azapay/app/app.dart';
import 'package:azapay/src/widget/button_arrow_ui.dart';
import 'package:azapay/src/widget/custom_formfield_ui.dart';
import 'package:flutter/material.dart';

class ChangePasswordUI extends StatefulWidget {
  @override
  _ChangePasswordUIState createState() => _ChangePasswordUIState();
}

class _ChangePasswordUIState extends State<ChangePasswordUI> {
  final TextEditingController _currentpasswordController = TextEditingController();
  final TextEditingController _newpasswordController = TextEditingController();
  final TextEditingController _confirmpasswordController = TextEditingController();

  final FocusNode _currentnode = FocusNode();
  final FocusNode _newnode = FocusNode();
  final FocusNode _confirmnode = FocusNode();

  bool _currentpasswordvisible;
  bool _newpasswordvisible;
  bool _confirmpasswordvisible;

  @override
  void initState() {
    super.initState();
    _currentpasswordvisible = false;
    _newpasswordvisible = false;
    _confirmpasswordvisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0.0, centerTitle: true, title: Text(AppStrings.passwordsettingsTitleI)),
      body: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FormFieldUI(
                    currentnode: _currentnode,
                    nextnode: _newnode,
                    fieldController: _currentpasswordController,
                    hint: AppStrings.changepasswordOne,
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.number,
                    maxLength: 6,
                    errorText: null,
                    suffixicon: InkWell(
                        child: Icon(
                          _currentpasswordvisible ? Icons.visibility : Icons.visibility_off,
                          color: Colors.grey[500],
                        ),
                        onTap: () {
                          setState(() {
                            _currentpasswordvisible = !_currentpasswordvisible;
                          });
                        }),
                    passwordvisible: _currentpasswordvisible,
                    onchanged: null),
                FormFieldUI(
                    currentnode: _newnode,
                    nextnode: _confirmnode,
                    fieldController: _newpasswordController,
                    hint: AppStrings.changepasswordTwo,
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.number,
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
                    passwordvisible: _newpasswordvisible,
                    maxLength: 6,
                    errorText: null,
                    //     ? AppStrings.errorRed
                    //     : AppStrings.errorGreen,
                    // errorColor: _newpasswordController.text != _currentpasswordController.text ? false : true,
                    onchanged: (newpassword) {}),
                FormFieldUI(
                    currentnode: _confirmnode,
                    fieldController: _confirmpasswordController,
                    hint: AppStrings.changepasswordThree,
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.number,
                    suffixicon: InkWell(
                        child: Icon(
                          _confirmpasswordvisible ? Icons.visibility : Icons.visibility_off,
                          color: Colors.grey[500],
                        ),
                        onTap: () {
                          setState(() {
                            _confirmpasswordvisible = !_confirmpasswordvisible;
                          });
                        }),
                    passwordvisible: _confirmpasswordvisible,
                    maxLength: 6,
                    errorText: _confirmpasswordController.text != _newpasswordController.text
                        ? AppStrings.errorRed
                        : AppStrings.errorGreen,
                    errorColor: _confirmpasswordController.text != _newpasswordController.text ? false : true,
                    onchanged: null),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 20),
                  child: ButtonArrow(
                      navigatorfunc: () {},
                      buttontitle: AppStrings.changepasswordFour,
                      arrow: false,
                      buttontitleColor: ColorSets.colorPrimaryBlack),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
