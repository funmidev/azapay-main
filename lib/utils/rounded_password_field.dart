import 'package:azapay/app/app.dart';
import 'package:flutter/material.dart';

import 'text_field_container.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final bool obscure;
  final Function showPass;
  final String hint;
  final FormFieldValidator<String> validatePass;

  const RoundedPasswordField({
    Key key,
    this.onChanged,
    this.obscure,
    this.showPass,
    this.validatePass,
    this.hint = 'Password',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        child: TextFormField(
      validator: validatePass,
      obscureText: obscure,
      onChanged: onChanged,
      maxLength: 4,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        // prefix: Icon(
        //   Icons.lock,
        //   color: kPrimaryColor,
        // ),
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[500]),
            borderRadius: BorderRadius.circular(20)),
        focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorSets.colorPrimaryLightYellowDashBoard),
            borderRadius: BorderRadius.circular(20)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        suffix: InkWell(
          onTap: () {
            showPass();
          },
          child: obscure
              ? Icon(
                  Icons.visibility,
                  color: ColorSets.colorPrimaryLightYellowDashBoard,
                )
              : Icon(
                  Icons.visibility_off,
                  color: ColorSets.colorPrimaryLightYellowDashBoard,
                ),
        ),
      ),
    ));
  }
}
