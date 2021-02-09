import 'package:azapay/app/app.dart';
import 'package:azapay/src/blocs/blocs.dart';
import 'package:azapay/src/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:money2/money2.dart';

class WalletUI extends StatefulWidget {
  @override
  _WalletUIState createState() => _WalletUIState();
}

class _WalletUIState extends State<WalletUI> {
  WalletBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = context.bloc<WalletBloc>();
    _bloc.add(WalletPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WalletBloc, WalletState>(builder: (context, state) {
      if (state is WalletStateLoaded) {
        return DashBoardBackgroundUI(
          carddisplay: true,
          height: 1.4,
          card: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(4.0, 4.0),
                      color: Colors.grey[500].withOpacity(0.3),
                      spreadRadius: 1.0,
                      blurRadius: 15.0,
                    ),
                    BoxShadow(
                      offset: Offset(-4.0, -4.0),
                      color: Colors.white.withOpacity(0.8),
                      spreadRadius: 1.0,
                      blurRadius: 15.0,
                    )
                  ],
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    colors: <Color>[Color(0XFFC68B00), Color(0XFFFFC300)],
                  )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      AppStrings.walletOne,
                      style: AppTextStyles.h3style.copyWith(fontSize: 18, color: ColorSets.colorPrimaryWhite),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      state.wallet?.data?.name.toUpperCase() ?? '-----',
                      style: AppTextStyles.h3style
                          .copyWith(color: ColorSets.colorPrimaryWhite, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Divider(
                      color: ColorSets.colorPrimaryWhite,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      AppStrings.walletTwo,
                      style: AppTextStyles.h3style.copyWith(fontSize: 18, color: ColorSets.colorPrimaryWhite),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                        '${AppStrings.nairaUnicode}${Money.from(state.wallet?.data?.balance ?? 0, Currency.create('USD', 2)).format('#,###.##')}',
                        style: AppTextStyles.h3style.copyWith(fontSize: 25, color: ColorSets.colorPrimaryWhite)),
                  ),
                ],
              ),
            ),
          ),
          title: AppStrings.walletThreeI,
          subtitle: AppStrings.walletThreeII,
          child: Column(
            // shrinkWrap: true,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, AppRouteName.walletloadaccount);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.0),
                                    color: ColorSets.colorGrey.withOpacity(0.4)),
                                child: Row(
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: SvgPicture.asset(AppVectors.walletnaira),
                                    ),
                                    Expanded(
                                      child: Center(
                                        child: Text(
                                          AppStrings.walletThreeIII,
                                          style: AppTextStyles.h3style.copyWith(fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(AppStrings.walletThreeIV),
                        InkWell(
                          onTap: () async {
                            await Clipboard.setData(ClipboardData(text: state?.wallet?.data?.key));
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
                            // Scaffold.of(context)
                            //   ..hideCurrentSnackBar()
                            //   ..showSnackBar(
                            //     SnackBar(
                            //       backgroundColor: ColorSets.colorPrimaryLightYellow,
                            //       content: Row(
                            //         mainAxisSize: MainAxisSize.min,
                            //         children: [
                            //           Text(
                            //             AppStrings.copied,
                            //             style: AppTextStyles.h3style.copyWith(
                            //                 color: ColorSets.colorPrimaryBlack, decoration: TextDecoration.underline),
                            //           ),
                            //         ],
                            //       ),
                            //     ),
                            //   );
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4.0),
                            child: Text(
                              state.wallet.data.key.isNotEmpty ? state?.wallet?.data?.key : 'No Account Yet',
                              style: AppTextStyles.h3style.copyWith(
                                color: ColorSets.colorPrimaryLightGreen,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 30),
                  child: Text(AppStrings.walletFive, style: AppTextStyles.h2style),
                ),
              ),
              if (state.contacts?.isNotEmpty)
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: state.contacts.length,
                      itemBuilder: (context, index) {
                        print(state.contacts[index].client);
                        return Card(
                          key: ValueKey(index),
                          elevation: 5.0,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                                  child: CircleAvatar(
                                    child: Icon(
                                      Icons.person,
                                    ),
                                  ),
                                ),
                                Text(state.contacts[index].client)
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                )
              else
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      AppStrings.noRecentContact,
                      style: AppTextStyles.h3style,
                    ),
                  ),
                ),
            ],
          ),
        );
      } else {
        return LoadingUI(function: (_) {});
      }
    });
  }
}
