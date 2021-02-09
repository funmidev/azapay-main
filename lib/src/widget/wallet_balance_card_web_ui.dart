import 'package:azapay/app/app.dart';
import 'package:azapay/src/blocs/blocs.dart';
import 'package:azapay/src/widget/widget.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money2/money2.dart';

class WalletBalanceCardUI extends StatefulWidget {
  final bool walletlinkbank;

  const WalletBalanceCardUI({Key key, this.walletlinkbank = true}) : super(key: key);

  @override
  _WalletBalanceCardUIState createState() => _WalletBalanceCardUIState();
}

class _WalletBalanceCardUIState extends State<WalletBalanceCardUI> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WalletBloc, WalletState>(
      builder: (context, state) => Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Container(
          height: MediaQuery.of(context).size.height / 3.5,
          width: MediaQuery.of(context).size.width / 3,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: Color(0XFFFFB300),
              width: 1,
            ),
            gradient: LinearGradient(
              stops: [0.5, 0.9],
              colors: [
                ColorSets.colorPrimaryWhite,
                ColorSets.colorPrimaryLightYellow,
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image(
                          image: AssetImage(AppImages.webazapaylogo),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            AppStrings.walletwebAzaAccountTitle,
                            style: AppTextStyles.h3style.copyWith(fontWeight: FontWeight.w500, fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      (state is WalletStateLoaded)
                          ? '${state.wallet?.data?.name?.toUpperCase() ?? '-----'}'
                          : AppStrings.empty,
                      style: AppTextStyles.h3style.copyWith(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                    InkWell(
                      onTap: () {
                        Clipboard.setData(ClipboardData(
                            text: (state is WalletStateLoaded) ? state?.wallet?.data?.key : AppStrings.empty));
                      },
                      child: Row(
                        children: [
                          Text((state is WalletStateLoaded) ? '${state.wallet.data.key}' : AppStrings.empty,
                              style: AppTextStyles.h3style.copyWith(fontWeight: FontWeight.w500)),
                          Icon(FluentIcons.document_copy_24_regular)
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(AppStrings.walletwebbalanceTitle,
                        style: AppTextStyles.h3style.copyWith(fontWeight: FontWeight.w500)),
                    Text(
                        '${AppStrings.nairaUnicode}${(Money.from((state is WalletStateLoaded) ? state.wallet.data.balance : 0.0, Currency.create('USD', 2)).format('#,###.##'))}',
                        style: AppTextStyles.h3style.copyWith(fontWeight: FontWeight.w600, fontSize: 18)),
                    widget.walletlinkbank
                        ? RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            onPressed: () {},
                            color: ColorSets.colorPrimaryWhite,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 8.0),
                              child: Text(
                                AppStrings.walletwebLinkBank,
                                style: AppTextStyles.h3style,
                              ),
                            ),
                          )
                        : EmptyWidgetUI()
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
