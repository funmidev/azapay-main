import 'package:azapay/app/app.dart';
import 'package:azapay/src/blocs/activity/activity_bloc.dart';
import 'package:azapay/src/blocs/blocs.dart';
import 'package:azapay/src/models/models.dart';
import 'package:azapay/src/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:money2/money2.dart';

class ActivityUI extends StatefulWidget {
  @override
  _ActivityUIState createState() => _ActivityUIState();
}

class _ActivityUIState extends State<ActivityUI> {
  ScrollController _controllerOne;
  TextEditingController _searchController;
  WalletBloc _walletBloc;
  ActivityBloc _activityBloc;

  @override
  void initState() {
    super.initState();
    _walletBloc = context.bloc<WalletBloc>();
    _activityBloc = context.bloc<ActivityBloc>();
    _activityBloc.add(FetchTransactionHistory());
    _searchController = TextEditingController();
    _controllerOne = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActivityBloc, ActivityState>(
      builder: (context, state) {
        if (state is ActivityLoaded) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              title: Text(AppStrings.activityTitle,
                  style: AppTextStyles.h3style.copyWith(fontWeight: FontWeight.w600, fontSize: 18)),
              centerTitle: true,
            ),
            body: SafeArea(
              child: Column(
                children: [
                  FormFieldUI(
                    currentnode: null,
                    fieldController: _searchController,
                    hint: AppStrings.activitySearchHint,
                    prefixicon: InkWell(
                      onTap: () {
                        _searchController.clear();
                      },
                      child: state.searchtext.isEmpty
                          ? EmptyWidgetUI()
                          : Icon(
                              Icons.cancel,
                              color: ColorSets.colorPrimaryLightYellow,
                            ),
                    ),
                    suffixicon: Icon(
                      Icons.search,
                      color: ColorSets.colorPrimaryLightYellow,
                    ),
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.text,
                    errorText: null,
                    onchanged: (search) => _activityBloc.add(
                      SearchTransactionHistory(search: search),
                    ),
                  ),
                  state.basicResponse.isNotEmpty
                      ? Expanded(
                          child: LiquidPullToRefresh(
                            showChildOpacityTransition: false,
                            onRefresh: () async {
                              await _activityBloc.add(FetchTransactionHistory());
                            },
                            backgroundColor: ColorSets.colorPrimaryWhite,
                            color: ColorSets.colorPrimaryLightYellow,
                            child: Scrollbar(
                              //
                              controller: _controllerOne,

                              child: ListView.builder(
                                  controller: _controllerOne,
                                  physics: AlwaysScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: state.searchtext.isNotEmpty
                                      ? state.basicResponse.reversed
                                          .toList()
                                          .where(
                                            (transact) =>
                                                transact.type.contains(state.searchtext) ||
                                                transact.status.contains(state.searchtext),
                                          )
                                          .length
                                      : state.basicResponse.length,
                                  itemBuilder: (context, position) {
                                    final transactionHistoryList = state.basicResponse.reversed.toList();
                                    return RecentTransactionListTileUI(
                                      onTapped: () {
                                        Navigator.push(
                                          context,
                                          PageRouteBuilder(
                                            pageBuilder: (context, animation, secondaryAnimation) {
                                              return ActivityFullDetailsUI(
                                                transactionHistory: transactionHistoryList.elementAt(position),
                                              );
                                            },
                                            transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                              var begin = Offset(0.0, 1.0);
                                              var end = Offset.zero;
                                              Curve curve = Curves.ease;
                                              var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

                                              return SlideTransition(position: animation.drive(tween), child: child);
                                            },
                                          ),
                                        );
                                      },
                                      nonotifyvisibility: true,
                                      recentTransact: RecentTransact(
                                        title: transactionHistoryList.elementAt(position).type,
                                        subtitle: DateFormat('EEE,d-MM-yyyy').add_jms().format(
                                            DateTime.parse(transactionHistoryList.elementAt(position).createdAt)),
                                        time: DateFormat('EEE,d-MM-yyyy').add_jms().format(
                                            DateTime.parse(transactionHistoryList.elementAt(position).createdAt)),
                                        credit: (_walletBloc.state as WalletStateLoaded).wallet.data.key !=
                                                transactionHistoryList.elementAt(position).pair.from_key
                                            ? true
                                            : false,
                                        transact: Money.from(transactionHistoryList.elementAt(position).amount,
                                                Currency.create('USD', 2))
                                            .format('#,###.##')
                                            .toString(),
                                      ),
                                    );
                                  }),
                            ),
                          ),
                        )
                      : Container(
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
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: ColorSets.colorPin),
                        ),
                ],
              ),
            ),
          );
        } else if (state is ActivityError) {
          return SafeArea(
            child: Material(
              child: Center(
                child: Column(
                  children: [
                    Expanded(
                      child: SvgPicture.asset(
                        AppVectors.offline,
                      ),
                    ),
                    Expanded(
                        child: Text(
                      AppStrings.extractdeviceinfoContent,
                      style: AppTextStyles.h3style,
                      textAlign: TextAlign.center,
                    ))
                  ],
                ),
              ),
            ),
          );
        } else {
          return LoadingUI(
            function: (_) {},
            showtext: true,
          );
        }
      },
    );
  }
}
