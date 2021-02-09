import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:money2/money2.dart';

class CustomTextEditingController extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    // print(newValue);
    if (newValue.selection.baseOffset == 0) {
      print(true);
      return newValue;
    }

    // double value = double.parse(newValue.text);

    // final formatter = NumberFormat.simpleCurrency(locale: "pt_Br");

    var newText = Money.from(num.parse(newValue.text), Currency.create('USD', 2)).format('#,###');
    //formatter.format(value / 100);

    return newValue.copyWith(text: newText, selection: TextSelection.collapsed(offset: newText.length));
  }
}
