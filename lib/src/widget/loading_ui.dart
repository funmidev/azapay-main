import 'package:azapay/app/app.dart';
import 'package:azapay/src/blocs/blocs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingUI extends StatefulWidget {
  final bool showtext;
  final Function function;

  const LoadingUI({Key key, this.function, this.showtext = false}) : super(key: key);

  @override
  _LoadingUIState createState() => _LoadingUIState();
}

class _LoadingUIState extends State<LoadingUI> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(widget.function);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ColorSets.colorPrimaryWhite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: CircularProgressIndicator(
                strokeWidth: 10,
                backgroundColor: ColorSets.colorPrimaryWhite,
                valueColor: AlwaysStoppedAnimation<Color>(Color(0XFFFFB300)),
              ),
            ),
          ),
          widget.showtext
              ? Center(
                  child: Text(
                    AppStrings.loading,
                    style: AppTextStyles.h2style,
                    textAlign: TextAlign.center,
                  ),
                )
              : Center(child: Text(AppStrings.empty)),
        ],
      ),
    );
  }
}
