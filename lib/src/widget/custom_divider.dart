import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomDivider extends StatelessWidget {
  // final Color color;
  // final double lead;
  // final double trail;

  const CustomDivider({
    // @required this.color,
    // @required this.lead,
    // @required this.trail,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width / 2.5),
      height: 4,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(30),
      ),
    );
    // return ClipRRect(
    //     borderRadius: const BorderRadius.all(Radius.circular(300)),
    //     child: Divider(
    //       color: color,
    //       height: 4,
    //       thickness: 10,
    //       indent: lead,
    //       endIndent: trail,
    //     ));
  }
}
