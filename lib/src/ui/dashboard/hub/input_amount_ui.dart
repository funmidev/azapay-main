import 'package:azapay/app/app.dart';
import 'package:azapay/src/blocs/blocs.dart';
import 'package:azapay/src/ui/ui.dart';
import 'package:azapay/src/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money2/money2.dart';

import 'merchant_transaction_review.dart';

class InputMerchantAmountUI extends StatefulWidget {
  @override
  _InputMerchantAmountUIState createState() => _InputMerchantAmountUIState();
}

class _InputMerchantAmountUIState extends State<InputMerchantAmountUI> {
  QrscanBloc _bloc;
  TextEditingController _amountController;

  @override
  void initState() {
    super.initState();
    _bloc = context.bloc<QrscanBloc>();
    _amountController = TextEditingController();
    _amountController.addListener(() {
      final text = _amountController.text.toLowerCase();
      if (text.isNotEmpty) {
        print(text.replaceAll('[,]', ''));
        _amountController.value = _amountController.value.copyWith(
          text: Money.from(num.parse(text.replaceAll(RegExp(r'[,]'), '')),
                  Currency.create('USD', 2))
              .format('#,###'),
          selection:
              TextSelection(baseOffset: text.length, extentOffset: text.length),
          composing: TextRange.empty,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var buttonPayName = 'Continue ';
    var size = MediaQuery.of(context).size;
    return PaymentBackgroundUI(
      titlebar: Text(AppStrings.merchantAmountTitle,
          style: AppTextStyles.h3style.copyWith(fontWeight: FontWeight.w600)),
      contentbody: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            //
            //
            //
            //---------i add this to this --------------
            Center(
              child: Image.asset(
                'assets/images/onboard-three.png',
                width: size.width * .5,
                height: size.height * .30,
              ),
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 60.0, right: 20.0),
                  alignment: Alignment.centerLeft,
                  child: Icon(
                    FontAwesomeIcons.headset,
                    size: 20.0,
                    color: Color(0xffFFB300),
                  ),
                ),
                Text('Anthony Lucas',
                    style: GoogleFonts.lato(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 60.0, right: 20.0),
                  alignment: Alignment.centerLeft,
                  child: Icon(
                    FontAwesomeIcons.male,
                    size: 20.0,
                    color: Color(0xff0059CF),
                  ),
                ),
                Text('Male',
                    style: GoogleFonts.lato(fontSize: 14, color: Colors.black)),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 60.0, right: 20.0),
                  alignment: Alignment.centerLeft,
                  child: Icon(
                    FontAwesomeIcons.dumpster,
                    size: 20.0,
                    color: Color(0xff2D9DAE),
                  ),
                ),
                Text('Cash Till 1',
                    style: GoogleFonts.lato(fontSize: 14, color: Colors.black)),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 30.0),
              child: Text(
                'Amount',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),

            Padding(
              padding: const EdgeInsets.only(left: 14.0, right: 14),
              // padding: EdgeInsets.symmetric(
              //     horizontal:
              //         MediaQuery.of(context).size.height > 568 ? 60 : 40),
              child: FormFieldUI(
                  currentnode: null,
                  fieldController: _amountController,
                  hint: AppStrings.transferAmount,
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.number,
                  errorText: null,
                  borderradius: 8,
                  setOnFieldComplete: true,
                  merchantAmountFieldComplete: (amount) async {
                    final merchantamount = Money.from(
                            double.parse(
                                amount.replaceAll(RegExp(r'[,]'), '') ?? 0),
                            Currency.create('USD', 2))
                        .format('####.##')
                        .toString();

                    _bloc.add(
                      QrScanAmount(
                        amount: double.parse(merchantamount),
                        screen: 1,
                      ),
                    );
                    await Navigator.of(context, rootNavigator: true)
                        .pushReplacement(
                      PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) {
                            return QrCodeScanCameraUI();
                          },
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            var begin = Offset(0.0, 1.0);
                            var end = Offset.zero;
                            Curve curve = Curves.ease;
                            var tween = Tween(begin: begin, end: end)
                                .chain(CurveTween(curve: curve));

                            return SlideTransition(
                                position: animation.drive(tween), child: child);
                          },
                          fullscreenDialog: true),
                    );
                  },
                  prefixicon: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(AppStrings.nairaUnicode,
                        style: AppTextStyles.h3style.copyWith(fontSize: 15)),
                  ),
                  onchanged: null),
            ),

            ///
            ///
            ///
            ///
            ///
            ///
            ///
            ///
            //-----------customizing Button to continue-------------

            Center(
              child: FlatButton(
                  textColor: Colors.white,
                  disabledColor: Colors.grey,
                  disabledTextColor: Colors.black,
                  padding: EdgeInsets.all(8.0),
                  splashColor: Colors.deepOrange,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Color(0xffFFB300))),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Body()),
                    );
                  },
                  color: Color(0xffFFB300),
                  child: Text(buttonPayName,
                      style: GoogleFonts.lato(fontSize: 14))),
            ),
          ],
        ),
      ),
    );
  }
}
