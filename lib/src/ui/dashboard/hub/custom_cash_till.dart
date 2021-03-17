import 'dart:core';

import 'package:azapay/src/models/merchant_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'merchant_cash_till.dart';
//import 'input_amount_ui.dart';

class CustomCashTill extends StatelessWidget {
  String cashTill = "Cash till";

  CustomCashTill({Key key, this.cashierList, this.onChanged, this.itemSelected})
      : super(key: key);

  final List<Cashier> cashierList;
  final String itemSelected;
  final ValueChanged<Cashier> onChanged;

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
              value: itemSelected,
              items: _dropDownItem(cashierList),
              onChanged: (value) {
                var selectedCashtillValue = value as Cashier;
                onChanged(selectedCashtillValue);
              },
              hint: Text(
                'Select Position',
                style: GoogleFonts.lato(
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<DropdownMenuItem<Cashier>> _dropDownItem(List<Cashier> cashierList) {
    return cashierList
        .map((value) => DropdownMenuItem(
              value: value,
              child: Text(
                'Cash Till ' + value.cashTill,
                style: GoogleFonts.lato(
                    fontSize: 16.0, fontWeight: FontWeight.w600),
              ),
            ))
        .toList();
  }
}
