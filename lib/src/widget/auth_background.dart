import 'package:azapay/app/app.dart';
import 'package:flutter/material.dart';
import 'package:universal_platform/universal_platform.dart';

class AuthBackgroundUI extends StatelessWidget {
  final Widget child;
  final Color bottomleftPaintColor;
  final double opacityline;
  final bool bottomgetstartedcheck;
  final Color dotandlineColor;

  AuthBackgroundUI(
      {this.child,
      this.bottomleftPaintColor = ColorSets.cardwalletweb,
      this.opacityline = 1.0,
      this.dotandlineColor = ColorSets.dottedpointweb,
      this.bottomgetstartedcheck = false});
  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomPaint(
        // painter: ShapePainter(
        //   incrementsize: UniversalPlatform.isWeb ? 0.02 : 0.04,
        //   bottomleftPaintColor: bottomleftPaintColor,
        //   bottomgetstartedcheck: bottomgetstartedcheck,
        // ),
        foregroundPainter: ShapePainter(
            incrementsize: UniversalPlatform.isWeb ? 0.02 : 0.04,
            bottomleftPaintColor: bottomleftPaintColor,
            bottomgetstartedcheck: bottomgetstartedcheck,
            dotandlineColor: dotandlineColor),

        // ForePainter(
        //     bottomleftPaintColor: bottomleftPaintColor,
        //     opacityline: opacityline,
        //     bottomgetstartedcheck: bottomgetstartedcheck),
        child: child,
      ),
    );
  }
}

// main.dart

// FOR PAINTING LINES

class ShapePainter extends CustomPainter {
  final double incrementsize;
  final Color bottomleftPaintColor;
  final bool bottomgetstartedcheck;
  final Color dotandlineColor;
  ShapePainter({this.incrementsize, this.bottomleftPaintColor, this.bottomgetstartedcheck, this.dotandlineColor});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint() //bottomright bg
      ..color = bottomgetstartedcheck ? bottomleftPaintColor.withOpacity(0.7) : Color.fromARGB(115, 255, 180, 0)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path_0 = Path();
    path_0.moveTo(size.width, size.height);
    path_0.quadraticBezierTo(size.width * 0.82, size.height, size.width * 0.76, size.height);
    path_0.cubicTo(size.width * 0.78, size.height * 0.71, size.width * 0.85, size.height * 0.91, size.width * 0.93,
        size.height * 0.90);
    path_0.cubicTo(size.width * 0.97, size.height * 0.89, size.width * 0.97, size.height * 0.81, size.width * 0.95,
        size.height * 0.80);
    path_0.cubicTo(size.width * 0.92, size.height * 0.76, size.width * 0.84, size.height * 0.75, size.width * 0.89,
        size.height * 0.68);
    path_0.quadraticBezierTo(size.width * 0.94, size.height * 0.61, size.width, size.height * 0.62);
    path_0.lineTo(size.width, size.height);
    path_0.close();

    canvas.drawPath(path_0, paint_0);

    Paint paint_1 = new Paint()
      ..color = Color.fromARGB(120, 255, 180, 0)
      ..style = PaintingStyle.fill
      ..strokeWidth = 3.04;

    Path path_1 = Path();
    path_1.moveTo(0, 0);
    path_1.quadraticBezierTo(size.width * -0.00, size.height * 0.24, 0, size.height * 0.34);
    path_1.cubicTo(size.width * 0.12, size.height * 0.24, size.width * 0.03, size.height * 0.20, size.width * 0.03,
        size.height * 0.14);
    path_1.cubicTo(size.width * 0.01, size.height * 0.10, size.width * 0.02, size.height * 0.05, size.width * 0.07,
        size.height * 0.06);
    path_1.cubicTo(size.width * 0.13, size.height * 0.08, size.width * 0.13, size.height * 0.14, size.width * 0.17,
        size.height * 0.14);
    path_1.quadraticBezierTo(size.width * 0.22, size.height * 0.14, size.width * 0.23, 0);
    path_1.lineTo(0, 0);
    path_1.close();

    canvas.drawPath(path_1, paint_1);

    Paint paint_2 = new Paint()
      ..color = bottomgetstartedcheck ? bottomleftPaintColor : Color.fromARGB(255, 255, 186, 0)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path_2 = Path();
    path_2.moveTo(size.width, size.height);
    path_2.quadraticBezierTo(size.width * 0.82, size.height, size.width * 0.76, size.height);
    path_2.cubicTo(size.width * 0.80, size.height * 0.74, size.width * 0.83, size.height * 0.92, size.width * 0.93,
        size.height * 0.92);
    path_2.cubicTo(size.width * 0.97, size.height * 0.91, size.width * 0.99, size.height * 0.83, size.width * 0.95,
        size.height * 0.82);
    path_2.cubicTo(size.width * 0.89, size.height * 0.80, size.width * 0.85, size.height * 0.76, size.width * 0.91,
        size.height * 0.68);
    path_2.quadraticBezierTo(size.width * 0.95, size.height * 0.64, size.width, size.height * 0.64);
    path_2.lineTo(size.width, size.height);
    path_2.close();

    canvas.drawPath(path_2, paint_2);

    Paint paint_3 = new Paint()
      ..color = Color.fromARGB(255, 255, 180, 0)
      ..style = PaintingStyle.fill
      ..strokeWidth = 3;

    Path path_3 = Path();
    path_3.moveTo(0, 0);
    path_3.quadraticBezierTo(0, size.height * 0.27, 0, size.height * 0.32);
    path_3.cubicTo(size.width * 0.11, size.height * 0.20, size.width * 0.04, size.height * 0.15, size.width * 0.03,
        size.height * 0.12);
    path_3.cubicTo(size.width * 0.01, size.height * 0.08, size.width * 0.03, size.height * 0.04, size.width * 0.06,
        size.height * 0.04);
    path_3.cubicTo(size.width * 0.12, size.height * 0.04, size.width * 0.14, size.height * 0.12, size.width * 0.17,
        size.height * 0.12);
    path_3.cubicTo(size.width * 0.20, size.height * 0.12, size.width * 0.22, size.height * 0.05, size.width * 0.23, 0);
    path_3.quadraticBezierTo(size.width * 0.17, 0, 0, 0);
    path_3.close();

    canvas.drawPath(path_3, paint_3);

    var topdot = Paint()
      ..color = dotandlineColor //Colors.yellow  bottomleftPaintColor
      ..strokeWidth = 5
      ..style = PaintingStyle.fill;

    var bottomdot = Paint()
      ..color = ColorSets.dottedpointweb
      ..strokeWidth = 5
      ..style = PaintingStyle.fill;

    for (var w = 0.0; w < 0.2; w += incrementsize) {
      for (var h = 0.85; h <= 1; h += incrementsize) {
        canvas.drawCircle(Offset(size.width * w, size.height * h), 3, bottomdot);
      }
    } //bottom

    for (var w = 1.0; w > 0.8; w -= incrementsize) {
      for (var h = 0.0; h <= 0.15; h += incrementsize) {
        canvas.drawCircle(Offset(size.width * w, size.height * h), 3, topdot);
      }
    } //top

    var paintline = Paint()
      ..color = ColorSets.dottedpointweb
      ..strokeWidth = 2
      ..style = PaintingStyle.fill;
    canvas.drawLine(Offset(size.width * 0.3, size.height), Offset(size.width * 0.39, size.height * 0.88), paintline);
    canvas.drawLine(Offset(size.width * 0.35, size.height), Offset(size.width * 0.4, size.height * 0.93), paintline);

    var paintline2 = Paint()
      ..color = dotandlineColor
      ..strokeWidth = 2
      ..style = PaintingStyle.fill;
    canvas.drawLine(Offset(size.width * 0.7, 0), Offset(size.width * 0.65, size.height * 0.07), paintline2);
    canvas.drawLine(Offset(size.width * 0.75, 0), Offset(size.width * 0.66, size.height * 0.12), paintline2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

// class ShapePainter extends CustomPainter {
//   final double incrementsize;
//   final Color bottomleftPaintColor;
//   final bool bottomgetstartedcheck;
//   ShapePainter({this.incrementsize, this.bottomleftPaintColor, this.bottomgetstartedcheck});
//   @override
//   void paint(Canvas canvas, Size size) {
//     // size = Size(100, 100);

//     final sizeg = Size(size.width * 0.6, size.height * 0.8);
//     var paint = Paint()
//       ..color = ColorSets.colorPrimaryLightYellow
//       ..strokeWidth = 5
//       ..style = PaintingStyle.fill;
// //       ..strokeCap = StrokeCap.round;

//     var path = Path();
//     path.moveTo(sizeg.width * 0.35, 0);
//     path.quadraticBezierTo(sizeg.width * 0.3, sizeg.height * 0.2, sizeg.width * 0.08, sizeg.height * 0.05);
//     path.cubicTo(sizeg.width * 0.02, sizeg.height * 0.03, sizeg.width * 0.01, sizeg.height * 0.19, sizeg.width * 0.06,
//         sizeg.height * 0.28);
//     path.quadraticBezierTo(sizeg.width * 0.15, sizeg.height * 0.38, 0, sizeg.height * 0.55);
// //             path.cubicTo(size.width*0.7, size.height*0.3,size.width*0.7,size.height*0.2, size.width*0.7,0);
//     path.lineTo(0, 0);
//     canvas.drawPath(path, paint);

//     var paint2 = Paint()
//       ..color = bottomgetstartedcheck
//           ? ColorSets.colorPrimaryLightYellow
//           : ColorSets.colorPrimaryLightYellow.withOpacity(0.7) //Colors.yellow  bottomleftPaintColor
//       ..strokeWidth = 5
//       ..style = PaintingStyle.fill;

//     var path2 = Path();
//     path2.moveTo(size.width, size.height * 0.58);
//     path2.cubicTo(size.width * 0.7, size.height * 0.55, size.width * 1.2, size.height * 1.15, size.width * 0.7,
//         size.height * 0.8);
//     path2.quadraticBezierTo(size.width * 0.6, size.height * 0.70, size.width * 0.6, size.height);
//     path2.lineTo(size.width, size.height);
//     canvas.drawPath(path2, paint2);

//     var paintdot = Paint()
//       ..color = bottomleftPaintColor.withOpacity(0.3) //Colors.yellow  bottomleftPaintColor
//       ..strokeWidth = 5
//       ..style = PaintingStyle.fill;

//     for (var w = 0.0; w < 0.2; w += incrementsize) {
//       for (var h = 0.85; h <= 1; h += incrementsize) {
//         canvas.drawCircle(Offset(size.width * w, size.height * h), 3, paint);
//       }
//     } //bottom

//     for (var w = 1.0; w > 0.8; w -= incrementsize) {
//       for (var h = 0.0; h <= 0.15; h += incrementsize) {
//         canvas.drawCircle(Offset(size.width * w, size.height * h), 3, paintdot);
//       }
//     } //top

//     var paintline = Paint()
//       ..color = ColorSets.colorPrimaryLightYellow.withOpacity(0.3)
//       ..strokeWidth = 2
//       ..style = PaintingStyle.fill;
//     canvas.drawLine(Offset(size.width * 0.3, size.height), Offset(size.width * 0.39, size.height * 0.88), paintline);
//     canvas.drawLine(Offset(size.width * 0.35, size.height), Offset(size.width * 0.4, size.height * 0.93), paintline);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return true;
//   }
// }

// class ForePainter extends CustomPainter {
//   final Color bottomleftPaintColor;
//   final double opacityline;
//   final bool bottomgetstartedcheck;
//   ForePainter({this.bottomleftPaintColor, this.opacityline, this.bottomgetstartedcheck});
//   @override
//   void paint(Canvas canvas, Size size) {
//     // size = Size(100, 100);
//     final sizeg = Size(size.width * 0.6, size.height * 0.8);
//     var paint = Paint()
//       ..color = ColorSets.colorPrimaryLightYellow.withOpacity(0.7)
//       ..strokeWidth = 5
//       ..style = PaintingStyle.fill;
//     var path = Path();
//     path.moveTo(sizeg.width * 0.37, 0);
//     path.quadraticBezierTo(sizeg.width * 0.3, sizeg.height * 0.25, sizeg.width * 0.08, sizeg.height * 0.07);
//     path.cubicTo(sizeg.width * 0.04, sizeg.height * 0.025, sizeg.width * 0.02, sizeg.height * 0.2, sizeg.width * 0.08,
//         sizeg.height * 0.28);
//     path.quadraticBezierTo(sizeg.width * 0.18, sizeg.height * 0.38, 0, sizeg.height * 0.58);
//     path.lineTo(0, 0);
//     canvas.drawPath(path, paint);

//     var paint2 = Paint()
//       ..color = bottomgetstartedcheck
//           ? bottomleftPaintColor
//           : bottomleftPaintColor.withOpacity(0.7) //bottomleftPaintColor // Colors.yellow.withOpacity(0.7)
//       ..strokeWidth = 5
//       ..style = PaintingStyle.fill;
// //       ..strokeCap = StrokeCap.round;
//     var path2 = Path();
//     path2.moveTo(size.width, size.height * 0.60);
//     path2.cubicTo(size.width * 0.72, size.height * 0.57, size.width * 1.22, size.height * 1.17, size.width * 0.72,
//         size.height * 0.83);
//     path2.quadraticBezierTo(size.width * 0.60, size.height * 0.70, size.width * 0.61, size.height);
//     path2.lineTo(size.width, size.height);
//     canvas.drawPath(path2, paint2);

//     // path2.moveTo(sizeb.width, sizeb.height * 0.47);
//     // path2.cubicTo(sizeb.width * 0.47, sizeb.height * 0.6, sizeb.width * 1.29, sizeb.height * 1.05, sizeb.width * 0.56,
//     //     size.height * 0.8);
//     // path2.quadraticBezierTo(sizeb.width * 0.5, sizeb.height * 0.78, sizeb.width * 0.46, sizeb.height);
//     // path2.lineTo(sizeb.width, sizeb.height);
//     // canvas.drawPath(path2, paint2);

//     var paintline = Paint()
//       ..color = bottomleftPaintColor
//       ..strokeWidth = 2
//       ..style = PaintingStyle.fill;
//     canvas.drawLine(Offset(size.width * 0.7, 0), Offset(size.width * 0.65, size.height * 0.07), paintline);
//     canvas.drawLine(Offset(size.width * 0.75, 0), Offset(size.width * 0.66, size.height * 0.12), paintline);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return true;
//   }
// }
