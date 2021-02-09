import 'package:azapay/src/blocs/blocs.dart';
import 'package:azapay/src/ui/ui.dart';
import 'package:azapay/src/widget/widget.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:azapay/app/app.dart';

import 'package:azapay/src/models/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:money2/money2.dart';
import 'package:universal_platform/universal_platform.dart';

class NairaBoardUI extends StatefulWidget {
  const NairaBoardUI({
    Key key,
  }) : super(key: key);

  @override
  _NairaBoardUIState createState() => _NairaBoardUIState();
}

class _NairaBoardUIState extends State<NairaBoardUI> {
  DashboardBloc _bloc;
  QrscanBloc _qrbloc;

  @override
  void initState() {
    super.initState();
    _qrbloc = context.bloc<QrscanBloc>();
    _bloc = BlocProvider.of<DashboardBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorSets.colorPrimaryLightYellowDashBoard,
      child: Padding(
        padding: EdgeInsets.only(top: 0),
        // UniversalPlatform.isIOS
        //     ? MediaQuery.of(context).size.height * 0.03
        //     : MediaQuery.of(context).size.height * 0.008),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 0,
              child: Padding(
                padding: EdgeInsets.all(UniversalPlatform.isIOS ? 15 : 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    BlocBuilder<DashboardBloc, DashboardState>(
                      builder: (context, state) => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppStrings.nairaUnicode,
                            style: AppTextStyles.h3style.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 25,
                              color: ColorSets.colorPrimaryWhite,
                            ),
                          ),
                          Flexible(
                            child: FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 6.0),
                                child: Text(
                                  state.amount.isNotEmpty
                                      ? Money.fromBigInt(BigInt.parse(state.amount ?? 0), Currency.create('USD', 2))
                                          .format('#,###.##')
                                      : '0.0',
                                  // .replaceAllMapped(
                                  //     RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (match) => '${match[1]},'),
                                  style: AppTextStyles.h2style.copyWith(
                                    fontSize: AppBreakPoint.mediumscreen(context) ? 50 : 40,
                                    color: ColorSets.colorPrimaryWhite,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    //   child: Divider(
                    //     color: ColorSets.colorPrimaryWhite,
                    //     thickness: 1,
                    //   ),
                    // )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 0,
              child: Table(
                children: [
                  TableRow(
                    children: ['1', '2', '3']
                        .map<Widget>(
                          (char) => NumberPad(
                            number: char,
                            onPressed: () {
                              //add one into the stack

                              _bloc.add(InputAmount(amount: char));
                            },
                          ),
                        )
                        .toList(),
                  ),
                  TableRow(
                    children: ['4', '5', '6']
                        .map<Widget>(
                          (char) => NumberPad(
                            number: char,
                            onPressed: () {
                              //add one into the stack
                              _bloc.add(InputAmount(amount: char));
                            },
                          ),
                        )
                        .toList(),
                  ),
                  TableRow(
                    children: ['7', '8', '9']
                        .map<Widget>(
                          (char) => NumberPad(
                            number: char,
                            onPressed: () {
                              _bloc.add(InputAmount(amount: char));
                            },
                          ),
                        )
                        .toList(),
                  ),
                  TableRow(
                    children: [
                      BlocBuilder<DashboardBloc, DashboardState>(
                        builder: (context, state) => NumberPad(
                            number: '',
                            onPressed: state.amount.isNotEmpty
                                ? double.parse(state.amount) >= 100 || double.parse(state.amount).toString().length <= 8
                                    ? () async {
                                        await _qrbloc.add(
                                          QrScanAmount(
                                            amount: double.parse(
                                              Money.fromBigInt(
                                                BigInt.parse(_bloc.state.amount) ?? 0,
                                                Currency.create(
                                                  'USD',
                                                  2,
                                                ),
                                              ).format('####.##'),
                                            ),
                                            screen: 0,
                                          ),
                                        );
                                        await Navigator.push(
                                          context,
                                          PageRouteBuilder(
                                              pageBuilder: (context, animation, secondaryAnimation) {
                                                return QrCodeScanCameraUI();
                                              },
                                              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                                var begin = Offset(0.0, 1.0);
                                                var end = Offset.zero;
                                                Curve curve = Curves.ease;
                                                var tween =
                                                    Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

                                                return SlideTransition(position: animation.drive(tween), child: child);
                                              },
                                              fullscreenDialog: true),
                                        );
                                        // Navigator.pushNamed(context, AppRouteName.qrcode,
                                        //     arguments: QrScan(amount: _bloc.state.amount, whichscreen: 0));
                                      }
                                    : () async {
                                        await showGeneralDialog(
                                            context: context,
                                            pageBuilder: (context, _, __) {
                                              return CustomDialogUI(
                                                  icontitle: false,
                                                  titleheader: AppStrings.errorTitle,
                                                  subtitle: AppStrings.errorAmountInput,
                                                  twobutton: false,
                                                  discardtitle: null,
                                                  discardtitleColor: null,
                                                  discardColor: null,
                                                  acceptedbutton: null,
                                                  acceptedtitle: null,
                                                  acceptedtitleColor: null,
                                                  acceptedColor: null,
                                                  centerbutton: () async {
                                                    await Navigator.of(context, rootNavigator: true).pop();
                                                  },
                                                  centertitle: 'Dismiss',
                                                  centerColor: ColorSets.colorPrimaryRed,
                                                  centertitleColor: ColorSets.colorPrimaryWhite);
                                            },
                                            barrierDismissible: true,
                                            useRootNavigator: true,
                                            barrierLabel: '',
                                            barrierColor: Colors.black.withOpacity(0.8),
                                            transitionDuration: Duration(milliseconds: 300),
                                            transitionBuilder: (context, animation, __, child) {
                                              return SlideTransition(
                                                position:
                                                    Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(animation),
                                                child: child,
                                              );
                                            });
                                      }
                                : () async {
                                    await showGeneralDialog(
                                        context: context,
                                        pageBuilder: (context, _, __) {
                                          return CustomDialogUI(
                                              icontitle: false,
                                              titleheader: AppStrings.emptyInput,
                                              subtitle: AppStrings.errorAmountInput,
                                              twobutton: false,
                                              discardtitle: null,
                                              discardtitleColor: null,
                                              discardColor: null,
                                              acceptedbutton: null,
                                              acceptedtitle: null,
                                              acceptedtitleColor: null,
                                              acceptedColor: null,
                                              centerbutton: () async {
                                                await Navigator.of(context, rootNavigator: true).pop();
                                              },
                                              centertitle: 'Dismiss',
                                              centerColor: ColorSets.colorPrimaryRed,
                                              centertitleColor: ColorSets.colorPrimaryWhite);
                                        },
                                        barrierDismissible: true,
                                        barrierLabel: '',
                                        useRootNavigator: true,
                                        barrierColor: Colors.black.withOpacity(0.8),
                                        transitionDuration: Duration(milliseconds: 300),
                                        transitionBuilder: (context, animation, __, child) {
                                          return SlideTransition(
                                            position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(animation),
                                            child: child,
                                          );
                                        });
                                  },
                            asset: AppVectors.qrcodescan,
                            shape: true),
                      ),
                      NumberPad(
                        number: '0',
                        onPressed: () {
                          _bloc.add(InputAmount(amount: '0'));
                        },
                      ),
                      BlocBuilder<DashboardBloc, DashboardState>(
                        builder: (context, state) {
                          return NumberPad(
                            number: '',
                            onPressed: () {
                              if (state.amount.isNotEmpty) {
                                _bloc.add(DeleteAmount());
                              }
                            },
                            asset: AppVectors.backspace,
                            shape: true,
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 0,
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height >= 820 ? 23 : 23,
                    top: MediaQuery.of(context).size.height >= 820 ? 10 : 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 35,
                      child: BlocBuilder<DashboardBloc, DashboardState>(
                        builder: (context, state) => FloatingActionButton.extended(
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          heroTag: 'request',
                          elevation: 0,
                          backgroundColor: ColorSets.colorPrimaryWhite,
                          onPressed: state.amount.isNotEmpty
                              ? double.parse(state.amount) >= 100 || double.parse(state.amount).toString().length <= 8
                                  ? () {
                                      final amount = Money.fromBigInt(
                                              BigInt.parse(_bloc.state.amount ?? 0), Currency.create('USD', 2))
                                          .format('####.##')
                                          .toString();
                                      Navigator.pushNamed(context, AppRouteName.sendandrequest,
                                          arguments: SendAndRequest(amount: double.parse(amount), whichoption: false));
                                    }
                                  : () async {
                                      await showGeneralDialog(
                                          context: context,
                                          useRootNavigator: true,
                                          pageBuilder: (context, _, __) {
                                            return CustomDialogUI(
                                                icontitle: false,
                                                titleheader: AppStrings.errorTitle,
                                                subtitle: AppStrings.errorAmountInput,
                                                twobutton: false,
                                                discardtitle: null,
                                                discardtitleColor: null,
                                                discardColor: null,
                                                acceptedbutton: null,
                                                acceptedtitle: null,
                                                acceptedtitleColor: null,
                                                acceptedColor: null,
                                                centerbutton: () async {
                                                  await Navigator.of(context, rootNavigator: true).pop();
                                                },
                                                centertitle: 'Dismiss',
                                                centerColor: ColorSets.colorPrimaryRed,
                                                centertitleColor: ColorSets.colorPrimaryWhite);
                                          },
                                          barrierDismissible: true,
                                          barrierLabel: '',
                                          barrierColor: Colors.black.withOpacity(0.8),
                                          transitionDuration: Duration(milliseconds: 300),
                                          transitionBuilder: (context, animation, __, child) {
                                            return SlideTransition(
                                              position:
                                                  Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(animation),
                                              child: child,
                                            );
                                          });
                                    }
                              : () async {
                                  await showGeneralDialog(
                                      context: context,
                                      useRootNavigator: true,
                                      pageBuilder: (context, _, __) {
                                        return CustomDialogUI(
                                            icontitle: false,
                                            titleheader: AppStrings.emptyInput,
                                            subtitle: AppStrings.errorAmountInput,
                                            twobutton: false,
                                            discardtitle: null,
                                            discardtitleColor: null,
                                            discardColor: null,
                                            acceptedbutton: null,
                                            acceptedtitle: null,
                                            acceptedtitleColor: null,
                                            acceptedColor: null,
                                            centerbutton: () async {
                                              await Navigator.of(context, rootNavigator: true).pop();
                                            },
                                            centertitle: 'Dismiss',
                                            centerColor: ColorSets.colorPrimaryRed,
                                            centertitleColor: ColorSets.colorPrimaryWhite);
                                      },
                                      barrierDismissible: true,
                                      barrierLabel: '',
                                      barrierColor: Colors.black.withOpacity(0.8),
                                      transitionDuration: Duration(milliseconds: 300),
                                      transitionBuilder: (context, animation, __, child) {
                                        return SlideTransition(
                                          position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(animation),
                                          child: child,
                                        );
                                      });
                                },
                          label: Padding(
                              padding: EdgeInsets.symmetric(horizontal: AppBreakPoint.mediumscreen(context) ? 20 : 5),
                              child: Text(
                                'REQUEST',
                                style: AppTextStyles.h3style.copyWith(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: ColorSets.colorPrimaryLightYellowDashBoard,
                                ),
                              )),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 35,
                      child: BlocBuilder<DashboardBloc, DashboardState>(
                        builder: (context, state) => FloatingActionButton.extended(
                          heroTag: 'send',
                          elevation: 0,
                          backgroundColor: ColorSets.colorPrimaryWhite,
                          onPressed: state.amount.isNotEmpty
                              ? double.parse(state.amount) >= 100
                                  ? () {
                                      final amount = Money.fromBigInt(
                                              BigInt.parse(_bloc.state.amount ?? 0), Currency.create('USD', 2))
                                          .format('####.##')
                                          .toString();
                                      Navigator.pushNamed(context, AppRouteName.sendandrequest,
                                          arguments: SendAndRequest(amount: double.parse(amount), whichoption: true));
                                    }
                                  : () async {
                                      await showGeneralDialog(
                                          context: context,
                                          useRootNavigator: true,
                                          pageBuilder: (context, _, __) {
                                            return CustomDialogUI(
                                                icontitle: false,
                                                titleheader: AppStrings.errorTitle,
                                                subtitle: AppStrings.errorAmountInput,
                                                twobutton: false,
                                                discardtitle: null,
                                                discardtitleColor: null,
                                                discardColor: null,
                                                acceptedbutton: null,
                                                acceptedtitle: null,
                                                acceptedtitleColor: null,
                                                acceptedColor: null,
                                                centerbutton: () async {
                                                  await Navigator.of(context, rootNavigator: true).pop();
                                                },
                                                centertitle: 'Dismiss',
                                                centerColor: ColorSets.colorPrimaryRed,
                                                centertitleColor: ColorSets.colorPrimaryWhite);
                                          },
                                          barrierDismissible: true,
                                          barrierLabel: '',
                                          barrierColor: Colors.black.withOpacity(0.8),
                                          transitionDuration: Duration(milliseconds: 300),
                                          transitionBuilder: (context, animation, __, child) {
                                            return SlideTransition(
                                              position:
                                                  Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(animation),
                                              child: child,
                                            );
                                          });
                                    }
                              : () async {
                                  await showGeneralDialog(
                                      context: context,
                                      pageBuilder: (context, _, __) {
                                        return CustomDialogUI(
                                            icontitle: false,
                                            titleheader: AppStrings.emptyInput,
                                            subtitle: AppStrings.errorAmountInput,
                                            twobutton: false,
                                            discardtitle: null,
                                            discardtitleColor: null,
                                            discardColor: null,
                                            acceptedbutton: null,
                                            acceptedtitle: null,
                                            acceptedtitleColor: null,
                                            acceptedColor: null,
                                            centerbutton: () async {
                                              await Navigator.of(context, rootNavigator: true).pop();
                                            },
                                            centertitle: 'Dismiss',
                                            centerColor: ColorSets.colorPrimaryRed,
                                            centertitleColor: ColorSets.colorPrimaryWhite);
                                      },
                                      barrierDismissible: true,
                                      barrierLabel: '',
                                      useRootNavigator: true,
                                      barrierColor: Colors.black.withOpacity(0.8),
                                      transitionDuration: Duration(milliseconds: 300),
                                      transitionBuilder: (context, animation, __, child) {
                                        return SlideTransition(
                                          position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(animation),
                                          child: child,
                                        );
                                      });
                                },
                          label: Padding(
                            padding: EdgeInsets.symmetric(horizontal: AppBreakPoint.mediumscreen(context) ? 30 : 20),
                            child: Text(
                              'SEND',
                              style: AppTextStyles.h3style.copyWith(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: ColorSets.colorPrimaryLightYellowDashBoard,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class NumberPad extends StatelessWidget {
  final String number;
  final Function onPressed;
  final bool shape;
  final String asset;

  const NumberPad({Key key, @required this.number, @required this.onPressed, this.asset, this.shape = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: RawMaterialButton(
        padding: EdgeInsets.all(MediaQuery.of(context).size.height >= 820 ? 39 : 24),
        onPressed: onPressed,
        child: shape
            ? SvgPicture.asset(
                asset,
              )
            : Center(
                child: Text(
                  number,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.h3style.copyWith(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: ColorSets.colorPrimaryWhite,
                  ),
                ),
              ),
        elevation: 0.0,
        shape: shape
            ? CircleBorder(side: BorderSide(color: Colors.transparent))
            : CircleBorder(
                side: BorderSide(color: Color(0XFFFFB300), width: 1),
              ),
        // fillColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        focusColor: ColorSets.colorPrimaryLightYellow,
      ),
    );
  }
}
