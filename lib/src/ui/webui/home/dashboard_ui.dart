// import 'dart:html';

import 'dart:convert';
// import 'dart:html' as html;
import 'dart:typed_data';
import 'dart:ui';

import 'package:azapay/app/app.dart';
import 'package:azapay/src/blocs/blocs.dart';
import 'package:azapay/src/models/models.dart';
import 'package:azapay/src/widget/responsive_web/data/classes/responsive_web.dart';
import 'package:azapay/src/widget/widget.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isolate_bloc/isolate_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:qr_flutter/qr_flutter.dart';

class DashBoardUIWeb extends StatefulWidget {
  @override
  _DashBoardUIWebState createState() => _DashBoardUIWebState();
}

class _DashBoardUIWebState extends State<DashBoardUIWeb> {
  final GlobalKey<ExpansionTileCardState> cardA = GlobalKey();
  GlobalKey _renderObjectKey = GlobalKey();
  // ScrollController _scrollController;
  WalletBloc _walletBloc;
  ValueNotifier<ScrollController> _scrollNotifier;
//  ActivityIsolateBloc _activityIsolateBloc;
  @override
  void initState() {
    // _scrollController = ScrollController();

    super.initState();
    _scrollNotifier = ValueNotifier<ScrollController>(ScrollController());
    _walletBloc = context.bloc<WalletBloc>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // context.bloc<ActivityBloc>().add(FetchTransactionHistory());
      context.isolateBloc<ActivityIsolateBloc, ActivityIsolateState>().add(FetchTransactionHistoryIsolate());
    });
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ScrollController>(
        valueListenable: _scrollNotifier,
        builder: (context, scroll, child) {
          return AnimatedPadding(
            duration: Duration(milliseconds: 2000),
            padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: scroll.hasClients
                    ? scroll.offset > 0
                        ? 0
                        : 20
                    : 20),
            child: ListView(
              controller: _scrollNotifier.value,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //todo: chart
                    Container(
                      decoration: BoxDecoration(
                        color: ColorSets.colorPin,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      width: MediaQuery.of(context).size.width / 1.9,
                      height: MediaQuery.of(context).size.width / 4,
                      // margin: EdgeInsets.only(bottom: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0, top: 10),
                                child: Text(
                                  AppStrings.dashboardwebStatistics,
                                  style: AppTextStyles.h3style,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 20.0),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10.0),
                                      child: RaisedButton(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        onPressed: () {},
                                        elevation: 0.5,
                                        color: ColorSets.colorPrimaryWhite,
                                        child: Text(
                                          AppStrings.dashboardwebLastWeek,
                                          style: AppTextStyles.h3style,
                                        ),
                                      ),
                                    ),
                                    RaisedButton(
                                        elevation: 0.5,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        onPressed: () {},
                                        color: ColorSets.colorPrimaryWhite,
                                        child: Text(
                                          AppStrings.dashboardwebLastMonth,
                                          style: AppTextStyles.h3style,
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          IsolateBlocBuilder<ActivityIsolateBloc, ActivityIsolateState>(
                            builder: (context, state) {
                              if (state is ActivityLoadedIsolate) {
                                return state.basicResponse.isNotEmpty
                                    ? WebChartUI(
                                        seriesList: [
                                          charts.Series<CashFlow, DateTime>(
                                            id: 'Inflow',
                                            domainFn: (CashFlow cashFlow, _) => cashFlow.time,
                                            measureFn: (CashFlow cashFlow, _) => cashFlow.amount,
                                            data: state.basicResponse
                                                .where((transact) =>
                                                    transact.pair.from_key !=
                                                    (_walletBloc.state as WalletStateLoaded).wallet.data.key)
                                                .map<CashFlow>((transact) => CashFlow(
                                                    time: DateTime.parse(transact.createdAt), amount: transact.amount))
                                                .toList(),
                                          ),
                                          charts.Series<CashFlow, DateTime>(
                                            id: 'OutFlow',
                                            domainFn: (CashFlow cashFlow, _) => cashFlow.time,
                                            measureFn: (CashFlow cashFlow, _) => cashFlow.amount,
                                            data: state.basicResponse
                                                .where((transact) =>
                                                    transact.pair.from_key ==
                                                    (_walletBloc.state as WalletStateLoaded).wallet.data.key)
                                                .map<CashFlow>((transact) => CashFlow(
                                                    time: DateTime.parse(transact.createdAt), amount: transact.amount))
                                                .toList(),
                                          )
                                        ],
                                      )
                                    : Expanded(
                                        child: Center(child: Text('No Data Yet!')),
                                      );
                              } else {
                                return Center(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(40),
                                    child: CircularProgressIndicator(
                                      strokeWidth: 10,
                                      backgroundColor: ColorSets.colorPrimaryWhite,
                                      valueColor: AlwaysStoppedAnimation<Color>(Color(0XFFFFB300)),
                                    ),
                                  ),
                                );
                              }
                            },
                          ),

                          // Row(
                          //   children: [
                          //     Container(color: ,)
                          //   ],
                          // )
                        ],
                      ),
                    ),
                    //todo: qr code
                    BlocBuilder<ProfileBloc, ProfileState>(
                      builder: (context, state) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(
                                'QR CODE',
                                style: AppTextStyles.h3style.copyWith(fontWeight: FontWeight.w600),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                  color: Color(0XFFFFB300),
                                  width: 1,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: QrImage(
                                  size: MediaQuery.of(context).size.width / 5.8,
                                  data: state is ProfileLoaded ? state.tag : 'azapay',
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width / 8,
                                // height: MediaQuery.of(context).size.height / 20,
                                child: ButtonArrow(
                                    navigatorfunc: () async {
                                      try {
                                        final image = await QrPainter(
                                          data: state is ProfileLoaded ? state.tag : 'azapay',
                                          version: QrVersions.auto,
                                          gapless: false,
                                          color: Color(0xff000000),
                                          emptyColor: Color(0xffffffff),
                                        ).toImageData(300, format: ImageByteFormat.png);
                                        // var byteData = await image.toByteData(format: ImageByteFormat.png);
                                        // a.buffer.asUint8List();
                                        //"data:application/octet-stream;charset=utf-16le;base64
                                        // RenderRepaintBoundary boundary =
                                        //     _renderObjectKey.currentContext.findRenderObject();
                                        // var image = await boundary.toImage();
                                        // var byteData = await image.toByteData(format: ImageByteFormat.png);
                                       
                                        // var pngBytes = image.buffer.asUint8List();
                                        // var anchorElement = html.AnchorElement(
                                        //     href: 'data:application/octet-stream;base64,${base64Encode(pngBytes)}')
                                        //   ..target = 'blank';
                                        // anchorElement.download = 'azapay.png';
                                        // html.document.body
                                        //   ..append(anchorElement)
                                        //   ..setAttribute('download', 'code.png');
                                        // anchorElement.click();
                                        // anchorElement.remove();
                                      } catch (e) {
                                        print(e.toString());
                                      }
                                    },
                                    buttontitle: AppStrings.dashboardwebQrcodeDownload,
                                    arrow: false,
                                    buttontitleColor: ColorSets.colorPrimaryWhite),
                              ),
                            ),
                          ],
                        );
                      },
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          AppStrings.dashboardwebRecentTransaction,
                          style: AppTextStyles.h2style,
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //todo: recent transaction
                          Expanded(
                            child: IsolateBlocBuilder<ActivityIsolateBloc, ActivityIsolateState>(
                              builder: (context, state) {
                                if (state is ActivityLoadedIsolate) {
                                  return state.basicResponse.isEmpty
                                      ? Container(
                                          height: MediaQuery.of(context).size.width / 5,
                                          child: Center(
                                            child: Padding(
                                              padding: const EdgeInsets.all(20.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    AppStrings.activityDocNotifyEmptyTitle,
                                                    style: AppTextStyles.h2style.copyWith(fontSize: 18),
                                                  ),
                                                  Text(
                                                    AppStrings.notificationEmptySubTitle,
                                                    style: AppTextStyles.h3style,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(30), color: ColorSets.colorPin),
                                        )
                                      : ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: state.basicResponse.length,
                                          itemBuilder: (context, index) {
                                            return TransactionCardDetailsWebUI(
                                                cardA: cardA,
                                                walletBloc: _walletBloc,
                                                fromKey: state.basicResponse.elementAt(index).pair.from_key,
                                                toKey: state.basicResponse.elementAt(index).pair.to_key,
                                                amount: state.basicResponse.elementAt(index).amount,
                                                status: state.basicResponse.elementAt(index).status,
                                                ref: state.basicResponse.elementAt(index).ref,
                                                charge: state.basicResponse.elementAt(index).charge,
                                                fromType: state.basicResponse.elementAt(index).pair.from_type,
                                                toType: state.basicResponse.elementAt(index).pair.to_type);
                                          });
                                } else {
                                  return Center(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(40),
                                      child: CircularProgressIndicator(
                                        strokeWidth: 10,
                                        backgroundColor: ColorSets.colorPrimaryWhite,
                                        valueColor: AlwaysStoppedAnimation<Color>(Color(0XFFFFB300)),
                                      ),
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
//               //todo: complete transac

                          Expanded(
                            flex: 0,
                            child: InkWell(
                              highlightColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              onTap: () {
                                Navigator.pushNamed(context, AppRouteName.transactionPinWeb);
                              },
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Container(
                                  height: MediaQuery.of(context).size.height / 2,
                                  width: MediaQuery.of(context).size.width / 5.5,
                                  color: ColorSets.webcardwallet,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 20.0, left: 5, right: 5),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(top: 10.0, left: 5),
                                              child: Text(
                                                AppStrings.dashboardwebCreateTransactionPin,
                                                style:
                                                    AppTextStyles.h2style.copyWith(color: ColorSets.colorPrimaryWhite),
                                              ),
                                            ),
                                            Image.asset(
                                              AppImages.webagalaxy,
                                            )
                                          ],
                                        ),
                                      ),
                                      Stack(
                                        alignment: Alignment.bottomCenter,
                                        children: [
                                          AspectRatio(
                                            aspectRatio: 3 / 2.2,
                                            child: ClipPath(
                                              clipper: GoldClipper(),
                                              child: Container(
                                                width: MediaQuery.of(context).size.width,
                                                height: MediaQuery.of(context).size.height / 3,
                                                color: ColorSets.goldColor.withOpacity(0.3),
                                              ),
                                            ),
                                          ),
                                          AspectRatio(
                                            aspectRatio: 3 / 2,
                                            child: ClipPath(
                                              clipper: GoldClipper(),
                                              child: Container(
                                                width: MediaQuery.of(context).size.width,
                                                height: MediaQuery.of(context).size.height / 3,
                                                decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                        begin: Alignment.topLeft,
                                                        end: Alignment.bottomRight,
                                                        colors: [
                                                      ColorSets.darkgoldColor,
                                                      ColorSets.goldColor,
                                                    ])),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            bottom: MediaQuery.of(context).size.height / 15,
                                            left: MediaQuery.of(context).size.height / 5,
                                            child: Icon(
                                              Icons.lock,
                                              size: 60,
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
