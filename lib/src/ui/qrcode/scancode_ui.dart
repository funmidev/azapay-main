import 'package:azapay/src/blocs/blocs.dart';
import 'package:azapay/src/models/models.dart';
import 'package:azapay/src/ui/ui.dart';
import 'package:azapay/src/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:azapay/app/app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:money2/money2.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ScanQrCodeUI extends StatefulWidget {
  final int screen;
  ScanQrCodeUI({this.screen});
  @override
  _ScanQrCodeUIState createState() => _ScanQrCodeUIState();
}

class _ScanQrCodeUIState extends State<ScanQrCodeUI> {
  var qrText = '';
  QrscanBloc _bloc;
  ProfileBloc _profileBloc;
  TextEditingController _qrcodeamountController;

  @override
  void initState() {
    super.initState();
    _bloc = context.bloc<QrscanBloc>();
    _profileBloc = context.bloc<ProfileBloc>();
    _qrcodeamountController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();

    _bloc.add(QrClearScan());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //QrScan
        Center(
          child: QrImage(
            data: (_profileBloc.state is ProfileLoaded)
                ? (_profileBloc.state as ProfileLoaded).tag
                : AppStrings.azapayurl,
            version: QrVersions.auto,
            size: MediaQuery.of(context).size.width / 1.5,
            // padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height / 8),
            gapless: true,
          ),
        ),
        widget.screen == 1
            ? EmptyWidgetUI()
            : Text(
                '${AppStrings.qrCodefive}',
                style: AppTextStyles.h3style.copyWith(color: ColorSets.colorPrimaryBlack),
              ),
        widget.screen == 1
            ? EmptyWidgetUI()
            : RawMaterialButton(
                padding: EdgeInsets.all(15.0),
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) {
                          return InputMerchantAmountUI();
                        },
                        fullscreenDialog: true),
                  );
                },
                child: SvgPicture.asset(AppVectors.qrcodescan),
                elevation: 0.0,
                shape: CircleBorder(
                  side: BorderSide(color: Colors.yellow[800], width: 3),
                ),
                fillColor: ColorSets.colorPrimaryLightYellow,
              )
      ],
    );
  }
}

//  await showModalBottomSheet(
//                         enableDrag: false,
//                         isDismissible: false,
//                         isScrollControlled: true,
//                         useRootNavigator: true,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(10),
//                             topRight: Radius.circular(10),
//                           ),
//                         ),
//                         context: context,
//                         builder: (context) {
//                           return SingleChildScrollView(
//                             child: Container(
//                               child: Padding(
//                                 padding: const EdgeInsets.symmetric(vertical: 20.0),
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Align(
//                                         alignment: Alignment.center,
//                                         child: Padding(
//                                           padding: const EdgeInsets.all(20.0),
//                                           child: Text(
//                                             AppStrings.qrCodeamountTitle,
//                                             style: AppTextStyles.h2style,
//                                           ),
//                                         )),
//                                     Padding(
//                                       padding: const EdgeInsets.only(left: 8.0, top: 12.0, right: 8.0, bottom: 8.0),
//                                       child: AccountFormUI(
//                                         title: AppStrings.qrCodeamountSubtitle,
//                                         node: null,
//                                         controller: _qrcodeamountController,
//                                         hint: AppStrings.qrCodeamountHint,
//                                         action: TextInputAction.done,
//                                         type: TextInputType.number,
//                                         error: null,
//                                         maxlength: 11,
//                                         readOnly: false,
//                                         onChanged: null,
//                                       ),
//                                     ),
//                                     Padding(
//                                         padding: EdgeInsets.only(
//                                             right: 20, left: MediaQuery.of(context).size.width / 2, bottom: 20.0),
//                                         child: ButtonArrow(
//                                             navigatorfunc: _qrcodeamountController.text.isNotEmpty
//                                                 ? double.parse(_qrcodeamountController.text) >= 100
//                                                     ? () async {
//                                                         final amount = Money.from(
//                                                                 double.parse(_qrcodeamountController.text ?? 0),
//                                                                 Currency.create('USD', 2))
//                                                             .format('####.##')
//                                                             .toString();

//                                                         _bloc.add(
//                                                           QrScanAmount(
//                                                             amount: double.parse(amount),
//                                                             screen: 1,
//                                                           ),
//                                                         );
//                                                         await Navigator.of(context, rootNavigator: true).pop();
//                                                       }
//                                                     : () async {
//                                                         await showDialog(
//                                                             context: context,
//                                                             useSafeArea: false,
//                                                             useRootNavigator: true,
//                                                             builder: (context) {
//                                                               return CustomDialogUI(
//                                                                   icontitle: false,
//                                                                   titleheader: AppStrings.errorTitle,
//                                                                   subtitle: AppStrings.errorAmountInput,
//                                                                   twobutton: false,
//                                                                   discardtitle: null,
//                                                                   discardtitleColor: null,
//                                                                   discardColor: null,
//                                                                   acceptedbutton: null,
//                                                                   acceptedtitle: null,
//                                                                   acceptedtitleColor: null,
//                                                                   acceptedColor: null,
//                                                                   centerbutton: () async {
//                                                                     await Navigator.of(context, rootNavigator: true)
//                                                                         .pop();
//                                                                   },
//                                                                   centertitle: 'Dismiss',
//                                                                   centerColor: ColorSets.colorPrimaryRed,
//                                                                   centertitleColor: ColorSets.colorPrimaryWhite);
//                                                             });
//                                                       }
//                                                 : () async {
//                                                     await showDialog(
//                                                         context: context,
//                                                         useSafeArea: false,
//                                                         useRootNavigator: true,
//                                                         builder: (context) {
//                                                           return CustomDialogUI(
//                                                               icontitle: false,
//                                                               titleheader: AppStrings.emptyInput,
//                                                               subtitle: AppStrings.errorAmountInput,
//                                                               twobutton: false,
//                                                               discardtitle: null,
//                                                               discardtitleColor: null,
//                                                               discardColor: null,
//                                                               acceptedbutton: null,
//                                                               acceptedtitle: null,
//                                                               acceptedtitleColor: null,
//                                                               acceptedColor: null,
//                                                               centerbutton: () async {
//                                                                 await Navigator.of(context, rootNavigator: true).pop();
//                                                               },
//                                                               centertitle: 'Dismiss',
//                                                               centerColor: ColorSets.colorPrimaryRed,
//                                                               centertitleColor: ColorSets.colorPrimaryWhite);
//                                                         });
//                                                   },
//                                             buttontitle: AppStrings.doneBtn,
//                                             arrow: false,
//                                             buttontitleColor: ColorSets.colorPrimaryBlack))
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           );
//                         });
