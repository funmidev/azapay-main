import 'dart:math';

import 'package:azapay/app/app.dart';
import 'package:azapay/src/blocs/blocs.dart';
import 'package:azapay/src/widget/widget.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money2/money2.dart';

class TransactionUIWeb extends StatefulWidget {
  @override
  _TransactionUIWebState createState() => _TransactionUIWebState();
}

class _TransactionUIWebState extends State<TransactionUIWeb> with SingleTickerProviderStateMixin {
  TabController _tabController;
  final GlobalKey<ExpansionTileCardState> cardA = GlobalKey();
  ActivityBloc _activityBloc;
  NotificationBloc _notificationBloc;
  final _transactionStatus = <String>[
    AppStrings.confirmed,
    AppStrings.pending,
    AppStrings.cancelled,
    AppStrings.declined
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 4);
    _activityBloc = context.bloc<ActivityBloc>();
    _activityBloc.add(FetchTransactionHistory());
    _notificationBloc = context.bloc<NotificationBloc>();
    _notificationBloc.add(FetchFundRequest());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 50.0, right: MediaQuery.of(context).size.width / 9),
      child: ListView(
        children: [
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              WalletBalanceCardUI(
                walletlinkbank: false,
              ),
              InkWell(
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                onTap: () {},
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 4,
                    width: MediaQuery.of(context).size.width / 3.8,
                    color: ColorSets.webcardwallet,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 18),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: Text(
                                  AppStrings.walletwebLoadAzaPayAccount,
                                  style: AppTextStyles.h2style.copyWith(color: ColorSets.colorPrimaryWhite),
                                  // textAlign: TextAlign.left,
                                ),
                              ),
                              Expanded(
                                child: Image(
                                  alignment: Alignment.centerLeft,
                                  image: AssetImage(AppImages.webagalaxy),
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Transform.rotate(
                            angle: -pi / 2,
                            origin: Offset(MediaQuery.of(context).size.width * 0.01, 0),
                            child: Stack(
                              // alignment: Alignment.topRight,
                              children: [
                                AspectRatio(
                                  aspectRatio: 1.7 / 1.4,
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
                                  aspectRatio: 2.2 / 2,
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
                                  // left: MediaQuery.of(context).size.height / 5,
                                  right: MediaQuery.of(context).size.height / 15,
                                  child: Transform.rotate(
                                    angle: pi / 2,
                                    child: Icon(
                                      Icons.lock,
                                      size: 40,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              //todo: balance
              //todo: change transaction pin
            ],
          ),
          Column(
            children: [
              //todo: search
              Padding(
                padding: EdgeInsets.only(right: MediaQuery.of(context).size.width / 12, top: 20),
                child: FormFieldUI(
                  borderradius: 10,
                  contentpad: 13,
                  currentnode: null,
                  fieldController: null,
                  // nextnode: _emailnode,
                  prefixicon: Icon(
                    Icons.search,
                    color: ColorSets.colorPrimaryBlack,
                  ),
                  hint: AppStrings.transactionWebSearch,
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.text,
                  // maxLength: 100,
                  errorText: null,
                  onchanged: (search) {},
                ),
              ),
              //todo: transaction list
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  AppStrings.transactionWebAllTransactions,
                  style: AppTextStyles.h2style,
                  textAlign: TextAlign.left,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TabBar(
                  indicatorColor: ColorSets.colorPrimaryLightYellow,
                  tabs: [
                    Tab(
                      text: AppStrings.transactionWebCompleted,
                    ),
                    Tab(
                      text: AppStrings.transactionWebPending,
                    ),
                    Tab(
                      text: AppStrings.transactionWebCancelled,
                    ),
                    Tab(
                      text: AppStrings.transactionWebDeclined,
                    ),
                  ],
                  controller: _tabController,
                ),
              ),

              BlocBuilder<NotificationBloc, NotificationState>(
                builder: (context, state) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: TabBarView(
                      controller: _tabController,
                      children: state is NotificationLoaded
                          ? state.fundrequestlist.isEmpty
                              ? [
                                  Container(
                                    height: MediaQuery.of(context).size.width / 2,
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
                                              AppStrings.activityEmptySubTitle,
                                              style: AppTextStyles.h3style,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30), color: ColorSets.colorPin),
                                  ),
                                  Container(
                                    height: MediaQuery.of(context).size.width / 2,
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
                                              AppStrings.activityEmptySubTitle,
                                              style: AppTextStyles.h3style,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30), color: ColorSets.colorPin),
                                  ),
                                  Container(
                                    height: MediaQuery.of(context).size.width / 2,
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
                                              AppStrings.activityEmptySubTitle,
                                              style: AppTextStyles.h3style,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30), color: ColorSets.colorPin),
                                  ),
                                  Container(
                                    height: MediaQuery.of(context).size.width / 2,
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
                                              AppStrings.activityEmptySubTitle,
                                              style: AppTextStyles.h3style,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30), color: ColorSets.colorPin),
                                  ),
                                ]
                              : _transactionStatus.map((e) {
                                  print(state.fundrequestlist.any((transaction) => transaction.status == e));
                                  return state.fundrequestlist.any((transaction) => transaction.status == e)
                                      ? ListView.builder(
                                          itemCount: state.fundrequestlist
                                              .where((transaction) => transaction.status == e)
                                              .toList()
                                              .length,
                                          itemBuilder: (context, index) {
                                            final transaction = state.fundrequestlist
                                                .where((transaction) => transaction.status == e)
                                                .toList()
                                                .reversed
                                                .toList();

                                            return TransactionCardDetailsWebUI(
                                                cardA: cardA,
                                                walletBloc: context.bloc<WalletBloc>(),
                                                fromKey: transaction.elementAt(index).from.tag,
                                                toKey: transaction.elementAt(index).to.tag,
                                                amount: transaction.elementAt(index).amount,
                                                status: transaction.elementAt(index).status,
                                                charge: 0.0,
                                                fromType: transaction.elementAt(index).from.accountType,
                                                toType: transaction.elementAt(index).to.accountType,
                                                ref: transaction.elementAt(index).ref);
                                          })
                                      : Center(
                                          child: Text('No Transaction Yet!'),
                                        );
                                }).toList()
                          : [
                              LoadingUI(
                                showtext: true,
                                function: (_) {},
                              ),
                              LoadingUI(
                                showtext: true,
                                function: (_) {},
                              ),
                              LoadingUI(
                                showtext: true,
                                function: (_) {},
                              ),
                              LoadingUI(
                                showtext: true,
                                function: (_) {},
                              )
                            ], //[Icon(Icons.ac_unit), Icon(Icons.access_alarm_sharp), Icon(Icons.zoom_out_sharp)],
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

String _transactionStatustype({int index}) {
  switch (index) {
    case 0:
      return AppStrings.confirmed;
      break;
    case 1:
      return AppStrings.pending;
      break;
    case 2:
      return AppStrings.cancelled;
      break;
    default:
      return AppStrings.declined;
      break;
  }
}
