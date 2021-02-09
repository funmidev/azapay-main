import 'package:azapay/app/app.dart';
import 'package:azapay/src/blocs/bank/bank_bloc.dart';
import 'package:azapay/src/blocs/blocs.dart';
import 'package:azapay/src/models/models.dart';
import 'package:azapay/src/ui/ui.dart';
import 'package:azapay/src/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddBeneficiaryAccountUI extends StatefulWidget {
  @override
  _AddBeneficiaryAccountUIState createState() => _AddBeneficiaryAccountUIState();
}

class _AddBeneficiaryAccountUIState extends State<AddBeneficiaryAccountUI> {
  BankBloc _bloc;
  final List<String> accountType = [
    AppStrings.accounttypeSaving,
    AppStrings.accounttypeFixed,
    AppStrings.accounttypeCurrent
  ];
  TextEditingController _searchController;
  @override
  void initState() {
    super.initState();
    _bloc = context.bloc<BankBloc>();
    _bloc.add(FetchListBank());
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.add(ClearBankForm());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<TransactionpinBloc, TransactionpinState>(
          listener: (context, state) {
            if (state is TransactionpinChecked) {
              Future.delayed(Duration(seconds: 1), () async {
                await _bloc.add(SubmitLinkBankAccount(option: 0));
              });
            }
          },
        ),
      ],
      child: BlocConsumer<BankBloc, BankState>(listener: (context, state) async {
        if (state is BankLoaded) {
          if (state.success == 200) {
            // await Navigator.of(context, rootNavigator: true).pop();

            await Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) {
                  return TransactionResponseUI(
                    icon: Icons.done,
                    iconcolor: ColorSets.colorPrimaryWhite,
                    color: ColorSets.colorPrimaryLightGreen,
                    responsetitle: state.responsemessage,
                    responsemessage: '',
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
            await _bloc.add(ClearBankForm());
            // await Navigator.of(context, rootNavigator: true).pop();
            //todo: show success dialog
          } else if (state.error >= 400) {
            // await Navigator.of(context, rootNavigator: true).pop();
            // await _bloc.add(ClearBankForm());
            await Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) {
                  return TransactionResponseUI(
                    icon: Icons.clear,
                    iconcolor: ColorSets.colorPrimaryWhite,
                    color: ColorSets.colorPrimaryRed,
                    responsetitle: state.responsemessage,
                    responsemessage: '',
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
            await _bloc.add(ClearBankForm());
            // await Navigator.of(context, rootNavigator: true).pop();
          }
        }
      }, builder: (context, state) {
        if (state is BankLoaded) {
          return PaymentBackgroundUI(
            titlebar: Text(AppStrings.linkbankOne,
                style: AppTextStyles.h3style.copyWith(fontWeight: FontWeight.w600, fontSize: 20)),
            contentbody: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListView(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppStrings.linkbankBeneficiaryTitle,
                        style: AppTextStyles.h3style,
                      ),
                      OptionSelectionItemUI(
                        icon: '',
                        title: state.isRadioSelectedBank != null
                            ? state.bankname
                            : AppStrings.linkbankBeneficiaryTitleItemSelection,
                        asset: state.isRadioSelectedBank != null ? false : false,
                        assetvector: null,
                        onTapped: () {
                          showModalBottomSheet(
                              useRootNavigator: true,
                              enableDrag: true,
                              isDismissible: true,
                              isScrollControlled: true,
                              context: context,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                              ),
                              builder: (context) {
                                // print(state.banklist.length);
                                return BlocBuilder<BankBloc, BankState>(
                                  builder: (context, state) {
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: Container(
                                        height: MediaQuery.of(context).size.height / 1.2, // your desired height here
                                        width: double.infinity,
                                        color: Colors.white,

                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: Align(
                                                alignment: Alignment.topCenter,
                                                child: CustomDivider(),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(5.0),
                                              child: FormFieldUI(
                                                currentnode: null,
                                                fieldController: _searchController,
                                                hint: AppStrings.activitySearchHint,
                                                contentpad: 12,
                                                prefixicon: InkWell(
                                                  onTap: () {
                                                    _searchController.clear();
                                                  },
                                                  child: (state as BankLoaded).searchtext.isEmpty
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
                                                onchanged: (search) => _bloc.add(
                                                  SearchBankList(search: search.toUpperCase()),
                                                ),
                                              ),
                                            ),
                                            if ((state as BankLoaded).searchtext.isNotEmpty &&
                                                (state as BankLoaded)
                                                    .banklist
                                                    .where((bankList) =>
                                                        bankList.bankname.contains((state as BankLoaded)?.searchtext))
                                                    .isNotEmpty) ...[
                                              Expanded(
                                                child: ListView.builder(
                                                    shrinkWrap: true,
                                                    itemCount: (state as BankLoaded)
                                                        .banklist
                                                        .where((bankList) => bankList.bankname
                                                            .contains((state as BankLoaded).searchtext))
                                                        .length,
                                                    itemBuilder: (context, index) {
                                                      return BlocBuilder<BankBloc, BankState>(
                                                        builder: (context, state) => LabeledRadio(
                                                            title: AppStrings.empty,
                                                            label: (state as BankLoaded)
                                                                .banklist
                                                                .where((bankList) => bankList.bankname
                                                                    .contains((state as BankLoaded)?.searchtext))
                                                                .elementAt(index)
                                                                .bankname,
                                                            padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                                            groupValue: (state as BankLoaded).isRadioSelectedBank,
                                                            value: index,
                                                            onChanged: (value) async {
                                                              _bloc.add(BankId(
                                                                  bankcode: (state as BankLoaded)
                                                                      .banklist
                                                                      .where((bankList) => bankList.bankname
                                                                          .contains((state as BankLoaded)?.searchtext))
                                                                      .elementAt(index)
                                                                      .bankcode));
                                                              _bloc.add(BankName(
                                                                  bankname: (state as BankLoaded)
                                                                      .banklist
                                                                      .where((bankList) => bankList.bankname
                                                                          .contains((state as BankLoaded)?.searchtext))
                                                                      .elementAt(index)
                                                                      .bankname));
                                                              _bloc.add(IsRadioSelectedBank(selecteditem: value));
                                                              await Navigator.of(context, rootNavigator: true).pop();
                                                            },
                                                            vector: false,
                                                            vectorpath: 'beneficiarybank.keys.elementAt(index)'),
                                                      );
                                                    }),
                                              ),
                                            ],
                                            if ((state as BankLoaded).searchtext.isNotEmpty &&
                                                (state as BankLoaded)
                                                    .banklist
                                                    .where((bankList) =>
                                                        bankList.bankname.contains((state as BankLoaded)?.searchtext))
                                                    .isEmpty) ...[
                                              Center(
                                                child: Text(
                                                  AppStrings.noSearchResult,
                                                  style: AppTextStyles.h3style.copyWith(
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              )
                                            ],
                                            if ((state as BankLoaded).searchtext.isEmpty) ...[
                                              Expanded(
                                                child: ListView.builder(
                                                    shrinkWrap: true,
                                                    itemCount: (state as BankLoaded).banklist.length,
                                                    itemBuilder: (context, index) {
                                                      return BlocBuilder<BankBloc, BankState>(
                                                        builder: (context, state) => LabeledRadio(
                                                            title: AppStrings.empty,
                                                            label: (state as BankLoaded)
                                                                .banklist
                                                                .elementAt(index)
                                                                .bankname,
                                                            padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                                            groupValue: (state as BankLoaded).isRadioSelectedBank,
                                                            value: index,
                                                            onChanged: (value) async {
                                                              _bloc.add(BankId(
                                                                  bankcode: (state as BankLoaded)
                                                                      .banklist
                                                                      .elementAt(value)
                                                                      .bankcode));
                                                              _bloc.add(BankName(
                                                                  bankname: (state as BankLoaded)
                                                                      .banklist
                                                                      .elementAt(value)
                                                                      .bankname));
                                                              _bloc.add(IsRadioSelectedBank(selecteditem: value));
                                                              await Navigator.of(context, rootNavigator: true).pop();
                                                            },
                                                            vector: false,
                                                            vectorpath: 'beneficiarybank.keys.elementAt(index)'),
                                                      );
                                                    }),
                                              ),
                                            ]
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              });
                        },
                        suffix: true,
                        suffixicon: Icon(Icons.keyboard_arrow_down),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.linkbankAccountNumber,
                        style: AppTextStyles.h3style,
                      ),
                      Builder(
                        builder: (context) => InkWell(
                          onTap: state.bankcode.isEmpty
                              ? () {
                                  // print(1);
                                  showToast(AppStrings.bankCodeRequired,
                                      backgroundColor: ColorSets.colorPrimaryRed,
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
                                  // Scaffold.of(context).showSnackBar(
                                  //   SnackBar(
                                  //     backgroundColor: ColorSets.colorPrimaryRed,
                                  //     content: Row(
                                  //       mainAxisSize: MainAxisSize.min,
                                  //       children: [
                                  //         Text(
                                  //           AppStrings.bankCodeRequired,
                                  //           style: AppTextStyles.h3style.copyWith(color: ColorSets.colorPrimaryWhite),
                                  //         ),
                                  //       ],
                                  //     ),
                                  //   ),
                                  // );
                                }
                              : null,
                          child: IgnorePointer(
                            ignoring: state.bankcode.isEmpty ? true : false,
                            child: FormFieldUI(
                                currentnode: null,
                                fieldController: null,
                                hint: AppStrings.linkbankAccountNumberHint,
                                textInputAction: TextInputAction.done,
                                textInputType: TextInputType.number,
                                maxLength: 10,
                                // readOnly: state.bankcode.isEmpty ? true : false,
                                errorText: null,
                                textAlign: TextAlign.center,
                                onchanged: (value) {
                                  if (value.length >= 10) {
                                    _bloc.add(AccountNumber(number: value, bankcode: state.bankcode));
                                    FocusScope.of(context).unfocus();
                                    showToast(AppStrings.pleaseWait,
                                        backgroundColor: ColorSets.colorPrimaryLightGreen,
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
                                    // Scaffold.of(context).showSnackBar(
                                    //   SnackBar(
                                    //     backgroundColor: ColorSets.colorPrimaryLightYellow,
                                    //     content: Row(
                                    //       mainAxisSize: MainAxisSize.min,
                                    //       children: [
                                    //         Text(
                                    //           AppStrings.pleaseWait,
                                    //           style: AppTextStyles.h3style.copyWith(color: ColorSets.colorPrimaryBlack),
                                    //         ),
                                    //       ],
                                    //     ),
                                    //   ),
                                    // );
                                  } else {
                                    return null;
                                  }
                                }),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.linkbankAccountName,
                        style: AppTextStyles.h3style,
                      ),
                      FormFieldUI(
                          currentnode: null,
                          fieldController: TextEditingController(text: state.acctname),
                          hint: AppStrings.linkbankAccountNameHint,
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.text,
                          textAlign: TextAlign.center,
                          readOnly: true,
                          errorText: null,
                          onchanged: null //(value) => _bloc.add(AccountName(name: value))
                          )
                    ],
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(vertical: 8.0),
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Text(
                //         AppStrings.linkbankAccountType,
                //         style: AppTextStyles.h3style,
                //       ),
                //       OptionSelectionItemUI(
                //         icon: '',
                //         title: state.isRadioSelectedAccountType != null
                //             ? accountType.elementAt(state.isRadioSelectedAccountType)
                //             : AppStrings.linkbankAccountTypeItemSelection,
                //         onTapped: () {
                //           showModalBottomSheet(
                //             context: context,
                //             shape: RoundedRectangleBorder(
                //               borderRadius: BorderRadius.only(
                //                 topLeft: Radius.circular(40),
                //                 topRight: Radius.circular(40),
                //               ),
                //             ),
                //             builder: (context) {
                //               return ListView.builder(
                //                 shrinkWrap: true,
                //                 itemCount: accountType.length,
                //                 itemBuilder: (context, index) {
                //                   return BlocBuilder<BankBloc, BankState>(
                //                     builder: (context, state) {
                //                       return LabeledRadio(
                //                         title: AppStrings.empty,
                //                         label: accountType.elementAt(index),
                //                         padding: const EdgeInsets.symmetric(horizontal: 5.0),
                //                         groupValue: (state as BankLoaded).isRadioSelectedAccountType,
                //                         value: index,
                //                         onChanged: (value) async {
                //                           _bloc.add(BankAccountType(accountType: accountType.elementAt(value)));
                //                           _bloc.add(IsRadioSelectedAccountType(selecteditem: value));
                //                           await Navigator.of(context, rootNavigator: true).pop();
                //                         },
                //                         vector: false,
                //                         vectorpath: '',
                //                       );
                //                     },
                //                   );
                //                 },
                //               );
                //             },
                //           );
                //         },
                //         suffix: true,
                //         suffixicon: Icon(Icons.keyboard_arrow_down),
                //       ),
                //     ],
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 40),
                  child: ButtonArrow(
                      navigatorfunc: (state is BankLoaded)
                          ? state.acctname != null &&
                                  state.acctnumber != null &&
                                  state.bankname != null &&
                                  state.bankcode != null
                              ? () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return BlocBuilder<BankBloc, BankState>(builder: (context, state) {
                                          if (state is BankLoaded) {
                                            return CustomTicketDetails(
                                              ticketDetails: TicketDetails(
                                                  buttontitle: AppStrings.proceedbtn,
                                                  buttontitlecolor: ColorSets.colorPrimaryBlack,
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets.only(top: 25.0, bottom: 5),
                                                        child: Text(
                                                          AppStrings.linkInformation,
                                                          style: AppTextStyles.h2style,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.only(top: 5.0, bottom: 30),
                                                        child: Text(
                                                          '--------------------------------',
                                                          style: AppTextStyles.h2style
                                                              .copyWith(color: ColorSets.colorGrey.withOpacity(0.4)),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                                        child: Table(
                                                          children: [
                                                            TableRow(
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsets.symmetric(
                                                                      horizontal: 20.0, vertical: 2),
                                                                  child: Row(
                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                    children: [
                                                                      Text(AppStrings.transferdetails,
                                                                          style: AppTextStyles.h3style
                                                                              .copyWith(fontSize: 18)),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            TableRow(
                                                              children: [
                                                                Column(
                                                                  children: [
                                                                    // Padding(
                                                                    //   padding: const EdgeInsets.symmetric(
                                                                    //       horizontal: 20.0, vertical: 5),
                                                                    //   child: Row(
                                                                    //     mainAxisAlignment:
                                                                    //         MainAxisAlignment.spaceBetween,
                                                                    //     children: [
                                                                    //       Text(AppStrings.transferFrom,
                                                                    //           style: AppTextStyles.h3style),
                                                                    //       Text(AppStrings.empty,
                                                                    //           style: AppTextStyles.h3style.copyWith(
                                                                    //               fontWeight: FontWeight.bold)),
                                                                    //     ],
                                                                    //   ),
                                                                    // ),
                                                                    Padding(
                                                                      padding: const EdgeInsets.symmetric(
                                                                          horizontal: 20.0, vertical: 10),
                                                                      child: Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Text(AppStrings.linkbankAccountNumber,
                                                                              style: AppTextStyles.h3style),
                                                                          Text(state.acctnumber ?? AppStrings.empty,
                                                                              style: AppTextStyles.h3style.copyWith(
                                                                                  fontWeight: FontWeight.bold)),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsets.symmetric(
                                                                          horizontal: 20.0, vertical: 10),
                                                                      child: Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Text(AppStrings.transferAcctName,
                                                                              style: AppTextStyles.h3style),
                                                                          Text(state.acctname ?? AppStrings.empty,
                                                                              style: AppTextStyles.h3style.copyWith(
                                                                                  fontWeight: FontWeight.bold)),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsets.symmetric(
                                                                          horizontal: 20.0, vertical: 10),
                                                                      child: Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Expanded(
                                                                              child: Text(AppStrings.transferBank,
                                                                                  style: AppTextStyles.h3style)),
                                                                          Expanded(
                                                                            child: Text(
                                                                                state.bankname ?? AppStrings.empty,
                                                                                textAlign: TextAlign.right,
                                                                                style: AppTextStyles.h3style.copyWith(
                                                                                    fontWeight: FontWeight.bold)),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    // Padding(
                                                                    //   padding: const EdgeInsets.only(
                                                                    //       left: 20.0, right: 20.0, top: 10, bottom: 30),
                                                                    //   child: Row(
                                                                    //     mainAxisAlignment:
                                                                    //         MainAxisAlignment.spaceBetween,
                                                                    //     children: [
                                                                    //       Text(AppStrings.transferAcctType,
                                                                    //           style: AppTextStyles.h3style),
                                                                    //       Text(
                                                                    //           state.bankaccountType ?? AppStrings.empty,
                                                                    //           style: AppTextStyles.h3style.copyWith(
                                                                    //               fontWeight: FontWeight.bold)),
                                                                    //     ],
                                                                    //   ),
                                                                    // ),
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
                                            );
                                          }
                                          return EmptyWidgetUI();
                                        });
                                      },
                                      fullscreenDialog: true,
                                    ),
                                  );
                                }
                              : null
                          : null,
                      buttontitle: AppStrings.proceedbtn,
                      arrow: false,
                      buttontitleColor: ColorSets.colorPrimaryBlack),
                ),
              ]),
            ),
          );
        } else {
          return LoadingUI(function: (_) {}, showtext: true);
        }
      }),
    );
  }
}
