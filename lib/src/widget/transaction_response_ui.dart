import 'package:azapay/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TransactionResponseUI extends StatefulWidget {
  final IconData icon;
  final Color color;
  final Color iconcolor;
  final String responsetitle;
  final String responsemessage;
  TransactionResponseUI({this.icon, this.iconcolor, this.color, this.responsemessage, this.responsetitle});
  @override
  _TransactionResponseUIState createState() => _TransactionResponseUIState();
}

class _TransactionResponseUIState extends State<TransactionResponseUI> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;
  Animation _coloralphaanimation;
  Tween<double> _tween;
  Tween<double> _coloralphatween;
  @override
  void initState() {
    super.initState();

    _tween = Tween(
      begin: 60,
      end: 100,
    );

    _coloralphatween = Tween(
      begin: 10,
      end: 70,
    );

    _animationController = AnimationController(duration: Duration(seconds: 2), vsync: this);
    _animation = _tween.animate(_animationController);

    _coloralphaanimation = _coloralphatween.animate(_animationController);

    _animationController.forward();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   Future.delayed(Duration(seconds: 1), () async {
    //     await Navigator.pop(context);
    //   });
    // });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _animationController.addListener(() async {
        if (_animationController.isCompleted) {
          Future.delayed(Duration(milliseconds: 1500), () async {
            await Navigator.pop(context);
          });
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.width / 4, top: 50),
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, iconchild) {
                return AnimatedBuilder(
                  animation: _coloralphaanimation,
                  builder: (context, child) => CustomPaint(
                    painter: ResponsePainter(initialColor: widget.color, value: _coloralphaanimation.value.toInt()),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(120),
                      child: Icon(
                        widget.icon,
                        size: _animation.value,
                        color: widget.iconcolor,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text(
              widget.responsetitle,
              textAlign: TextAlign.center,
              style: AppTextStyles.h3style.copyWith(fontSize: 20, fontWeight: FontWeight.w400),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Center(
                child: Text(widget.responsemessage,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.h3style.copyWith(fontSize: 18, fontWeight: FontWeight.w300))),
          ),
        ],
      ),
    );
  }
}

class ResponsePainter extends CustomPainter {
  final Color initialColor;
  int value;

  ResponsePainter({this.initialColor, this.value});

  @override
  void paint(Canvas canvas, Size size) {
    for (var i = 2; i >= 0; i--) {
      var paint = Paint()
        ..color = initialColor.withAlpha(i == 0 ? 255 : value)
        ..strokeWidth = 5.0
        ..style = PaintingStyle.fill
        ..strokeCap = StrokeCap.round;
      canvas.drawCircle(Offset(size.width / 2, size.height / 2),
          i == 0 ? 80 : i == 1 ? 80 + i.toDouble() * 20 : 100 + i.toDouble() * 10, paint);
    }

    // var path = Path()
    // ..lineTo(size.width/2, size.height/2)

    // canvas.drawImage(, offset, paint)
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
