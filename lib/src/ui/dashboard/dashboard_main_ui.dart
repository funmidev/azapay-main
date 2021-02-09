import 'package:azapay/app/app.dart';
import 'package:azapay/src/blocs/blocs.dart';
import 'package:azapay/src/ui/ui.dart';
import 'package:azapay/src/widget/widget.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money2/money2.dart';

class DashBoardUI extends StatefulWidget {
  @override
  _DashBoardUIState createState() => _DashBoardUIState();
}

class _DashBoardUIState extends State<DashBoardUI>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  bool _amountvisible;
  DashboardBloc _bloc;

  QrscanBloc _qrscanBloc;

  @override
  void initState() {
    super.initState();
    _bloc = context.bloc<DashboardBloc>();
    _qrscanBloc = context.bloc<QrscanBloc>();
    _tabController = TabController(
        initialIndex: _bloc.state.position,
        vsync: this,
        length: _tabitem().length);

    _tabController.addListener(() {
      _bloc.add(
        CurrentBottomNavigationPosition(position: _tabController.index),
      );
    });

    _amountvisible = false;
  }

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    // final itemHeight = MediaQuery.of(context).size.height >= 667
    //     ? (size.height - kToolbarHeight) / 4.5
    //     : (size.height - kToolbarHeight) / 4.6;
    // final itemWidth = size.width / 2;

    return MultiBlocListener(
      listeners: [
        BlocListener<ProfileBloc, ProfileState>(
          listenWhen: (previous, current) {
            print(previous);
            print(current);
            if (previous is ProfileLoaded && current is ProfileLoaded) {
              if (!previous.signUp.data.bvn && !current.signUp.data.bvn) {
                return false;
              } else {
                return true;
              }
            } else if (previous is ProfileLoading && current is ProfileLoaded) {
              return false;
            } else if (current is ProfileLoading) {
              return false;
            } else if (previous is ProfileLoaded && current is ProfileInitial) {
              return false;
            } else {
              return true;
            }
          },
          listener: (context, state) {
            if (state is ProfileLoaded && !state.signUp?.data?.bvn) {
              Navigator.push(
                context,
                PageRouteBuilder(
                  opaque: false,
                  pageBuilder: (context, _, __) => CompleteProfileUI(),
                  fullscreenDialog: true,
                ),
              );
            }
          },
        ),
        BlocListener<TransactionpinBloc, TransactionpinState>(
          listener: (context, state) async {
            if (state is TransactionpinChecked) {
              if (_qrscanBloc is QrScanLoaded) {
                if ((_qrscanBloc.state as QrScanLoaded).screen == 0) {
                  Future.delayed(
                    Duration(seconds: 1),
                    () async {
                      _qrscanBloc.add(SendFundQrScan());
                      //todo: sendamountqrcode
                    },
                  );
                }
              }
            }
          },
        ),
      ],
      child: BlocBuilder<WalletBloc, WalletState>(builder: (context, state) {
        if (state is WalletStateLoaded) {
          return Stack(
            children: [
              BlocBuilder<DashboardBloc, DashboardState>(
                builder: (context, state) => SafeArea(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      color: state.position == 2
                          ? null
                          : ColorSets.colorPrimaryWhite,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            Colors.white.withOpacity(0.1), BlendMode.dstATop),
                        image: AssetImage(
                          AppImages.dashBoardAnkara,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Theme(
                data: ThemeData(
                  appBarTheme: AppBarTheme(
                      color: ColorSets.colorPrimaryWhite.withOpacity(0.8),
                      elevation: 0.0),
                  scaffoldBackgroundColor: Colors.transparent,
                  // /bottomAppBarColor: Colors.transparent ,
                ),
                child: BlocBuilder<DashboardBloc, DashboardState>(
                  builder: (context, dashstate) {
                    return Scaffold(
                      resizeToAvoidBottomInset: false,
                      appBar: AppBar(
                        elevation: 0.0,
                        backgroundColor: dashstate.position == 2
                            ? ColorSets.colorPrimaryLightYellowDashBoard
                            : ColorSets.colorPrimaryWhite.withOpacity(0.8),
                        leading: Padding(
                          padding: const EdgeInsets.only(left: 20.0, top: 5.0),
                          child: IconButton(
                            icon: Icon(
                              Icons.access_time,
                              color: dashstate.position == 2
                                  ? ColorSets.colorPrimaryWhite
                                  : ColorSets.colorPrimaryLightYellowDashBoard,
                              size: 25,
                            ),
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, AppRouteName.activity);
                            },
                          ),
                        ),
                        title: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                icon: Icon(
                                    _amountvisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: dashstate.position == 2
                                        ? ColorSets.colorPrimaryWhite
                                        : ColorSets
                                            .colorPrimaryLightYellowDashBoard,
                                    size: 20),
                                onPressed: () {
                                  setState(() {
                                    _amountvisible = !_amountvisible;
                                  });
                                }),
                            Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: dashstate.position == 2
                                      ? ColorSets.colorPrimaryWhite
                                      : ColorSets
                                          .colorPrimaryLightYellowDashBoard,
                                  borderRadius: BorderRadius.circular(40)),
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      color: dashstate.position == 2
                                          ? ColorSets
                                              .colorPrimaryLightYellowDashBoard
                                          : ColorSets.colorPrimaryWhite,
                                      borderRadius: BorderRadius.circular(40)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15.0, vertical: 0.5),
                                    child: Text(
                                      _amountvisible
                                          ? '${AppStrings.nairaUnicode} ${Money.from(
                                              state.wallet.data.balance ?? 0,
                                              Currency.create(
                                                'USD',
                                                2,
                                              ),
                                            ).format('#,###.##')}'
                                          : '${AppStrings.nairaUnicode}*******',
                                      maxLines: 1,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize:
                                            AppBreakPoint.mediumscreen(context)
                                                ? 15
                                                : 12,
                                        color: dashstate.position == 2
                                            ? ColorSets.colorPrimaryWhite
                                            : ColorSets
                                                .colorPrimaryLightYellowDashBoard,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        centerTitle: true,
                        actions: [
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0, top: 5),
                            child: Stack(
                              children: <Widget>[
                                IconButton(
                                    icon: Icon(
                                      Icons.account_circle,
                                      color: dashstate.position == 2
                                          ? ColorSets.colorPrimaryWhite
                                          : ColorSets
                                              .colorPrimaryLightYellowDashBoard,
                                      size: 25,
                                    ),
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, AppRouteName.profile);
                                    }),
                                BlocBuilder<NotificationBloc,
                                    NotificationState>(
                                  builder: (context, state) {
                                    if (state is NotificationLoaded) {
                                      if (state.refFund?.every((fund) =>
                                              fund.actionperformed == false) ??
                                          false) {
                                        return Positioned(
                                          // draw a red marble
                                          top: 13.0,
                                          right: 11.0,
                                          child: Icon(Icons.brightness_1,
                                              size: 8.0,
                                              color: Colors.redAccent),
                                        );
                                      } else {
                                        return EmptyWidgetUI();
                                      }
                                    }
                                    return EmptyWidgetUI();
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      body: SafeArea(
                        child: TabBarView(
                          controller: _tabController,
                          children: _dashboardui(),
                          physics: NeverScrollableScrollPhysics(),
                        ),
                      ),
                      bottomNavigationBar:
                          BlocBuilder<DashboardBloc, DashboardState>(
                        builder: (context, state) => ConvexAppBar(
                          // color: ColorSets.colorPrimaryLightYellowDashBoard,
                          controller: _tabController,
                          curve: Curves.easeIn,
                          elevation: 0.0,
                          initialActiveIndex: state.position,
                          backgroundColor:
                              ColorSets.colorPrimaryLightYellowDashBoard,
                          style: TabStyle.reactCircle,
                          activeColor:
                              ColorSets.colorPrimaryLightYellowDashBoard,
                          items: _tabitem(),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        } else {
          // print(state);
          return LoadingUI(function: (_) {
            if ((state as WalletStateInitial).value) {
              _bloc.add(Fetch());
            }
          });
        }
      }),
    );
  }

  @override
  void dispose() {
    // wallet?.close();
    _tabController.dispose();
    super.dispose();
  }
}

List<TabItem<Icon>> _tabitem() {
  return <TabItem<Icon>>[
    TabItem(
        icon: Icon(
      Icons.account_balance,
      size: 25,
      color: ColorSets.colorPrimaryWhite,
    )),
    TabItem(
        icon: Icon(DashBoard.ic_account_balance_wallet_24px,
            color: ColorSets.colorPrimaryWhite, size: 20)),
    TabItem(
        icon: Icon(
      DashBoard.naira,
      size: 20,
      color: ColorSets.colorPrimaryWhite,
    )),
    TabItem(
        icon: Icon(
      Icons.business_center,
      size: 25,
      color: ColorSets.colorPrimaryWhite,
    )),
    TabItem(
      icon: Icon(DashBoard.icon_metro_shop,
          color: ColorSets.colorPrimaryWhite, size: 20),
    )
  ];
}

List<Widget> _dashboardui() {
  return <Widget>[
    BankUI(),
    WalletUI(),
    NairaBoardUI(),
    BuyAndPayUI(),
    MerchantHubUI(),
  ];
}
