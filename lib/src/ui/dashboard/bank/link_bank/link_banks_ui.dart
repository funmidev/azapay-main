import 'package:awesome_card/awesome_card.dart';
import 'package:azapay/app/app.dart';
import 'package:azapay/src/blocs/blocs.dart';
import 'package:azapay/src/widget/widget.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class LinkBanksUI extends StatefulWidget {
  @override
  _LinkBanksUIState createState() => _LinkBanksUIState();
}

class _LinkBanksUIState extends State<LinkBanksUI> {
  BankBloc _bloc;
  @override
  void initState() {
    super.initState();
    _bloc = context.bloc<BankBloc>();
    _bloc.add(FetchLinkBank());
  }

  @override
  Widget build(BuildContext context) {
    return PaymentBackgroundUI(
      titlebar: Text(
        AppStrings.bankThreeI,
        style: AppTextStyles.h3style.copyWith(
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),
      ),
      contentbody: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: ListTile(
                leading: Container(
                  decoration: BoxDecoration(
                    color: ColorSets.colorPin,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Icon(
                      Icons.add,
                      color: ColorSets.colorPrimaryLightYellow,
                    ),
                  ),
                ),
                title: Text(
                  AppStrings.linkbankOne,
                  style: AppTextStyles.h3style,
                ),
                onTap: () {
                  Navigator.pushNamed(context, AppRouteName.banklinkaccount);
                },
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10, top: 20, left: 10),
                child: Text(
                  '${AppStrings.bankThreeI}s',
                  textAlign: TextAlign.left,
                  style: AppTextStyles.h3style.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            BlocBuilder<BankBloc, BankState>(
              builder: (context, state) {
                if (state is BankLoaded) {
                  if (state.linkbank.data.isNotEmpty) {
                    return Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.linkbank.data.length,
                        physics: AlwaysScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final linkbank = state.linkbank.data.elementAt(index);

                          return Card(
                            elevation: 3.0,
                            color: ColorSets.colorPin,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                              side: BorderSide(
                                color: ColorSets.colorPrimaryBlack,
                                width: 1,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: ListTile(
                                onTap: () async {
                                  await showGeneralDialog(
                                      context: context,
                                      pageBuilder: (context, _, __) {
                                        return Material(
                                          child: CreditCard(
                                            cardNumber: linkbank.accountNo,
                                            cardExpiry: '',
                                            cardHolderName: linkbank.accountName,
                                            cvv: '',
                                            bankName: linkbank.bankName,
                                            cardType: CardType.masterCard, // Optional if you want to override Card Type
                                            showBackSide: false,
                                            frontBackground: Container(
                                              width: double.maxFinite,
                                              height: double.maxFinite,
                                              color: ColorSets.colorPrimaryLightYellow,
                                            ),
                                            backBackground: CardBackgrounds.white,
                                            showShadow: true,
                                          ),
                                        );
                                      },
                                      barrierDismissible: true,
                                      barrierLabel: '',
                                      useRootNavigator: true,
                                      barrierColor: Colors.black.withOpacity(0.8),
                                      transitionDuration: Duration(milliseconds: 300),
                                      transitionBuilder: (context, animation, __, child) {
                                        return SlideTransition(
                                          position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(animation),
                                          child: child,
                                        );
                                      });
                                },
                                leading: CircleAvatar(
                                  backgroundColor: ColorSets.colorPrimaryWhite.withOpacity(0.8),
                                  child: Icon(
                                    Icons.account_balance,
                                    color: ColorSets.colorPrimaryLightYellow,
                                  ),
                                ),
                                trailing: Text(
                                    DateFormat.jms().format(
                                      DateTime.parse(linkbank.createdAt),
                                    ),
                                    style: AppTextStyles.h3style),
                                subtitle: Text(linkbank.accountNo, style: AppTextStyles.h3style),
                                title: Text(
                                  linkbank.accountName,
                                  style: AppTextStyles.h3style.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    return Container(
                      height: MediaQuery.of(context).size.width / 2,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                AppStrings.linkbankEmptyTitle,
                                style: AppTextStyles.h2style.copyWith(fontSize: 18),
                              ),
                              Text(
                                AppStrings.linkbankEmptySubTitle,
                                style: AppTextStyles.h3style,
                              ),
                            ],
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: ColorSets.colorPin),
                    );
                  }
                } else {
                  return Expanded(
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: CircularProgressIndicator(
                          strokeWidth: 10,
                          backgroundColor: ColorSets.colorPrimaryWhite,
                          valueColor: AlwaysStoppedAnimation<Color>(Color(0XFFFFB300)),
                        ),
                      ),
                    ),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
