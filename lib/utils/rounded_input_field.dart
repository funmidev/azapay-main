import 'package:azapay/app/app.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final TextInputType inputType;
  final ValueChanged<String> onChanged;
  final bool isEnabled;
  final Color textColor;
  final Color borderColor;

  final FormFieldValidator<String> validateForm;

  const RoundedInputField({
    Key key,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
    this.validateForm,
    this.inputType = TextInputType.text,
    this.isEnabled,
    this.textColor = Colors.black, this.borderColor = Colors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        validator: validateForm,
        onChanged: onChanged,

        enabled: isEnabled,
        keyboardType: inputType,
        style: GoogleFonts.lato(fontSize: 20, color: textColor),
        decoration: InputDecoration(
          // prefixIcon: Icon(
          //   icon,
          //   color: Colors.amber,
          // ),
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color:borderColor),
              borderRadius: BorderRadius.circular(20)),
          focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: ColorSets.colorPrimaryLightYellowDashBoard),
              borderRadius: BorderRadius.circular(20)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        // border: InputBorder.none,
      ),
    );
  }
}
