import 'package:azapay/app/app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormFieldUI extends StatelessWidget {
  const FormFieldUI(
      {Key key,
      @required FocusNode currentnode,
      @required TextEditingController fieldController,
      FocusNode nextnode,
      @required String hint,
      @required TextInputAction textInputAction,
      @required TextInputType textInputType,
      Widget prefixicon,
      Widget suffixicon,
      Color fillColor,
      bool fillit = false,
      bool passwordvisible = false,
      int maxLength,
      bool readOnly = false,
      int maxLines = 1,
      double contentpad = 10.0,
      bool setOnFieldComplete = false,
      Function(String) merchantAmountFieldComplete,
      bool errorColor = false,
      double borderradius = 30,
      TextAlign textAlign = TextAlign.start,
      @required String errorText,
      @required Function(String) onchanged,
      FocusNode focusNode})
      : _currentnode = currentnode,
        _fieldController = fieldController,
        _nextnode = nextnode,
        _hint = hint,
        _textInputAction = textInputAction,
        _textInputType = textInputType,
        _onchanged = onchanged,
        _prefixicon = prefixicon,
        _passwordvisible = passwordvisible,
        _suffixicon = suffixicon,
        _fillit = fillit,
        _maxLength = maxLength,
        _errorText = errorText,
        _errorColor = errorColor,
        _readOnly = readOnly,
        _contentpad = contentpad,
        _maxLines = maxLines,
        _textAlign = textAlign,
        _borderradius = borderradius,
        _setOnFieldComplete = setOnFieldComplete,
        _merchantAmountFieldComplete = merchantAmountFieldComplete,
        super(key: key);

  final FocusNode _currentnode;
  final TextEditingController _fieldController;
  final FocusNode _nextnode;
  final String _hint;
  final TextInputAction _textInputAction;
  final TextInputType _textInputType;
  final Function _onchanged;
  final Widget _prefixicon;
  final bool _passwordvisible;
  final Widget _suffixicon;
  final bool _fillit;
  final int _maxLength;
  final double _contentpad;
  final String _errorText;
  final bool _readOnly;
  final bool _errorColor;
  final int _maxLines;
  final TextAlign _textAlign;
  final double _borderradius;
  final bool _setOnFieldComplete;
  final Function(String) _merchantAmountFieldComplete;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 5),
      child: TextFormField(
        onChanged: _onchanged,
        readOnly: _readOnly,
        maxLines: _maxLines,
        focusNode: _currentnode,
        inputFormatters: [LengthLimitingTextInputFormatter(_maxLength)],
        textAlign: _textAlign,
        controller: _fieldController,
        textInputAction: _textInputAction,
        keyboardType: _textInputType,
        onFieldSubmitted: _setOnFieldComplete
            ? _merchantAmountFieldComplete
            : (value) {
                //  / onfieldsubmit

                _focusChange(
                    context: context,
                    currentfocusNode: _currentnode,
                    nextfocusNode: _nextnode);
              },
        obscureText: _passwordvisible,
        decoration: InputDecoration(
            fillColor: _fillit
                ? ColorSets.colorPrimaryWhite
                : ColorSets.colorGeryField,
            filled: true,
            prefixIcon: _prefixicon,
            prefixIconConstraints: BoxConstraints(
              minHeight: 10,
              minWidth: 50,
            ),
            errorText: _errorText,
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(_borderradius),
              borderSide: _errorColor
                  ? BorderSide(color: Colors.green)
                  : BorderSide(color: Colors.red),
            ),
            suffixIcon: _suffixicon,
            suffixIconConstraints: BoxConstraints(
              minHeight: 10,
              minWidth: 50,
            ),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 20, vertical: _contentpad),
            hintText: _hint,
            helperText: '',
            isDense: true,
            hintStyle: AppTextStyles.h3style.copyWith(
              fontSize: 12,
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[500]),
                borderRadius: BorderRadius.circular(_borderradius)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: ColorSets.colorPrimaryLightYellowDashBoard),
                borderRadius: BorderRadius.circular(_borderradius)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(_borderradius))),
      ),
    );
  }
}

void _focusChange(
    {BuildContext context,
    FocusNode currentfocusNode,
    FocusNode nextfocusNode}) {
  currentfocusNode.unfocus();
  FocusScope.of(context).requestFocus(nextfocusNode);
}
