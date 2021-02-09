import 'package:azapay/app/app.dart';
import 'package:azapay/src/widget/widget.dart';
import 'package:flutter/material.dart';

class AccountFormUI extends StatelessWidget {
  final String title;
  final FocusNode node;
  final TextEditingController controller;
  final String hint;
  final TextInputAction action;
  final TextInputType type;
  final String error;
  final bool readOnly;
  final int maxlength;
  final bool bvnverified;
  final Function(String) onChanged;
  final double contentpad;
  final double borderradius;
  // final bool passwordvisible;
  final int maxLines;
  final Widget prefixicon;
  final Widget suffixicon;

  const AccountFormUI({
    @required this.title,
    @required this.node,
    @required this.controller,
    @required this.hint,
    @required this.action,
    @required this.type,
    @required this.error,
    this.bvnverified = false,
    this.maxlength,
    this.readOnly = true,
    this.contentpad,
    this.borderradius,
    this.maxLines,
    this.prefixicon,
    this.suffixicon,
    @required this.onChanged,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(
            title,
            style: AppTextStyles.h3style,
          ),
        ),
        bvnverified
            ? Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 10, bottom: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.verified,
                      color: ColorSets.colorPrimaryLightYellow,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Text(
                        AppStrings.bvnVerified,
                        style: AppTextStyles.h3style,
                      ),
                    )
                  ],
                ),
              )
            : FormFieldUI(
                contentpad: contentpad ?? 10.0,
                borderradius: borderradius ?? 30,
                currentnode: node,
                maxLines: maxLines ?? 1,
                prefixicon: prefixicon,
                suffixicon: suffixicon,
                readOnly: readOnly,
                fieldController: controller,
                hint: hint,
                textInputAction: action,
                textInputType: type,
                errorText: error,
                maxLength: maxlength,
                onchanged: onChanged,
              ),
      ],
    );
  }
}
