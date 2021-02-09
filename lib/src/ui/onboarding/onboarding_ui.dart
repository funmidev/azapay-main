import 'package:azapay/app/app.dart';
import 'package:azapay/src/widget/widget.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingUI extends StatefulWidget {
  @override
  _OnBoardingUIState createState() => _OnBoardingUIState();
}

class _OnBoardingUIState extends State<OnBoardingUI> {
  final PageController _pageController = PageController();
  int page = 0;
  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        page = _pageController.page.toInt();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0.0,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Stack(
            children: [
              PageView.builder(
                  controller: _pageController,
                  itemCount: _onboardpageview().length,

                  itemBuilder: (context, position) {
                    return _onboardpageview()[position];
                  }),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FlatButton(
                      child: page == 3
                          ? Visibility(
                              child: Text(''),
                              visible: false,
                            )
                          : Text(AppStrings.onBoardingskip,style: AppTextStyles.h3style.copyWith(fontWeight: FontWeight.normal),),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, AppRouteName.onboardingmain);
                      },
                    ),
                    SmoothPageIndicator(
                      controller: _pageController,
                      count: _onboardpageview().length,
                      effect: ScrollingDotsEffect(
                        dotHeight: 10,
                        dotWidth: 10,
                        radius: 20,
                        strokeWidth: 1.5,
                        spacing: 10,
                        paintStyle: PaintingStyle.stroke,
                        dotColor: Colors.grey,
                        activeDotColor: ColorSets.colorPrimaryLightGreen
                      ),
                    ),
                    FlatButton(
                      child: Text(AppStrings.onBoardingnext,style: AppTextStyles.h3style.copyWith(fontWeight: FontWeight.normal),),
                      onPressed: () async{
                        await _pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeInCubic).then((_) {
                          if (_pageController.page.toInt()==3) {
                            Navigator.pushReplacementNamed(context, AppRouteName.onboardingmain);
                          }
                        } );
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

List<Widget> _onboardpageview() {
  return <Widget>[
    OnBoardPageViewUI(
        vector: AppVectors.onBoardOne,
        title: AppStrings.onBoardingPageonetitle,
        title_description: AppStrings.onBoardingPageonesubtitle),
    OnBoardPageViewUI(
        vector: AppVectors.onBoardTwo,
        title: AppStrings.onBoardingPagetwotitle,
        title_description: AppStrings.onBoardingPagetwosubtitle),
    OnBoardPageViewUI(
        vector: AppVectors.onBoardThree,
        title: AppStrings.onBoardingPagethreetitle,
        title_description: AppStrings.onBoardingPagethreesubtitle),
    OnBoardPageViewUI(
        vector: AppVectors.onBoardFour,
        title: AppStrings.onBoardingPagefourtitle,
        title_description: AppStrings.onBoardingPagefoursubtitle),
  ];
}
