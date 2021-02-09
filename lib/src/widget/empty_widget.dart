import 'package:flutter/widgets.dart';

class EmptyWidgetUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: false,
        maintainInteractivity: false,
        maintainSize: false,
        maintainAnimation: false,
        maintainState: true,
        child: Text(''));
  }
}
