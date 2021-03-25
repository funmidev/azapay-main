import 'package:azapay/app/app.dart';
import 'package:azapay/src/models/models.dart';
import 'package:azapay/src/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BankUI extends StatefulWidget {
  @override
  _BankUIState createState() => _BankUIState();
}

class _BankUIState extends State<BankUI> {
  bool _dialVisible = true;

  void setDialVisible(bool value) {
    setState(() {
      _dialVisible = value;
    });
  }

  SpeedDial _dial() {
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: IconThemeData(size: 24.0),
      visible: _dialVisible,
      shape: CircleBorder(),
      curve: Curves.bounceInOut,
      overlayColor: Colors.black54,
      overlayOpacity: 0.5,
      onOpen: () => print('OPENING DIAL'),
      onClose: () => print('DIAL CLOSED'),
      tooltip: 'Speed Dial',
      heroTag: 'speed-dial-hero-tag',
      backgroundColor: Colors.amber,
      foregroundColor: Colors.white,
      elevation: 10.0,
      icon: Icons.add,
      marginEnd: 18,
      marginBottom: 30,
      gradientBoxShape: BoxShape.circle,
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Colors.amber, Colors.amberAccent],
      ),
      children: [
        // SizedBox(),
        // SpeedDialChild(
        //     elevation: 0.0,
        //     backgroundColor: Colors.transparent,
        //     child: SizedBox(
        //       height: 5,
        //     )),

        SpeedDialChild(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          labelBackgroundColor: Colors.black12,
          child:
              SvgPicture.asset(AppVectors.paybill, semanticsLabel: 'Pay Bill'),
          shape: RoundedRectangleBorder(),
          labelWidget: Container(
            child: Text(
              'Pay Bill',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ),
          onTap: () {
            print('FIRST CHILD');
            Navigator.pushNamed(context, AppRouteName.paybills);
          },
        ),
        // SpeedDialChild(
        //   elevation: 0.0,
        //   backgroundColor: Colors.transparent,
        // ),
        SpeedDialChild(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          labelBackgroundColor: Colors.black12,
          child:
              SvgPicture.asset(AppVectors.buydata, semanticsLabel: 'Buy Data'),
          shape: RoundedRectangleBorder(),
          labelWidget: Container(
            child: Text(
              'Buy Data',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ),
          onTap: () {
            print('SECOND CHILD');
            Navigator.pushNamed(context, AppRouteName.paybills);
          },
        ),
        // SpeedDialChild(
        //   elevation: 0.0,
        //   backgroundColor: Colors.transparent,
        // ),

        SpeedDialChild(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          labelBackgroundColor: Colors.black12,
          child: SvgPicture.asset(
            AppVectors.buyairtime,
          ),

          shape: RoundedRectangleBorder(),
          // label: 'Buy Airtime',
          // labelStyle: TextStyle(color: Colors.white),
          labelWidget: Container(
            child: Text(
              'Buy Airtime',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ),
          onTap: () {
            print('THIRD CHILD');
            Navigator.pushNamed(
              context,
              AppRouteName.paybillservices,
              arguments: PayBillsName(
                screen: 1,
              ),
            );
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DashBoardBackgroundUI(
        title: AppStrings.bankOne,
        subtitle: AppStrings.bankTwo,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BankItem(
                onTapped: () {
                  Navigator.pushNamed(context, AppRouteName.linkbank);
                },
                assetName: AppVectors.linkbank,
                textStyle:
                    AppTextStyles.h3style.copyWith(fontWeight: FontWeight.bold),
                title: AppStrings.bankThreeI,
              ),
              SizedBox(
                height: 8,
              ),
              BankItem(
                  onTapped: () {
                    Navigator.pushNamed(context, AppRouteName.bankmaketransfer);
                  },
                  assetName: AppVectors.maketransfer,
                  textStyle: AppTextStyles.h3style
                      .copyWith(fontWeight: FontWeight.bold),
                  title: AppStrings.bankThreeII),

              SizedBox(
                height: 8,
              ),
              BankItem(
                onTapped: () {
                  Navigator.pushNamed(context, AppRouteName.cardlessWithdrawal);
                },
                assetName: AppVectors.completewithdrawal,
                title: AppStrings.bankThreeIII,
                textStyle:
                    AppTextStyles.h3style.copyWith(fontWeight: FontWeight.bold),
              ),
              // Spacer(),
              // // // Row(
              // // //   children: [
              // // //     floatingActionButton: _dial();
              // // //   ],
              // // )
            ],
          ),
        ),
      ),
      floatingActionButton: _dial(),
    );
  }
}

class BankItem extends StatelessWidget {
  final Function onTapped;
  final String assetName;
  final String title;
  final String subtitle;
  final bool visiblesubtitle;
  final TextStyle textStyle;

  const BankItem(
      {Key key,
      @required this.onTapped,
      @required this.assetName,
      @required this.title,
      @required this.textStyle,
      this.subtitle = '',
      this.visiblesubtitle = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: onTapped,
        child: Row(
          children: [
            SvgPicture.asset(
              assetName,
              // width: MediaQuery.of(context).size.height >= 820 ? 15 : 50,
              // height: MediaQuery.of(context).size.height >= 820 ? 15 : 40,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: textStyle),
                  visiblesubtitle
                      ? Text(
                          subtitle,
                          textAlign: TextAlign.left,
                          style: AppTextStyles.h3style.copyWith(
                              color: ColorSets.colorPrimaryLightYellow,
                              fontSize: 10),
                        )
                      : EmptyWidgetUI()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// class FloatButt extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return FloatingActionButton(
//
//     );
//   }
// }
