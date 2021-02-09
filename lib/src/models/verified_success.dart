import 'package:flutter/widgets.dart';

class VerifiedSuccessResponse {
  final Function widgetbinding;
  final bool buttonvisibility;
  final Function onPressedbutton;
  final String buttontitle;
  final String vector;
  final String title;
  final TextStyle titletextsyle;
  final String subtitle;
  final bool subtitlevisibility;
  final Color buttontitleColor;
  final bool flare;
  final String flareanimation;
  final String flareartboard;


  VerifiedSuccessResponse(
      {
      this.buttontitleColor,
      this.widgetbinding,
      this.buttonvisibility,
      this.onPressedbutton,
      this.buttontitle,
      this.vector,
      this.title,
      this.titletextsyle,
      this.subtitle,
      this.flare=false,
      this.flareanimation,
      this.flareartboard,
      this.subtitlevisibility});
}
