import 'package:azapay/app/app.dart';
import 'package:azapay/src/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingWelcomeUIWeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AuthBackgroundUI(
      opacityline: 0.0,
      bottomgetstartedcheck: true,
      bottomleftPaintColor: ColorSets.colorPrimaryWhite,
      dotandlineColor: Colors.transparent,
      child: LayoutBuilder(
        builder: (context, constraint) {
          if (constraint.maxWidth >= AppBreakPoint.largeTablet) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(child: LeftOnBoardingUIWeb()),
                Expanded(child: RightOnBoardingUIWeb()),
              ],
            );
          } else {
            return ListView(
              shrinkWrap: true,
              children: [
                LeftOnBoardingUIWeb(),
                RightOnBoardingUIWeb(),
              ],
            );
          }
        },
      ),
    );
  }
}

class RightOnBoardingUIWeb extends StatefulWidget {
  const RightOnBoardingUIWeb({
    Key key,
  }) : super(key: key);

  @override
  _RightOnBoardingUIWebState createState() => _RightOnBoardingUIWebState();
}

class _RightOnBoardingUIWebState extends State<RightOnBoardingUIWeb> {
  final PageController _pageController = PageController();
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => _animateSlider());
  }

  void _animateSlider() {
    Future.delayed(Duration(seconds: 2)).then((_) {
      var nextPage = _pageController.page.round() + 1;

      if (nextPage == _onboardpageview().length) {
        nextPage = 0;
      }

      _pageController
          .animateToPage(nextPage, duration: Duration(seconds: 1), curve: Curves.linear)
          .then((_) => _animateSlider());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ColorSets.colorPrimaryLightYellow,
      elevation: 0.0,
      child: Stack(
        children: [
          PageView.builder(
              controller: _pageController,
              itemCount: _onboardpageview().length,
              itemBuilder: (context, position) {
                return Padding(
                  padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height / 5),
                  child: _onboardpageview()[position],
                );
              }),
          Positioned(
            bottom: MediaQuery.of(context).size.height / 4,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SmoothPageIndicator(
                  controller: _pageController,
                  count: _onboardpageview().length,
                  effect: WormEffect(
                      dotHeight: 10,
                      dotWidth: 10,
                      radius: 20,
                      strokeWidth: 1.5,
                      spacing: 15,
                      paintStyle: PaintingStyle.fill,
                      dotColor: Colors.grey,
                      activeDotColor: ColorSets.colorPrimaryWhite),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  List<Widget> _onboardpageview() {
    return <Widget>[
      OnBoardPageViewUI(
          image: AppImages.onBoardWebOne,
          isImage: true,
          title: AppStrings.onBoardingPageonetitle,
          title_description: AppStrings.onBoardingPageonesubtitle),
      OnBoardPageViewUI(
          image: AppImages.onBoardWebTwo,
          isImage: true,
          title: AppStrings.onBoardingPagetwotitle,
          title_description: AppStrings.onBoardingPagetwosubtitle),
      OnBoardPageViewUI(
          image: AppImages.onBoardWebThree,
          isImage: true,
          title: AppStrings.onBoardingPagethreetitle,
          title_description: AppStrings.onBoardingPagethreesubtitle),
      OnBoardPageViewUI(
          image: AppImages.onBoardWebFour,
          isImage: true,
          title: AppStrings.onBoardingPagefourtitle,
          title_description: AppStrings.onBoardingPagefoursubtitle),
    ];
  }
}

class LeftOnBoardingUIWeb extends StatelessWidget {
  const LeftOnBoardingUIWeb({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          AppImages.azaPayLogo,
          scale: MediaQuery.of(context).size.aspectRatio.toDouble() * 5,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            AppStrings.onBoardingOneWeb,
            style: AppTextStyles.h3style.copyWith(
              fontSize: MediaQuery.of(context).size.aspectRatio.toDouble() * 23,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width / 6.8, vertical: 30),
          child: Row(
            children: [
              Expanded(
                child: BorderButtonUI(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRouteName.getstartedWeb);
                  },
                  title: AppStrings.onBoardingthree,
                ),
              ),
            ],
          ),
        ),
        Text(
          AppStrings.onBoardingWebStoreDetails,
          textAlign: TextAlign.center,
          style: AppTextStyles.h3style.copyWith(fontSize: 12),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {},
                child: Image.asset(
                  AppImages.appStore,
                  scale: MediaQuery.of(context).size.aspectRatio.toDouble(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {},
                child: Image.asset(
                  AppImages.playStore,
                  scale: MediaQuery.of(context).size.aspectRatio.toDouble() - 0.2,
                ),
              ),
            )
          ],
        ),
        Text(
          AppStrings.onBoardingWebSummary,
          textAlign: TextAlign.center,
          style: AppTextStyles.h3style.copyWith(fontSize: 12),
        ),
      ],
    );
  }
}
