import 'package:azapay/app/app.dart';
import 'package:azapay/src/blocs/blocs.dart';
import 'package:azapay/src/widget/button_arrow_ui.dart';
import 'package:azapay/src/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TierUI extends StatefulWidget {
  @override
  _TierUIState createState() => _TierUIState();
}

class _TierUIState extends State<TierUI> {
  @override
  void initState() {
    super.initState();
    context.bloc<TierBloc>().add(CheckConfidentalItem());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: Text(AppStrings.tierinfoTitle,
            style: AppTextStyles.h3style.copyWith(fontWeight: FontWeight.w600, fontSize: 20)),
      ),
      body: BlocBuilder<TierBloc, TierState>(
        builder: (context, state) {
          if (state is TierLoaded) {
            return SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      // shrinkWrap: true,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30.0),
                          child: TierItem(
                              plan: AppStrings.tierinfooneTitle,
                              assetName: AppVectors.tierone,
                              limitamount: AppStrings.tierinfooneLimit,
                              maxamount: AppStrings.tierinfooneMax,
                              button: false),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30.0),
                          child: TierItem(
                            plan: AppStrings.tierinfotwoTitle,
                            assetName: AppVectors.tiertwo,
                            limitamount: AppStrings.tierinfotwoLimit,
                            maxamount: AppStrings.tierinfotwoMax,
                            button: state.bvnstatus == 200 ? false : true,
                            onTapped: () {
                              Navigator.pushNamed(context, AppRouteName.useraccountinfoprofile, arguments: 3);
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30.0),
                          child: TierItem(
                            plan: AppStrings.tierinfothreeTitle,
                            assetName: AppVectors.tierthree,
                            limitamount: AppStrings.tierinfothreeLimit,
                            maxamount: AppStrings.tierinfothreeMax,
                            button: state.docstatus == 200 ? false : true,
                            onTapped: () {
                              Navigator.pushNamed(context, AppRouteName.useraccountinfoprofile, arguments: 2);
                            },
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          } else if (state is TierError) {
            return Center(
              child: Column(
                children: [
                  Expanded(child: SvgPicture.asset(AppVectors.offline)),
                  Expanded(child: Text(AppStrings.extractdeviceinfoContent))
                ],
              ),
            );
          } else {
            return LoadingUI(
              function: (_) {},
              showtext: true,
            );
          }
        },
      ),
    );
  }
}

class TierItem extends StatelessWidget {
  final String plan;
  final String assetName;
  final String limit;
  final String limitamount;
  final String max;
  final String maxamount;
  final bool button;
  final Function onTapped;

  const TierItem(
      {Key key,
      @required this.plan,
      @required this.assetName,
      this.limit = AppStrings.tierinfoLimit,
      @required this.limitamount,
      @required this.maxamount,
      this.max = AppStrings.tierinfoMax,
      this.button = true,
      this.onTapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30.0), color: ColorSets.colorPin),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SvgPicture.asset(assetName),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Text(
                      plan,
                      style: AppTextStyles.h3style.copyWith(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                      child: Text(
                    limit,
                    style: AppTextStyles.h3style,
                    textAlign: TextAlign.start,
                  )),
                  Expanded(
                      child: Text(
                    limitamount,
                    style: AppTextStyles.h3style,
                    textAlign: TextAlign.end,
                  )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                      child: Text(
                    max,
                    style: AppTextStyles.h3style,
                    textAlign: TextAlign.start,
                  )),
                  Expanded(
                      child: Text(
                    maxamount,
                    style: AppTextStyles.h3style,
                    textAlign: TextAlign.end,
                  )),
                ],
              ),
            ),
            button
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 10),
                    child: ButtonArrow(
                        navigatorfunc: onTapped,
                        buttontitle: AppStrings.upgrade,
                        arrow: false,
                        buttontitleColor: ColorSets.colorPrimaryBlack),
                  )
                : Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: EmptyWidgetUI(),
                  )
          ],
        ),
      ),
    );
  }
}
