import 'package:azapay/app/app.dart';
import 'package:azapay/route.dart';
import 'package:azapay/src/blocs/blocs.dart';
import 'package:azapay/src/blocs/modifypasssword/modifypassword_bloc.dart';
import 'package:azapay/src/resources/resources.dart';
import 'package:azapay/src/ui/ui.dart';
import 'package:azapay/src/widget/widget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart' as device;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:flutter_freshchat/flutter_freshchat.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:isolate_bloc/isolate_bloc.dart';
import 'package:universal_platform/universal_platform.dart';

import 'isolate_initialization.dart';

void main() async {
  debugPaintSizeEnabled = false;
  //flutterbinding helps when running an async-await method in main method
  WidgetsFlutterBinding.ensureInitialized();

  await initialize(isolateInitialization);

  await device.SystemChrome.setPreferredOrientations(
      [device.DeviceOrientation.portraitUp]);
  await device.SystemChrome.setEnabledSystemUIOverlays(
      [device.SystemUiOverlay.bottom]);
  await device.SystemChrome.setSystemUIOverlayStyle(
      device.SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  // await FlutterFreshchat.init(
  //     appID: AppEnv.appID, appKey: AppEnv.appKEY, domain: 'https://msdk.freshchat.com', cameraEnabled: false);
  // print(result);
  await DatabaseProvider().initializedb();

  runApp(
      // DevicePreview(
      //   enabled: !kReleaseMode,
      //   builder: (context) => App(),
      // ),
      App());
}

class App extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  final _navigatorKey = GlobalKey<NavigatorState>();

  final _token = CancelToken();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      print(state);

      // user returned to our app
    } else if (state == AppLifecycleState.inactive) {
      // app is inactive
      WidgetsBinding.instance.addPostFrameCallback((_) {
        //  Navigator.push(
        //   context,MaterialPageRoute(
        //         builder: (context) {
        //           return BlocBuilder<HomeauthnavigationBloc, HomeauthnavigationState>(
        //             builder: (context, state) {
        //               if (state is HomeauthnavigationSwitchAccount) {
        //                 return SwitchAccountUI(azatag: state.basicResponse.data);
        //               } else {

        //                 BlocProvider.of<HomeauthnavigationBloc>(context).add(CheckNavigation());
        //                  return EmptyWidgetUI();
        //               }
        //             },
        //           );
        //         },
        //       ));
        // Future.delayed(Duration(milliseconds: 15000), () async {
        //       print("Done");
        //     });
      });
    } else if (state == AppLifecycleState.paused) {
      // user is about quit our app temporally

      ///todo: start one-time workmanager for 5 secs test and 1 min production

    }
  }

  @override
  Widget build(BuildContext context) {
    return StyledToast(
      locale: const Locale(
          'en', 'US'), //You have to set this parameters to your locale
      textStyle: TextStyle(fontSize: 16.0, color: Colors.white),
      backgroundColor: Color(0x99000000),
      borderRadius: BorderRadius.circular(5.0),
      textPadding: EdgeInsets.symmetric(horizontal: 17.0, vertical: 10.0),
      toastAnimation: StyledToastAnimation.size,
      reverseAnimation: StyledToastAnimation.size,
      startOffset: Offset(0.0, -1.0),
      reverseEndOffset: Offset(0.0, -1.0),
      duration: Duration(seconds: 4),
      animDuration: Duration(seconds: 1),
      alignment: Alignment.center,
      toastPositions: StyledToastPosition.center,
      curve: Curves.fastOutSlowIn,
      reverseCurve: Curves.fastOutSlowIn,
      dismissOtherOnShow: true,
      movingOnWindowChange: true,
      fullWidth: false,
      child: MultiIsolateBlocProvider(
        providers: [
          IsolateBlocProvider<ActivityIsolateBloc, ActivityIsolateState>(),
        ],
        child: RepositoryProvider(
          create: (context) => Repository(),
          child: MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => HomeauthnavigationBloc(
                    navigatorState: _navigatorKey,
                    repository: RepositoryProvider.of<Repository>(context),
                  ),
                ),
                BlocProvider(
                  create: (context) => ForgotpasswordBloc(
                    repository: RepositoryProvider.of<Repository>(context),
                  ),
                ),
                BlocProvider(
                  create: (context) => SignupBloc(
                    repository: RepositoryProvider.of<Repository>(context),
                  ),
                ),
                BlocProvider(
                  create: (context) => ModifypasswordBloc(
                    repository: RepositoryProvider.of<Repository>(context),
                  ),
                ),
                BlocProvider(
                  create: (context) => SigninBloc(
                    repository: RepositoryProvider.of<Repository>(context),
                  ),
                ),
                BlocProvider(
                  create: (context) => WalletBloc(
                    repository: RepositoryProvider.of<Repository>(context),
                  ),
                ),
                BlocProvider(
                  create: (context) => TransactionpinBloc(
                    repository: RepositoryProvider.of<Repository>(context),
                  ),
                ),
                BlocProvider(
                  create: (context) => NotificationBloc(
                    transactionpinBloc:
                        BlocProvider.of<TransactionpinBloc>(context),
                    repository: RepositoryProvider.of<Repository>(context),
                  ),
                ),
                BlocProvider(
                  create: (context) => ProfileBloc(
                    navigatorState: _navigatorKey,
                    notificationBloc:
                        BlocProvider.of<NotificationBloc>(context),
                    walletBloc: BlocProvider.of<WalletBloc>(context),
                    repository: RepositoryProvider.of<Repository>(context),
                  ),
                ),
                BlocProvider(
                  create: (context) => DashboardBloc(
                    navigatorState: _navigatorKey,
                    profileBloc: BlocProvider.of<ProfileBloc>(context),
                    walletBloc: BlocProvider.of<WalletBloc>(context),
                    notificationBloc:
                        BlocProvider.of<NotificationBloc>(context),
                    repository: RepositoryProvider.of<Repository>(context),
                  ),
                ),
                BlocProvider(
                  create: (context) => SendandrequestBloc(
                    cancelToken: _token,
                    repository: RepositoryProvider.of<Repository>(context),
                  ),
                ),
                BlocProvider(
                  create: (context) => QrscanBloc(
                    repository: RepositoryProvider.of<Repository>(context),
                  ),
                ),
                BlocProvider(
                  create: (context) => PaybillsBloc(
                    navigatorState: _navigatorKey,
                    repository: RepositoryProvider.of<Repository>(context),
                  ),
                ),
                BlocProvider(
                  create: (context) => BankBloc(
                    cancelToken: _token,
                    repository: RepositoryProvider.of<Repository>(context),
                  ),
                ),
                BlocProvider(
                  create: (context) => ActivityBloc(
                    repository: RepositoryProvider.of<Repository>(context),
                  ),
                ),
                BlocProvider(
                  create: (context) => SettingsBloc(
                    repository: RepositoryProvider.of<Repository>(context),
                  ),
                ),
                BlocProvider(
                  create: (context) => TierBloc(
                    repository: RepositoryProvider.of<Repository>(context),
                  ),
                ),
              ],
              child: MaterialApp(
                // showPerformanceOverlay: true,
                title: AppStrings.title,
                // locale: DevicePreview.of(context).locale,
                // builder: DevicePreview.appBuilder,
                debugShowCheckedModeBanner: false,
                navigatorKey: _navigatorKey,
                theme: ThemeData(
                  primaryColor: ColorSets.colorPrimaryWhite,
                  // This makes the visual density adapt to the platform that you run
                  // the app on. For desktop platforms, the controls will be smaller and
                  // closer together (more dense) than on mobile platforms.
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                ),
                home: BlocListener<HomeauthnavigationBloc,
                    HomeauthnavigationState>(
                  listener: (context, state) {
                    if (UniversalPlatform.isWeb) {
                    } else {
                      if (state is HomeauthnavigationError) {
                        showGeneralDialog(
                            context: context,
                            useRootNavigator: true,
                            pageBuilder: (context, _, __) {
                              return CustomDialogUI(
                                  icontitle: false,
                                  titleheader: AppStrings.errorTitle,
                                  subtitle: AppStrings.extractdeviceinfoContent,
                                  twobutton: false,
                                  discardtitle: null,
                                  discardtitleColor: null,
                                  discardColor: null,
                                  acceptedbutton: null,
                                  acceptedtitle: null,
                                  acceptedtitleColor: null,
                                  acceptedColor: null,
                                  centerbutton: () {
                                    BlocProvider.of<HomeauthnavigationBloc>(
                                            context)
                                        .add(CheckNavigation());
                                    Future.delayed(Duration(milliseconds: 900),
                                        () {
                                      Navigator.of(context, rootNavigator: true)
                                          .pop();
                                    });
                                  },
                                  centertitle:
                                      AppStrings.extractdeviceinfoRetry,
                                  centerColor: ColorSets.colorPrimaryRed,
                                  centertitleColor:
                                      ColorSets.colorPrimaryWhite);
                            },
                            barrierDismissible: false,
                            barrierLabel: '',
                            barrierColor: Colors.black.withOpacity(0.8),
                            transitionDuration: Duration(milliseconds: 300),
                            transitionBuilder: (context, animation, __, child) {
                              return SlideTransition(
                                position: Tween(
                                        begin: Offset(0, 1), end: Offset(0, 0))
                                    .animate(animation),
                                child: child,
                              );
                            });
                      }
                    }
                  },
                  child: BlocBuilder<HomeauthnavigationBloc,
                      HomeauthnavigationState>(builder: (context, state) {
                    if (UniversalPlatform.isWeb) {
                      // return HomeWebUI();
                      //return OtpCodeUIWeb();
                      return OnBoardingWelcomeUIWeb();
                    } else {
                      // if (state is HomeauthnavigationHome) {
                      //   return DashBoardUI();
                      // } else
                      if (state is HomeauthnavigationOnBoarding) {
                        return OnBoardingUI(); //todo: ADD OnBoardingUI() method not OnBoardMainUI()
                      } else if (state is HomeauthnavigationSwitchAccount) {
                        return SwitchAccountUI(
                            azatag: state.basicResponse.data);
                      }
                      return LoadingUI(
                        function: (_) {
                          BlocProvider.of<HomeauthnavigationBloc>(context)
                              .add(CheckNavigation());
                        },
                      );
                    }
                  }),
                ),

                ///localizationsDelegates allows the use of other widget in a particular app
                localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
                  DefaultCupertinoLocalizations.delegate,
                  DefaultWidgetsLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                onGenerateRoute: RouteGenerator.onGenerateRoute,
              )
              // : CupertinoApp(
              //     // showPerformanceOverlay: true,
              //     // locale: DevicePreview.of(context).locale,
              //     // builder: DevicePreview.appBuilder,
              //     title: AppStrings.title,
              //     debugShowCheckedModeBanner: false,
              //     theme: CupertinoThemeData(
              //         // primaryColor: ColorSets.colorPrimaryLightGreen,
              //         ),
              //     // initialRoute: AppRouteName.home,
              //     home: BlocListener<HomeauthnavigationBloc, HomeauthnavigationState>(
              //       listener: (context, state) {
              //         showGeneralDialog(
              //             context: context,
              //             useRootNavigator: true,
              //             pageBuilder: (context, _, __) {
              //               return CustomDialogUI(
              //                   icontitle: false,
              //                   titleheader: AppStrings.errorTitle,
              //                   subtitle: AppStrings.extractdeviceinfoContent,
              //                   twobutton: false,
              //                   discardtitle: null,
              //                   discardtitleColor: null,
              //                   discardColor: null,
              //                   acceptedbutton: null,
              //                   acceptedtitle: null,
              //                   acceptedtitleColor: null,
              //                   acceptedColor: null,
              //                   centerbutton: () {
              //                     BlocProvider.of<HomeauthnavigationBloc>(context).add(CheckNavigation());
              //                     Future.delayed(Duration(milliseconds: 2000), () {
              //                       Navigator.of(context, rootNavigator: true).pop();
              //                     });
              //                   },
              //                   centertitle: AppStrings.extractdeviceinfoRetry,
              //                   centerColor: ColorSets.colorPrimaryRed,
              //                   centertitleColor: ColorSets.colorPrimaryWhite);
              //             },
              //             barrierDismissible: false,
              //             barrierLabel: '',
              //             barrierColor: Colors.black.withOpacity(0.8),
              //             transitionDuration: Duration(milliseconds: 300),
              //             transitionBuilder: (context, animation, __, child) {
              //               return SlideTransition(
              //                 position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(animation),
              //                 child: child,
              //               );
              //             });
              //       },
              //       child: BlocBuilder<HomeauthnavigationBloc, HomeauthnavigationState>(builder: (context, state) {
              //         if (state is HomeauthnavigationHome) {
              //           return DashBoardUI();
              //         } else if (state is HomeauthnavigationOnBoarding) {
              //           return OnBoardingUI(); //todo: ADD OnBoardingUI() method not OnBoardMainUI()
              //         } else if (state is HomeauthnavigationSwitchAccount) {
              //           return SwitchAccountUI(azatag: state.basicResponse.data);
              //         }
              //         return LoadingUI(
              //           function: (_) {
              //             BlocProvider.of<HomeauthnavigationBloc>(context).add(CheckNavigation());
              //           },
              //         );
              //       }),
              //     ),

              //     ///localizationsDelegates allows the use of other widget in a particular app
              //     localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
              //       DefaultMaterialLocalizations.delegate,
              //       DefaultWidgetsLocalizations.delegate
              //     ],
              //     onGenerateRoute: RouteGenerator.onGenerateRoute,
              //   ),
              ),
        ),
      ),
    );
  }
}
