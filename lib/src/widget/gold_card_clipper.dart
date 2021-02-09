import 'package:flutter/widgets.dart';

class GoldClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    return path
      ..moveTo(size.width * 0.1, size.height)
      ..quadraticBezierTo(size.width * 0.02, size.height, size.width * 0.1, size.height * 0.85)
      ..lineTo(size.width * 0.6, size.height * 0.2)
      ..quadraticBezierTo(size.width * 0.75, 0, size.width * 0.8, size.height * 0.2)
      ..lineTo(size.width, size.height);
    // ..quadraticBezierTo(x1, y1, x2, y2)
    // ..lineTo(x, y)
    // ..lineTo(x, y);
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
