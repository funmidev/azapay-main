import 'package:azapay/app/app.dart';

class PayBillsName {
  final String hint;
  final int screen;

  PayBillsName({this.hint, this.screen});

  static String paybillhint({int screens}) {
    switch (screens) {
      case 2:
        return AppStrings.paybillsElectricityMeterNo;
        break;
      case 6:
        return AppStrings.paybillsCableSmartCard;
      default:
        return null;
    }
  }
}
