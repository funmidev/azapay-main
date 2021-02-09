import 'package:azapay/app/app.dart';
import 'package:azapay/src/blocs/blocs.dart';
import 'package:azapay/src/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_freshchat/flutter_freshchat.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HelpSupportUI extends StatefulWidget {
  @override
  _HelpSupportUIState createState() => _HelpSupportUIState();
}

class _HelpSupportUIState extends State<HelpSupportUI> {
  ProfileBloc _profileBloc;
  @override
  void initState() {
    super.initState();
    _profileBloc = context.bloc<ProfileBloc>();
    _profileBloc.add(HelpandSupport());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          AppStrings.helpandSupport,
          style: AppTextStyles.h3style.copyWith(fontWeight: FontWeight.w600, fontSize: 20),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: ListView(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    Center(
                      child: Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          color: ColorSets.colorPrimaryLightYellowDashBoard,
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Center(
                            child: Container(
                              height: 170,
                              width: 170,
                              decoration: BoxDecoration(
                                color: ColorSets.colorPrimaryLightYellow,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: SvgPicture.asset(
                                  AppVectors.helpandsupport,
                                  width: 100,
                                  height: 100,
                                  alignment: Alignment.center,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'How can we assist you, \n #${state is ProfileLoaded ? state.signUp.data?.tag : '-----'} ?',
                      style: AppTextStyles.h3style.copyWith(fontSize: 18, fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                  );
                },
              ),
              BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width / 4),
                    child: InkWell(
                      onTap: (state as ProfileLoaded).helpandsupportRestoreId.isEmpty
                          ? null
                          : () async {
                              // await FlutterFreshchat.identifyUser(
                              //   externalID: (state as ProfileLoaded).signUp.data?.tag,
                              //   restoreID: (state as ProfileLoaded).helpandsupportRestoreId,
                              // );
                              // await FlutterFreshchat.showConversations(tags: const [], title: 'Azapay Support');
                            },
                      child: (state as ProfileLoaded).helpandsupportRestoreId.isEmpty
                          ? Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(40),
                                child: CircularProgressIndicator(
                                  strokeWidth: 10,
                                  backgroundColor: ColorSets.colorPrimaryWhite,
                                  valueColor: AlwaysStoppedAnimation<Color>(Color(0XFFFFB300)),
                                ),
                              ),
                            )
                          : Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: ColorSets.colorPin,
                                borderRadius: BorderRadius.all(Radius.circular(15)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.forum,
                                      color: ColorSets.colorPrimaryLightYellow,
                                    ),
                                    Text(
                                      AppStrings.helpandSupportChat,
                                      style: AppTextStyles.h3style.copyWith(fontSize: 12),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                    ),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 15),
                child: Text(
                  AppStrings.faq,
                  textAlign: TextAlign.start,
                  style: AppTextStyles.h3style.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                  onTap: () async {
                    await showModalBottomSheet(
                      context: context,
                      enableDrag: true,
                      isDismissible: true,
                      useRootNavigator: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                      ),
                      builder: (context) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: CustomDivider(),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    AppStrings.faqonedetails,
                                    style: AppTextStyles.h2style.copyWith(
                                      fontWeight: FontWeight.w400,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            )
                          ],
                        );
                      },
                    );
                    // await FlutterFreshchat.showFAQs(showFaqCategoriesAsGrid: false);
                  },
                  child: Card(
                    elevation: 2.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: ColorSets.helpandSupportColor,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
                          child: Text(
                            // AppStrings.faq,
                            AppStrings.faqone,
                            textAlign: TextAlign.center,
                            style: AppTextStyles.h3style.copyWith(color: ColorSets.colorPrimaryWhite),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      enableDrag: true,
                      isDismissible: true,
                      useRootNavigator: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                      ),
                      builder: (context) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: CustomDivider(),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    AppStrings.faqtwodetails,
                                    style: AppTextStyles.h2style.copyWith(
                                      fontWeight: FontWeight.w400,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            )
                          ],
                        );
                      },
                    );
                  },
                  child: Card(
                    elevation: 2.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: ColorSets.helpandSupportColor,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
                          child: Text(
                            AppStrings.faqtwo,
                            textAlign: TextAlign.start,
                            style: AppTextStyles.h3style.copyWith(color: ColorSets.colorPrimaryWhite),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      enableDrag: true,
                      isDismissible: true,
                      useRootNavigator: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                      ),
                      builder: (context) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: CustomDivider(),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    AppStrings.faqthreedetails,
                                    style: AppTextStyles.h2style.copyWith(
                                      fontWeight: FontWeight.w400,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            )
                          ],
                        );
                      },
                    );
                  },
                  child: Card(
                    elevation: 2.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: ColorSets.helpandSupportColor,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
                          child: Text(
                            AppStrings.faqthree,
                            textAlign: TextAlign.start,
                            style: AppTextStyles.h3style.copyWith(color: ColorSets.colorPrimaryWhite),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(10.0),
              //   child: InkWell(
              //     onTap: () {

              //     },
              //     child: Card(
              //       elevation: 2.0,
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(10),
              //       ),
              //       color: ColorSets.helpandSupportColor,
              //       child: Row(
              //         children: [
              //           Padding(
              //             padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
              //             child: Text(
              //               AppStrings.faqfour,
              //               textAlign: TextAlign.start,
              //               style: AppTextStyles.h3style.copyWith(color: ColorSets.colorPrimaryWhite),
              //             ),
              //           )
              //         ],
              //       ),
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
