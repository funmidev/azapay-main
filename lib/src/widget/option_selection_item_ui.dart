import 'package:azapay/app/app.dart';
import 'package:azapay/src/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OptionSelectionItemUI extends StatelessWidget {
  final String icon;
  final String title;
  final String assetvector;
  final bool asset;
  final Function onTapped;
  final bool suffix;
  final Widget suffixicon;
  final double borderradius;
  final Color bordercolor;

  const OptionSelectionItemUI(
      {Key key,
      @required this.icon,
      @required this.title,
      this.asset = false,
      this.assetvector = '',
      this.suffix = false,
      this.suffixicon,
      this.bordercolor = ColorSets.colorGrey,
      this.borderradius = 20,
      @required this.onTapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
      child: InkWell(
        onTap: onTapped,
        child: Container(
          decoration: BoxDecoration(
            color: bordercolor.withOpacity(0.4),
            borderRadius: BorderRadius.circular(
              borderradius,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(
              4.0,
            ),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                asset
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          assetvector,
                          width: 20,
                          height: 20,
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: icon.isEmpty
                            ? Text(AppStrings.empty)
                            : SvgPicture.asset(
                                icon,
                                width: 20,
                                height: 20,
                              ),
                      ),
                Expanded(
                    child: Center(
                        child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    title,
                    style: AppTextStyles.h3style,
                    maxLines: 1,
                  ),
                ))),
                suffix ? suffixicon : EmptyWidgetUI(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
