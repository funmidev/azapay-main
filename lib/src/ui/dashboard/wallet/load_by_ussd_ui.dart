import 'package:azapay/app/app.dart';
import 'package:azapay/src/blocs/blocs.dart';
import 'package:azapay/src/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class LoadByUssdUI extends StatelessWidget {
  final List<String> banks = [
    // AppStrings.gtbank,
    AppStrings.accessbank,
    AppStrings.polarisbank,
    // AppStrings.ubabank,
    AppStrings.zenithbank,
    AppStrings.firstbank,
    AppStrings.fidelitybank,
    AppStrings.ecobank,
    AppStrings.unionbank,
    AppStrings.sterlingbank,
    AppStrings.stanbicbank,
    AppStrings.wemabank,
    AppStrings.standardchartered,
    // AppStrings.ubabank,
    // AppStrings.heritagebank,
    // AppStrings.fcmbbank,
    // AppStrings.jaizbank,
    // AppStrings.unitybank,
    AppStrings.keystonebank,
  ];

  final List<String> bankussdcode = [
    // AppStrings.gtbankcode,
    AppStrings.accessbankcode,
    AppStrings.polarisbankcode,
    // AppStrings.ubabankcode,
    AppStrings.zenithbankcode,
    AppStrings.firstbankcode,
    AppStrings.fidelitybankcode,
    AppStrings.ecobankcode,
    AppStrings.unionbankcode,
    AppStrings.sterlingbankcode,
    AppStrings.stanbicbankcode,
    AppStrings.wemabankcode,
    AppStrings.standardcharteredcode,
    // AppStrings.ubabankcode,
    //AppStrings.heritagebankcode,
    //  AppStrings.fcmbbankcode,
    // AppStrings.jaizbankcode,
    // AppStrings.unitybankcode,
    AppStrings.keystonebankcode,
  ];

  @override
  Widget build(BuildContext context) {
    final _walletBloc = context.bloc<WalletBloc>();

    return PaymentBackgroundUI(
        titlebar: Text(
          AppStrings.loadbyUssdTitle,
          style: AppTextStyles.h3style.copyWith(fontWeight: FontWeight.w600, fontSize: 20),
        ),
        contentbody: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                AppStrings.loadbyUssdDetails,
                textAlign: TextAlign.left,
                style: AppTextStyles.h3style.copyWith(color: Color(0XFF818181)),
              ),
            ),
            BlocBuilder<WalletBloc, WalletState>(
              builder: (context, state) {
                return LoadItem(
                  padding: 5,
                  prefixtitle: Expanded(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            AppStrings.loadbyTransferAccountNumber,
                            style: AppTextStyles.h3style.copyWith(color: ColorSets.colorPrimaryBlack.withOpacity(0.5)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: FlatButton(
                            disabledColor: ColorSets.disableButtonColor,
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            padding: EdgeInsets.zero,
                            child: Text(AppStrings.loadbyTransferShare),
                            onPressed: () {
                              Clipboard.setData(
                                  ClipboardData(text: (_walletBloc.state as WalletStateLoaded)?.wallet?.data?.key));
                              showToast(AppStrings.copied,
                                  backgroundColor: ColorSets.colorPrimaryLightYellow,
                                  context: context,
                                  animation: StyledToastAnimation.slideFromTop,
                                  reverseAnimation: StyledToastAnimation.slideToTop,
                                  position: StyledToastPosition.top,
                                  startOffset: Offset(0.0, -3.0),
                                  reverseEndOffset: Offset(0.0, -3.0),
                                  duration: Duration(seconds: 4),
                                  //Animation duration   animDuration * 2 <= duration
                                  animDuration: Duration(seconds: 1),
                                  curve: Curves.elasticOut,
                                  reverseCurve: Curves.fastOutSlowIn);
                            },
                            color: ColorSets.colorPrimaryLightYellow,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  suffixdetails: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text(
                      (state as WalletStateLoaded).wallet.data.key,
                      style: AppTextStyles.h3style,
                    ),
                  ),
                );
              },
            ),
            // LoadItem(
            //   padding: 0.0,
            //   prefixtitle: FlatButton(
            //     padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 15),
            //     color: ColorSets.colorPrimaryLightYellow,
            //     onPressed: () {
            //       Clipboard.setData(ClipboardData(text: (_walletBloc.state as WalletStateLoaded)?.wallet?.data?.key));
            //       showToast(AppStrings.copied,
            //           backgroundColor: ColorSets.colorPrimaryLightYellow,
            //           context: context,
            //           animation: StyledToastAnimation.slideFromTop,
            //           reverseAnimation: StyledToastAnimation.slideToTop,
            //           position: StyledToastPosition.top,
            //           startOffset: Offset(0.0, -3.0),
            //           reverseEndOffset: Offset(0.0, -3.0),
            //           duration: Duration(seconds: 4),
            //           //Animation duration   animDuration * 2 <= duration
            //           animDuration: Duration(seconds: 1),
            //           curve: Curves.elasticOut,
            //           reverseCurve: Curves.fastOutSlowIn);
            //       // Scaffold.of(context).showSnackBar(
            //       //   SnackBar(
            //       //     backgroundColor: ColorSets.colorPrimaryLightYellow,
            //       //     content: Row(
            //       //       mainAxisSize: MainAxisSize.min,
            //       //       children: [
            //       //         Text(
            //       //           AppStrings.copied,
            //       //           style: AppTextStyles.h3style.copyWith(color: ColorSets.colorPrimaryBlack),
            //       //         ),
            //       //       ],
            //       //     ),
            //       //   ),
            //       // );
            //     },
            //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
            //     child: Text(
            //       AppStrings.loadbyUssdCopy,
            //       style: AppTextStyles.h3style,
            //     ),
            //   ),
            //   suffixdetails: Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 15.0),
            //     child: Text(
            //       (_walletBloc.state as WalletStateLoaded).wallet.data.key,
            //       style: AppTextStyles.h3style,
            //       textAlign: TextAlign.center,
            //     ),
            //   ),
            // ),
            LoadItem(
              prefixtitle: Expanded(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  AppStrings.loadbyUssdBank,
                  style: AppTextStyles.h3style,
                  textAlign: TextAlign.left,
                ),
              )),
              suffixdetails: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  AppStrings.loadbyUssdBankName,
                  style: AppTextStyles.h3style,
                  textAlign: TextAlign.right,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      AppStrings.linkbankAccountType,
                      style: AppTextStyles.h3style,
                    ),
                  ),
                  OptionSelectionItemUI(
                    icon: '',
                    title: AppStrings.bankUssdCode,
                    onTapped: () {
                      showModalBottomSheet(
                        context: context,
                        enableDrag: true,
                        isDismissible: true,
                        useRootNavigator: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                        ),
                        builder: (context) {
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Align(
                                  alignment: Alignment.topCenter,
                                  child: CustomDivider(),
                                ),
                              ),
                              Expanded(
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: banks.length,
                                  itemBuilder: (context, index) {
                                    return BlocBuilder<BankBloc, BankState>(
                                      builder: (context, state) {
                                        return ListTile(
                                          leading: Padding(
                                            padding: const EdgeInsets.only(left: 8.0),
                                            child: Text(
                                              banks.elementAt(index),
                                              style: AppTextStyles.h3style,
                                            ),
                                          ),
                                          trailing: Padding(
                                            padding: const EdgeInsets.only(right: 8.0),
                                            child: Text(
                                              bankussdcode.elementAt(index),
                                              style: AppTextStyles.h3style.copyWith(fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    suffix: true,
                    suffixicon: Icon(Icons.keyboard_arrow_down),
                  ),
                ],
              ),
            ),
            // LoadItem(
            //   prefixtitle: Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 8.0),
            //     child: Image.asset(
            //       AppImages.gtbank,
            //       width: 25,
            //       height: 25,
            //     ),
            //   ),
            //   suffixdetails: Expanded(
            //     child: Padding(
            //       padding: const EdgeInsets.only(right: 30.0),
            //       child: Text(
            //         '''GTBank *737#''',
            //         textAlign: TextAlign.center,
            //         style: AppTextStyles.h3style,
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ));
  }
}
