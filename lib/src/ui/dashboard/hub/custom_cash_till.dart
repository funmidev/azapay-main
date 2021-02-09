import 'dart:core';

import 'package:flutter/material.dart';

import 'merchant_cash_till.dart';
//import 'input_amount_ui.dart';

class CustomCashTill extends StatelessWidget {
  String _selectCashTill = null;
  String cashTill = "Cash till";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, top: 3, bottom: 3, right: 20),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
              color: Color(0xffFFB300), style: BorderStyle.solid, width: 0.80),
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: DropdownButtonHideUnderline(
          child: Padding(
            padding: const EdgeInsets.only(left: 14.0, right: 14),
            child: DropdownButton(
              isExpanded: true,
              value: _selectCashTill,
              items: _dropDownItem(),
              onChanged: (value) {
                _selectCashTill = value;
                switch (value) {
                  case "cash Till":
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MerchantCashTillTagging()),
                    );
                    break;
                  default:
                    break;
                }
              },
              hint: Text(
                'Select Position',
                style: TextStyle(
                  fontSize: 12.0,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> _dropDownItem() {
    List<String> ddl = ['cash Till'];
    return ddl
        .map((value) => DropdownMenuItem(
              value: value,
              child: Text(
                value,
                style: TextStyle(
                  fontSize: 12.0,
                ),
              ),
            ))
        .toList();
  }
}
//
// class AmountField extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Container(
//       width: size.width,
//       margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
//       decoration: BoxDecoration(
//         border: Border.all(
//           width: 0.4,
//           color: Colors.orange,
//         ),
//         borderRadius: BorderRadius.all(Radius.circular(10.0)),
//       ),
//       child: TextField(
//           style: TextStyle(color: Colors.black, fontSize: 12.0),
//           cursorColor: Theme.of(context).primaryColor,
//           decoration: InputDecoration(
//               contentPadding:
//                   EdgeInsets.symmetric(horizontal: 32.0, vertical: 14.0),
//               border: InputBorder.none,
//               hintText: "Enter Amount")),
//     );
//   }
// }
