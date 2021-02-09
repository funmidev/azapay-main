import 'package:azapay/app/app.dart';
import 'package:azapay/src/blocs/blocs.dart';
import 'package:azapay/src/widget/empty_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class DashBoardBackgroundUI extends StatefulWidget {
  final String title;
  final String subtitle;
  final Widget child;
  final bool carddisplay;
  final Widget card;
  final double height;
  final bool qrscan;

  const DashBoardBackgroundUI(
      {Key key,
      this.height = 2.0,
      @required this.title,
      @required this.subtitle,
      @required this.child,
      this.carddisplay = false,
      this.qrscan = false,
      this.card})
      : super(key: key);

  @override
  _DashBoardBackgroundUIState createState() => _DashBoardBackgroundUIState();
}

class _DashBoardBackgroundUIState extends State<DashBoardBackgroundUI> {
  DashboardBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = context.bloc<DashboardBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              widget.carddisplay ? widget.card : EmptyWidgetUI(),
              Padding(
                padding: EdgeInsets.only(
                    bottom: 5.0,
                    top: _bloc.state.position == 1 ? 15.0 : 25,
                    left: widget.qrscan ? 0.0 : _bloc.state.position == 1 ? 10.0 : 1.0),
                child: Text(widget.title,
                    style: AppTextStyles.h2style.copyWith(color: ColorSets.colorPrimaryLightYellow, fontSize: 28)),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: 5.0,
                    left: widget.qrscan ? 0.0 : _bloc.state.position == 1 ? 10.0 : 1.0,
                    bottom: _bloc.state.position == 1 ? 0 : 50),
                child: Text(
                  widget.subtitle,
                  style: AppTextStyles.h2style.copyWith(fontSize: 15, fontWeight: FontWeight.w400),
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Container(
            color: ColorSets.colorPrimaryWhite,
            child: widget.child,
          ),
        ),
      ],
    );
  }
}
