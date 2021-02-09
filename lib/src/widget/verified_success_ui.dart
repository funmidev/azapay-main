import 'package:azapay/app/app.dart';
import 'package:azapay/src/models/models.dart';
import 'package:azapay/src/widget/widget.dart';
import 'package:flare_flutter/flare.dart';
import 'package:flare_dart/math/mat2d.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VerifiedSuccessUI extends StatefulWidget {
  final VerifiedSuccessResponse verifiedSuccessResponse;

  const VerifiedSuccessUI({Key key, @required this.verifiedSuccessResponse}) : super(key: key);

  @override
  _VerifiedSuccessUIState createState() => _VerifiedSuccessUIState();
}

class _VerifiedSuccessUIState extends State<VerifiedSuccessUI> with SingleTickerProviderStateMixin, FlareController {
  // AnimationController _animationController;
  // Animation _animation;
  Tween<double> _tween;

  final double _rockAmount = 0.3;
  final double _speed = 0.3;
  double _rockTime = 0.0;

  ActorAnimation _rock;

  @override
  void initState() {
    super.initState();

    // _tween = Tween(
    //   begin: 0,
    //   end: 10,
    // );
    // _animationController = AnimationController(duration: Duration(seconds: 3), vsync: this);
    // _animation = _tween.animate(_animationController);

    // _animationController.forward();

    WidgetsBinding.instance.addPostFrameCallback(widget.verifiedSuccessResponse.widgetbinding);
  }

  @override
  void dispose() {
    super.dispose();
    // _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              widget.verifiedSuccessResponse.flare
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
                      child: Container(
                        width: 200,
                        height: 200,
                        // color: ColorSets.colorGrey,
                        child: FlareActor(widget.verifiedSuccessResponse.vector,
                            isPaused: false,
                            animation: widget.verifiedSuccessResponse.flareanimation,
                            artboard: widget.verifiedSuccessResponse.flareartboard,
                            alignment: Alignment.center,
                            controller: this,
                            fit: BoxFit.contain),
                      ),
                    )
                  : SvgPicture.asset(widget.verifiedSuccessResponse.vector),
              // SizedBox(
              //   height: 30,
              // ),
              // AnimatedBuilder(
              //   animation: _animation,
              //   builder: (context, snapshot) => Align(
              //     alignment: Alignment.center,
              //     child: Padding(
              //       padding: EdgeInsets.all(_animation.value),
              //       child: Text(
              //         widget.verifiedSuccessResponse.title,
              //         style: widget.verifiedSuccessResponse.titletextsyle,
              //         textAlign: TextAlign.center,
              //       ),
              //     ),
              //   ),
              // ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    widget.verifiedSuccessResponse.title,
                    style: widget.verifiedSuccessResponse.titletextsyle,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Visibility(
                visible: widget.verifiedSuccessResponse.subtitlevisibility,
                child: Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      widget.verifiedSuccessResponse.subtitle,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.h3style.copyWith(fontSize: 14),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Visibility(
                visible: widget.verifiedSuccessResponse.buttonvisibility,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 10),
                  child: ButtonArrow(
                    buttontitleColor: widget.verifiedSuccessResponse.buttontitleColor,
                    navigatorfunc: widget.verifiedSuccessResponse.onPressedbutton,
                    buttontitle: widget.verifiedSuccessResponse.buttontitle,
                    arrow: false,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool advance(FlutterActorArtboard artboard, double elapsed) {
    // _rockTime += elapsed * _speed;
    // _rock.apply(_rockTime % _rock.duration, artboard, _rockAmount);
    return true;
  }

  @override
  void initialize(FlutterActorArtboard artboard) {
    // _rock = artboard.getAnimation(widget.verifiedSuccessResponse.flareanimation);
  }

  @override
  void setViewTransform(Mat2D viewTransform) {}
}
