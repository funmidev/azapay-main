import 'package:flutter/widgets.dart';

class TicketDetails {
  final Widget child;
  final double width;
  final Function navigate;
  final String buttontitle;
  final bool arrow;
  final Color buttontitlecolor;

  const TicketDetails(
      {@required this.child,
      @required this.width,
      @required this.navigate,
      @required this.buttontitle,
      @required this.arrow,
      @required this.buttontitlecolor});
}
