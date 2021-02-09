
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AvatarUI extends StatelessWidget {
   final String asset;
   const AvatarUI({Key key,this.asset}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(asset);
  }
}