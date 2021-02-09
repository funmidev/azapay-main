import 'package:azapay/app/app.dart';
import 'package:azapay/src/blocs/blocs.dart';
import 'package:azapay/src/models/models.dart';
import 'package:azapay/src/ui/ui.dart';
import 'package:azapay/src/widget/widget.dart';
import 'package:azapay/utils/utils.dart';
import 'package:camera/camera.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:money2/money2.dart';

class QrCodeScanCameraUI extends StatefulWidget {
  @override
  _QrCodeScanCameraUIState createState() => _QrCodeScanCameraUIState();
}

class _QrCodeScanCameraUIState extends State<QrCodeScanCameraUI> {
  ValueNotifier<bool> _flash;
  CameraController controller;
  QrscanBloc _qrscanBloc;
  bool _isDetecting = false;
  final BarcodeDetector _barcodeDetector = FirebaseVision.instance.barcodeDetector();

  @override
  void initState() {
    super.initState();
    _flash = ValueNotifier<bool>(false);
    _qrscanBloc = context.bloc<QrscanBloc>();
    _initializeCamera();
    
  }

  void _initializeCamera() async {
     var cameras = await availableCameras();
      controller = CameraController(
          cameras[0], defaultTargetPlatform == TargetPlatform.iOS ? ResolutionPreset.low : ResolutionPreset.medium);
      await controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
      await controller.startImageStream((CameraImage image) {
        if (_isDetecting) return;

        _isDetecting = true;

        Scanner.detect(
          image: image,
          detectInImage: _barcodeDetector.detectInImage,
          imageRotation: controller.description.sensorOrientation,
        ).then(
          (dynamic results) {
            _qrscanBloc.add(QrScanResult(result: results));
          },
        ).whenComplete(() => _isDetecting = false);
      });
  }


  @override
  void dispose() {
    controller.dispose().then((_) {
      _barcodeDetector.close();
      _qrscanBloc.add(QrClearScan());
    });

    // _currentDetector = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TransactionpinBloc, TransactionpinState>(
      listener: (context, state) {
        if (state is TransactionpinChecked) {
          Future.delayed(Duration(seconds: 1), () async {
            _qrscanBloc.add(SendFundQrScan());
          });
        }
      },
      child: BlocConsumer<QrscanBloc, QrscanState>(
        listener: (context, state) async {
          if (state is QrScanLoaded) {
            // if (state.screen == 0) {
            if (state.success == 200) {
              await Navigator.of(context, rootNavigator: true).pop();
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
              _qrscanBloc.add(QrClearScan());
            } else if (state.error >= 400) {
              await Navigator.of(context, rootNavigator: true).pop();
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
              
              _qrscanBloc.add(QrClearScan());
            } else if (state.result.isNotEmpty) {
              await Navigator.of(context, rootNavigator: true).pop();
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CustomTicketDetails(
                    ticketDetails: TicketDetails(
                        buttontitle: AppStrings.proceedbtn,
                        buttontitlecolor: ColorSets.colorPrimaryBlack,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 25.0, bottom: 5),
                              child: Text(
                                'Merchant Transfer',
                                style: AppTextStyles.h2style,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0, bottom: 30),
                              child: Text(
                                '--------------------------------',
                                style: AppTextStyles.h2style.copyWith(color: ColorSets.colorGrey.withOpacity(0.4)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5.0),
                              child: Table(
                                children: [
                                  TableRow(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 2),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text(AppStrings.transferdetails,
                                                style: AppTextStyles.h3style.copyWith(fontSize: 18)),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  TableRow(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Text(AppStrings.recipient,
                                                  textAlign: TextAlign.start, style: AppTextStyles.h3style),
                                            ),
                                            Expanded(
                                              child: Text(state.result,
                                                  textAlign: TextAlign.right,
                                                  style: AppTextStyles.h3style.copyWith(fontWeight: FontWeight.bold)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  TableRow(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Text(AppStrings.transferAmount,
                                                  textAlign: TextAlign.start, style: AppTextStyles.h3style),
                                            ),
                                            Expanded(
                                              child: Text('${AppStrings.nairaUnicode}${state.amount.toString()}',
                                                  textAlign: TextAlign.end,
                                                  style: AppTextStyles.h3style.copyWith(fontWeight: FontWeight.bold)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  (_qrscanBloc.state as QrScanLoaded).amount >= 5000
                                      ? TableRow(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(AppStrings.transferTransactionFee,
                                                      textAlign: TextAlign.start, style: AppTextStyles.h3style),
                                                  Text(
                                                      '${AppStrings.nairaUnicode}${AppStrings.transferTransactionFeeAmount}',
                                                      textAlign: TextAlign.end,
                                                      style:
                                                          AppTextStyles.h3style.copyWith(fontWeight: FontWeight.bold)),
                                                ],
                                              ),
                                            ),
                                          ],
                                        )
                                      : TableRow(children: [
                                          Column(
                                            children: [],
                                          )
                                        ]),
                                  TableRow(
                                    children: [
                                      Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(top: 20.0, bottom: 5),
                                            child: Text(
                                              '--------------------------------',
                                              style: AppTextStyles.h2style
                                                  .copyWith(color: ColorSets.colorGrey.withOpacity(0.4)),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 20),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(AppStrings.transferTotal, style: AppTextStyles.h2style),
                                                Text(
                                                    '${AppStrings.nairaUnicode}${Money.from(state.amount >= 5000 ? state.amount + 5 : state.amount, Currency.create('USD', 2)).format('#,###.##')}',
                                                    style: AppTextStyles.h2style),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        width: MediaQuery.of(context).size.width / 1.2,
                        navigate: () async {
                          await Navigator.of(context, rootNavigator: true).pop();
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return TransactionUI();
                              },
                              fullscreenDialog: true,
                            ),
                          );
                        },
                        arrow: false),
                  ),
                  fullscreenDialog: true,
                ),
              );
            }
          } else if (state is QrScanLoading) {
            await showGeneralDialog(
                context: context,
                pageBuilder: (context, _, __) {
                  return LoadingUI(
                    showtext: true,
                    function: (_) {},
                  );
                },
                barrierDismissible: true,
                useRootNavigator: true,
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
        },
        builder: (context, state) => ValueListenableBuilder<bool>(
          valueListenable: _flash,
          builder: (context, value, child) => Scaffold(
              backgroundColor: Colors.black.withOpacity(0.8),
              extendBodyBehindAppBar: false,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                leading: IconButton(
                  icon: Icon(Icons.clear, color: ColorSets.colorPrimaryWhite),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                actions: [
                  // IconButton(
                  //   onPressed: () {
                  //     controller
                  //   },
                  //   icon: Icon(
                  //     Icons.flash_on,
                  //     color: ColorSets.colorPrimaryWhite,
                  //   ),
                  // )
                ],
              ),
              body: SafeArea(
                child: Column(
                  children: [
                    Expanded(
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          controller==null
                              ? const Center(
                                  child: Text(
                                    'Initializing Camera...',
                                    style: TextStyle(
                                      color: ColorSets.colorPrimaryLightYellow,
                                      fontSize: 5.0,
                                    ),
                                  ),
                                )
                              : AspectRatio(
                                  aspectRatio: controller.value.aspectRatio, child: CameraPreview(controller)),
                          ColorFiltered(
                            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.srcOut),
                            child: Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(color: Colors.black, backgroundBlendMode: BlendMode.dstOut),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(30.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.red,
                                              border: Border.all(
                                                color: ColorSets.colorPrimaryWhite,
                                                width: 4,
                                              ),
                                              borderRadius: BorderRadius.circular(15),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text(
                                          AppStrings.qrCodefive,
                                          style: AppTextStyles.h3style.copyWith(),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: ColorSets.colorPrimaryWhite,
                      height: MediaQuery.of(context).size.height / 5,
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RawMaterialButton(
                            splashColor: Colors.transparent,
                            padding: EdgeInsets.all(15.0),
                            onPressed: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return QRCodeUI(
                                      qrScan: QrScan(whichscreen: 1),
                                    );
                                  },
                                  fullscreenDialog: true,
                                ),
                              );
                            },
                            child: SvgPicture.asset(AppVectors.qrcodescan),
                            elevation: 0.0,
                            shape: CircleBorder(
                              side: BorderSide(color: Colors.yellow[800], width: 3),
                            ),
                            fillColor: ColorSets.colorPrimaryLightYellow,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'My Code',
                              style: AppTextStyles.h3style.copyWith(color: ColorSets.colorPrimaryBlack),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
