// import 'package:flutter/widgets.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// extension BlocContext<T> on BuildContext{
//   BlocProvider bloc<T>() => BlocProvider.of(this);
// }

import 'package:flutter/widgets.dart' show MediaQueryData, Orientation;

class AppExtension {}

extension MediaQueryExtension on MediaQueryData {
  double get swDp => size.shortestSide;

  bool get isPhone => (swDp < 600);

  /// 600dp: a 7” tablet (600x1024 mdpi).
  bool get isSmallTablet => (swDp >= 600);

  /// 720dp: a 10” tablet (720x1280 mdpi, 800x1280 mdpi, etc).
  bool get isLargeTablet => (swDp >= 720);

  bool get isTablet => isSmallTablet || isLargeTablet;

  bool get isLandscape => orientation == Orientation.landscape;

  bool get isPortrait => orientation == Orientation.portrait;
}
