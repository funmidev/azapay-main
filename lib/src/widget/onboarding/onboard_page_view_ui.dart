import 'package:azapay/app/app.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardPageViewUI extends StatelessWidget {
  final String vector;
  final String title;
  final String image;
  final bool isImage;
  final String title_description;

  const OnBoardPageViewUI(
      {Key key, this.vector, this.isImage = false, this.image, @required this.title, @required this.title_description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment:  MainAxisAlignment.center,
      children: [
        isImage
            ? Image.asset(
                image,
                width: MediaQuery.of(context).size.width / 2.5, //300,
                height: MediaQuery.of(context).size.height / 2.5, //300,
              )
            : SvgPicture.asset(vector),
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(title, style: AppTextStyles.h2style),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title_description,
            style: AppTextStyles.h3style.copyWith(fontWeight: FontWeight.normal),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
