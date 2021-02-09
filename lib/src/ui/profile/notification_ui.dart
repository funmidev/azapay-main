import 'package:azapay/app/app.dart';
import 'package:azapay/src/blocs/blocs.dart';
import 'package:azapay/src/models/models.dart';
import 'package:azapay/src/ui/ui.dart';
import 'package:azapay/src/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:azapay/app/app_strings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class NotificationUI extends StatefulWidget {
  @override
  _NotificationUIState createState() => _NotificationUIState();
}

class _NotificationUIState extends State<NotificationUI> {
  final ScrollController _controllerOne = ScrollController();
  NotificationBloc _notificationBloc;
  ProfileBloc _profileBloc;
  @override
  void initState() {
    super.initState();
    _notificationBloc = context.bloc<NotificationBloc>();
    _profileBloc = context.bloc<ProfileBloc>();
    _notificationBloc.add(FetchFundRequest());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotificationBloc, NotificationState>(
      listener: (context, state) async {
        if (state is NotificationLoaded) {
          if (state.success == 200) {
            // await Navigator.of(context, rootNavigator: true).pop();
            await Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) {
                  return TransactionResponseUI(
                    icon: Icons.done,
                    color: ColorSets.colorPrimaryLightGreen,
                    iconcolor: ColorSets.colorPrimaryWhite,
                    responsetitle: AppStrings.successTransactPinTitle,
                    responsemessage: state.responsemessage,
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
            _notificationBloc.add(ClearNotificationResponse());
          } else if (state.error == 400) {
            // await Navigator.of(context, rootNavigator: true).pop();
            await Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) {
                  return TransactionResponseUI(
                    icon: Icons.clear,
                    color: ColorSets.colorPrimaryRed,
                    iconcolor: ColorSets.colorPrimaryWhite,
                    responsetitle: AppStrings.failedTransactPinTitle,
                    responsemessage: state.responsemessage,
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

            _notificationBloc.add(ClearNotificationResponse());
          }
          // else if (state.fundrequestlist.isNotEmpty) {
          //   await Navigator.of(context, rootNavigator: true).pop();
          // }
        }
        // else if (state is NotificationLoading) {
        //   await showGeneralDialog(
        //       context: context,
        //       pageBuilder: (context, _, __) {
        //         return LoadingUI(
        //           function: (_) {},
        //           showtext: true,
        //         );
        //       },
        //       barrierDismissible: true,
        //       barrierLabel: '',
        //       barrierColor: Colors.black.withOpacity(0.8),
        //       useRootNavigator: true,
        //       transitionDuration: Duration(milliseconds: 300),
        //       transitionBuilder: (context, animation, __, child) {
        //         return SlideTransition(
        //           position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(animation),
        //           child: child,
        //         );
        //       });
        // }
      },
      builder: (context, state) {
        if (state is NotificationLoaded) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              centerTitle: true,
              title: Text(
                AppStrings.notificationOne,
                style: AppTextStyles.h3style.copyWith(fontWeight: FontWeight.w600, fontSize: 20),
              ),
            ),
            body: SafeArea(
              child: state.fundrequestlist.isEmpty
                  ? Container(
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
                                AppStrings.notificationEmptySubTitle,
                                style: AppTextStyles.h3style,
                              ),
                            ],
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: ColorSets.colorPin),
                    )
                  : LiquidPullToRefresh(
                      showChildOpacityTransition: false,
                      onRefresh: () async {
                        await _notificationBloc.add(FetchFundRequest(refresh: true));
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
                          itemCount: state.fundrequestlist.length,
                          itemBuilder: (context, index) {
                            return RecentTransactionListTileUI(
                              onTapped: state.fundrequestlist.elementAt(index).from.tag ==
                                          (_profileBloc.state as ProfileLoaded).signUp.data.tag ||
                                      state.fundrequestlist.elementAt(index).status == AppStrings.declined
                                  ? () async {
                                      await showGeneralDialog(
                                          context: context,
                                          useRootNavigator: true,
                                          pageBuilder: (context, _, __) {
                                            return CustomDialogUI(
                                                icontitle: state.fundrequestlist.elementAt(index).status == AppStrings.fundRequestCancelled || state.fundrequestlist.elementAt(index).status == AppStrings.fundRequestApproved || state.fundrequestlist.elementAt(index).status == AppStrings.declined
                                                    ? true
                                                    : false,
                                                titleheader: state.fundrequestlist.elementAt(index).status == AppStrings.fundRequestApproved
                                                    ? AppVectors.greenMark
                                                    : state.fundrequestlist.elementAt(index).status == AppStrings.fundRequestCancelled || state.fundrequestlist.elementAt(index).status == AppStrings.declined
                                                        ? AppVectors.redMark
                                                        : AppStrings.cancel,
                                                subtitle: state.fundrequestlist.elementAt(index).status == AppStrings.fundRequestApproved
                                                    ? 'Your transaction request to ${state.fundrequestlist.elementAt(index).to.tag}, has been successful'
                                                    : state.fundrequestlist.elementAt(index).status == AppStrings.fundRequestCancelled
                                                        ? 'Your transaction request to ${state.fundrequestlist.elementAt(index).to.tag}, has been cancelled'
                                                        : state.fundrequestlist.elementAt(index).status == AppStrings.declined
                                                            ? 'You declined the request'
                                                            : 'Do you really want to cancel the fund request?',
                                                twobutton: false,
                                                discardtitle: AppStrings.cancel,
                                                discardtitleColor: ColorSets.colorPrimaryWhite,
                                                discardColor: ColorSets.colorPrimaryRed,
                                                acceptedbutton: null,
                                                acceptedtitle: AppStrings.proceed,
                                                acceptedtitleColor: ColorSets.colorPrimaryWhite,
                                                acceptedColor: ColorSets.colorPrimaryLightGreen,
                                                centerbutton: () async {
                                                  if (state.fundrequestlist.elementAt(index).status ==
                                                      AppStrings.fundRequestPending) {
                                                    await Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) => TransactionUI(),
                                                            fullscreenDialog: true));
                                                    await _notificationBloc.add(CancelFundRequest(
                                                        ref: state.fundrequestlist.elementAt(index).ref));
                                                    await Navigator.of(context, rootNavigator: true).pop();
                                                  } else {
                                                    await _notificationBloc.add(TickAsReadFundNotification(
                                                        ref: state.fundrequestlist.elementAt(index).ref));

                                                    Navigator.of(context, rootNavigator: true).pop();
                                                  }
                                                },
                                                centertitle: state.fundrequestlist.elementAt(index).status == AppStrings.fundRequestCancelled ||
                                                        state.fundrequestlist.elementAt(index).status ==
                                                            AppStrings.fundRequestApproved
                                                    ? AppStrings.close
                                                    : AppStrings.cancel,
                                                centerColor: state.fundrequestlist.elementAt(index).status == AppStrings.fundRequestCancelled ||
                                                        state.fundrequestlist.elementAt(index).status == AppStrings.fundRequestApproved ||
                                                        state.fundrequestlist.elementAt(index).status == AppStrings.declined
                                                    ? ColorSets.colorPrimaryLightYellow
                                                    : ColorSets.colorPrimaryRed,
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
                                    }
                                  : () async {
                                      await showGeneralDialog(
                                          context: context,
                                          useRootNavigator: true,
                                          pageBuilder: (context, _, __) {
                                            return CustomDialogUI(
                                                icontitle: false,
                                                titleheader: AppStrings.fundRequestTitle,
                                                subtitle:
                                                    '(${state.fundrequestlist.elementAt(index).from.lastName} ${state.fundrequestlist.elementAt(index).from.firstName}) #${state.fundrequestlist.elementAt(index).from.tag} requests a transfer of ${state.fundrequestlist.elementAt(index).amount} from you.',
                                                twobutton: true,
                                                discardtitle: AppStrings.cancel,
                                                discardtitleColor: ColorSets.colorPrimaryWhite,
                                                discardColor: ColorSets.colorPrimaryRed,
                                                disablebutton: () async {
                                                  await Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) => TransactionUI(), fullscreenDialog: true));
                                                  await _notificationBloc.add(DeclineFundRequest(
                                                      ref: state.fundrequestlist.elementAt(index).ref));
                                                  await Navigator.of(context, rootNavigator: true).pop();
                                                },
                                                allowdisablepop: false,
                                                acceptedbutton: () async {
                                                  await Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) => TransactionUI(), fullscreenDialog: true));
                                                  await _notificationBloc.add(ApproveFundRequest(
                                                      ref: state.fundrequestlist.elementAt(index).ref));
                                                  await Navigator.of(context, rootNavigator: true).pop();
                                                },
                                                acceptedtitle: AppStrings.proceed,
                                                acceptedtitleColor: ColorSets.colorPrimaryWhite,
                                                acceptedColor: ColorSets.colorPrimaryLightGreen,
                                                centerbutton: null,
                                                centertitle: null,
                                                centerColor: null,
                                                centertitleColor: null);
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
                              nonotifyvisibility: state.refFund
                                  .where((fund) => state.fundrequestlist.elementAt(index).ref == fund.ref)
                                  .elementAt(0)
                                  .actionperformed,
                              recentTransact: RecentTransact(
                                  showicon: false,
                                  status: state.fundrequestlist.elementAt(index).status,
                                  iscurrency: false,
                                  credit:
                                      state.fundrequestlist.elementAt(index).status == AppStrings.fundRequestApproved
                                          ? true
                                          : false,
                                  subtitle: state.fundrequestlist.elementAt(index).from.tag ==
                                          (_profileBloc.state as ProfileLoaded).signUp.data.tag
                                      ? 'You sent ${state.fundrequestlist.elementAt(index).to.tag} a fund request'
                                      : ' ${state.fundrequestlist.elementAt(index).from.tag} sent you a fund request',
                                  title: AppStrings.fundrequest,
                                  time: AppStrings.empty),
                            );
                          },
                        ),
                      ),
                    ),
            ),
          );
        } else if (state is NotificationError) {
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
          return LoadingUI(function: (_) {}, showtext: true);
        }
      },
    );
  }
}
