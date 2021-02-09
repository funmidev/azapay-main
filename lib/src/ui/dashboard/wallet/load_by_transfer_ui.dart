import 'package:azapay/app/app.dart';
import 'package:azapay/src/blocs/blocs.dart';
import 'package:azapay/src/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class LoadByTransferUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _walletBloc = context.bloc<WalletBloc>();

    return PaymentBackgroundUI(
      titlebar: Text(
        AppStrings.loadbyTransferTitle,
        style: AppTextStyles.h3style.copyWith(fontWeight: FontWeight.w600, fontSize: 20),
      ),
      contentbody: BlocBuilder<WalletBloc, WalletState>(
        builder: (context, state) => Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                AppStrings.loadbyTransferDetails,
                textAlign: TextAlign.left,
                style: AppTextStyles.h3style,
              ),
            ),
            LoadItem(
              prefixtitle: Expanded(
                child: Text(
                  AppStrings.loadbyTransferBank,
                  style: AppTextStyles.h3style.copyWith(
                    color: ColorSets.colorPrimaryBlack.withOpacity(0.5),
                  ),
                ),
              ),
              suffixdetails: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Text(
                  AppStrings.loadbyUssdBankName,
                  style: AppTextStyles.h3style,
                ),
              ),
            ),
            LoadItem(
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
            ),
            LoadItem(
              prefixtitle: Expanded(
                child: Text(
                  AppStrings.loadbyTransferName,
                  style: AppTextStyles.h3style.copyWith(color: ColorSets.colorPrimaryBlack.withOpacity(0.5)),
                ),
              ),
              suffixdetails: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Text(
                  (state as WalletStateLoaded).wallet.data.name,
                  style: AppTextStyles.h3style,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
