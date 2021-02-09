import 'package:azapay/app/app.dart';
import 'package:flutter/material.dart';



class LoadItem extends StatelessWidget {
  final Widget prefixtitle;
  final Widget suffixdetails;
  final double padding;

  const LoadItem({
    Key key,
    @required this.prefixtitle,
    @required this.suffixdetails,
    this.padding=15.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40.0),
          color: ColorSets.colorGrey.withOpacity(0.4)
        ),
        child: Padding(
          padding:  EdgeInsets.all(padding),
          child: Row(
            children: [
              prefixtitle,
              suffixdetails
            ],
          ),
        ),
      ),
    );
  }
}