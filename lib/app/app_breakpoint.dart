import 'package:flutter/widgets.dart';

class AppBreakPoint {
  static bool mediumscreen(BuildContext context) {
    return (MediaQuery.of(context).size.width >= 375.0 || MediaQuery.of(context).size.width >= 812.0);
  }

  static const int largeTablet = 720;
}
