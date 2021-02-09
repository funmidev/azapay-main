import 'package:azapay/app/app.dart';
import 'package:azapay/src/blocs/blocs.dart';
import 'package:azapay/src/models/models.dart';
import 'package:azapay/src/ui/ui.dart';
import 'package:azapay/src/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:money2/money2.dart';

class BuyOptionUI extends StatefulWidget {
  final PayBillsName payBillsName;
  //0 - BuyAirtime
  //1 - BuyData
  //2 - Electricity
  //3 - WaterBill
  //4 - Network Bill
  //5 - Tithes & Offering
  //6 - TV/Cable
  //7 - Taxes

  const BuyOptionUI({Key key, @required this.payBillsName}) : super(key: key);

  @override
  _BuyOptionUIState createState() => _BuyOptionUIState();
}

class _BuyOptionUIState extends State<BuyOptionUI> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _phonenumberController = TextEditingController();
  final TextEditingController _otherpaybillsitemnameController = TextEditingController();
  final TextEditingController _customernameController = TextEditingController();
  final FocusNode _amountnode = FocusNode();
  final FocusNode _phonenonode = FocusNode();
  final FocusNode _otherpaybillsitemname = FocusNode();

  // int _isRadioSelectedPhoneNumber;
  // int _isRadioSelectedBillCategoryProvider;
  // int _isRadioSelectedBillProductProvider;

  PaybillsBloc _bloc;
  ProfileBloc _profileBloc;

  final List<String> phonenumber = [AppStrings.buyairtimeFourI, AppStrings.buyairtimeFourII];

  // final Map<String, String> networkprovider = {
  //   AppImages.mtn: AppStrings.buyairtimeFiveI,
  //   AppImages.airtel: AppStrings.buyairtimeFiveII,
  //   AppImages.glo: AppStrings.buyairtimeFiveIII,
  //   AppImages.ninemobile: AppStrings.buyairtimeFiveIV
  // };
  @override
  void initState() {
    super.initState();
    _bloc = context.bloc<PaybillsBloc>();
    _profileBloc = context.bloc<ProfileBloc>();
    _bloc.add(PayBillsService(service: widget.payBillsName.screen));
    _amountController.addListener(() {
      final text = _amountController.text.toLowerCase();
      if (text.isNotEmpty) {
        // print(text.replaceAll('[,]', ''));
        _amountController.value = _amountController.value.copyWith(
          text: Money.from(num.parse(text.replaceAll(RegExp(r'[,]'), '')), Currency.create('USD', 2)).format('#,###'),
          selection: TextSelection(baseOffset: text.length, extentOffset: text.length),
          composing: TextRange.empty,
        );
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.add(ClearBillService());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TransactionpinBloc, TransactionpinState>(
      listener: (context, state) {
        if (state is TransactionpinChecked) {
          Future.delayed(Duration(seconds: 1), () async {
            await _bloc.add(SendPayBillsRequest());
          });
        }
      },
      child: BlocConsumer<PaybillsBloc, PaybillsState>(
        listener: (context, state) async {
          if (state is PaybillsInputData) {
            //todo: show success dialog
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
              await _bloc.add(ClearBillServiceAfterResponse());
            } else if (state.error >= 400) {
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
              await _bloc.add(ClearBillServiceAfterResponse());
            }
          }
        },
        builder: (context, state) {
          if (state is PaybillsInputData) {
            return PaymentBackgroundUI(
              titlebar: BillTitle(
                service: widget.payBillsName.screen,
                fontsize: 20,
              ),
              actionbar: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: FlatButton(
                        disabledColor: ColorSets.disableButtonColor,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        padding: EdgeInsets.all(0),
                        child: Text(AppStrings.continueBtn,
                            style: AppTextStyles.h3style.copyWith(fontWeight: FontWeight.w600, fontSize: 12)),
                        onPressed: (<int>[2, 3].contains(widget.payBillsName.screen)
                                ? (state.smartcardormeterNo != null && state.billcode != null && state.amount != null ||
                                    state.productCode != null)
                                : (state.phone != null && state.product != null || state.amount != null))
                            ? () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return BlocBuilder<PaybillsBloc, PaybillsState>(builder: (context, state) {
                                        if (state is PaybillsInputData) {
                                          return CustomTicketDetails(
                                            ticketDetails: TicketDetails(
                                                buttontitle: AppStrings.proceedbtn,
                                                buttontitlecolor: ColorSets.colorPrimaryBlack,
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.only(top: 25.0, bottom: 5),
                                                      child: BillInformationTitleUI(index: widget.payBillsName.screen),
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
                                                                            .copyWith(fontWeight: FontWeight.w500)),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          TableRow(
                                                            children: [
                                                              Column(
                                                                children: [
                                                                  widget.payBillsName.screen == 0
                                                                      ? Padding(
                                                                          padding: const EdgeInsets.symmetric(
                                                                              horizontal: 20.0, vertical: 10),
                                                                          child: Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Text(AppStrings.buyairtimeTitle,
                                                                                  style: AppTextStyles.h3style),
                                                                              Text(
                                                                                  state.categoryName ??
                                                                                      AppStrings.empty,
                                                                                  style: AppTextStyles.h3style.copyWith(
                                                                                      fontWeight: FontWeight.bold)),
                                                                            ],
                                                                          ),
                                                                        )
                                                                      : Padding(
                                                                          padding: const EdgeInsets.symmetric(
                                                                              horizontal: 20.0, vertical: 10),
                                                                          child: Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Text(AppStrings.buydataTitle,
                                                                                  style: AppTextStyles.h3style),
                                                                              Text(state.product ?? AppStrings.empty,
                                                                                  style: AppTextStyles.h3style.copyWith(
                                                                                      fontWeight: FontWeight.bold)),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                  widget.payBillsName.screen == 1
                                                                      ? Padding(
                                                                          padding: const EdgeInsets.symmetric(
                                                                              horizontal: 20.0, vertical: 10),
                                                                          child: Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Text(AppStrings.buydataVolumeTitle,
                                                                                  style: AppTextStyles.h3style),
                                                                              Text(
                                                                                  state.productCode ?? AppStrings.empty,
                                                                                  style: AppTextStyles.h3style.copyWith(
                                                                                      fontWeight: FontWeight.bold)),
                                                                            ],
                                                                          ),
                                                                        )
                                                                      : EmptyWidgetUI(),
                                                                  widget.payBillsName.screen == 2 ||
                                                                          widget.payBillsName.screen == 3
                                                                      ? Padding(
                                                                          padding: const EdgeInsets.symmetric(
                                                                              horizontal: 20.0, vertical: 10),
                                                                          child: Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Text(AppStrings.payBillCableName,
                                                                                  style: AppTextStyles.h3style),
                                                                              Text(
                                                                                  state.verifyCustomer.data.name ??
                                                                                      AppStrings.empty,
                                                                                  style: AppTextStyles.h3style.copyWith(
                                                                                      fontWeight: FontWeight.bold)),
                                                                            ],
                                                                          ),
                                                                        )
                                                                      : EmptyWidgetUI(),
                                                                  widget.payBillsName.screen == 2 ||
                                                                          widget.payBillsName.screen == 3
                                                                      ? Padding(
                                                                          padding: const EdgeInsets.symmetric(
                                                                              horizontal: 20.0, vertical: 10),
                                                                          child: Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Text(AppStrings.payBillBillCode,
                                                                                  style: AppTextStyles.h3style),
                                                                              Text(state.billcode ?? AppStrings.empty,
                                                                                  style: AppTextStyles.h3style.copyWith(
                                                                                      fontWeight: FontWeight.bold)),
                                                                            ],
                                                                          ),
                                                                        )
                                                                      : EmptyWidgetUI(),

                                                                  widget.payBillsName.screen == 2 ||
                                                                          widget.payBillsName.screen == 3
                                                                      ? Padding(
                                                                          padding: const EdgeInsets.symmetric(
                                                                              horizontal: 20.0, vertical: 10),
                                                                          child: Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Text(AppStrings.payBillType,
                                                                                  style: AppTextStyles.h3style),
                                                                              Text(
                                                                                  state.productCode ?? AppStrings.empty,
                                                                                  style: AppTextStyles.h3style.copyWith(
                                                                                      fontWeight: FontWeight.bold)),
                                                                            ],
                                                                          ),
                                                                        )
                                                                      : EmptyWidgetUI(),
                                                                  widget.payBillsName.screen == 2 ||
                                                                          widget.payBillsName.screen == 3
                                                                      ? Padding(
                                                                          padding: const EdgeInsets.symmetric(
                                                                              horizontal: 20.0, vertical: 10),
                                                                          child: Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              widget.payBillsName.screen == 2
                                                                                  ? Text(AppStrings.payBilloMeterNo,
                                                                                      style: AppTextStyles.h3style)
                                                                                  : Text(AppStrings.payBillSmartCardNo,
                                                                                      style: AppTextStyles.h3style),
                                                                              Text(
                                                                                  state.smartcardormeterNo ??
                                                                                      AppStrings.empty,
                                                                                  style: AppTextStyles.h3style.copyWith(
                                                                                      fontWeight: FontWeight.bold)),
                                                                            ],
                                                                          ),
                                                                        )
                                                                      : EmptyWidgetUI(),
                                                                  // Padding(
                                                                  //   padding: const EdgeInsets.symmetric(
                                                                  //       horizontal: 20.0, vertical: 10),
                                                                  //   child: Row(
                                                                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                  //     children: [
                                                                  //       Text(AppStrings.transferFrom,
                                                                  //           style: AppTextStyles.h3style),
                                                                  //       Text(state.phone ?? AppStrings.empty,
                                                                  //           style: AppTextStyles.h3style
                                                                  //               .copyWith(fontWeight: FontWeight.bold)),
                                                                  //     ],
                                                                  //   ),
                                                                  // ),
                                                                  Padding(
                                                                    padding: const EdgeInsets.symmetric(
                                                                        horizontal: 20.0, vertical: 10),
                                                                    child: Row(
                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                      children: [
                                                                        Text(AppStrings.transferTo,
                                                                            style: AppTextStyles.h3style),
                                                                        Text(state.phone ?? AppStrings.empty,
                                                                            style: AppTextStyles.h3style
                                                                                .copyWith(fontWeight: FontWeight.bold)),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                          // TableRow(
                                                          //   children: [
                                                          //     Text(AppStrings.transferTo),
                                                          //     Text(state.othersnumber ?? state.paybills.selfnumber),
                                                          //   ],
                                                          // ),
                                                          TableRow(
                                                            children: [
                                                              Padding(
                                                                padding: const EdgeInsets.symmetric(
                                                                    horizontal: 20.0, vertical: 10),
                                                                child: Row(
                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                  children: [
                                                                    Text(AppStrings.transferAmount,
                                                                        style: AppTextStyles.h3style),
                                                                    Row(
                                                                      children: [
                                                                        Text(AppStrings.nairaUnicode,
                                                                            style: AppTextStyles.h3style
                                                                                .copyWith(fontSize: 12)),
                                                                        Text(state.amount.toString(),
                                                                            style: AppTextStyles.h3style
                                                                                .copyWith(fontWeight: FontWeight.bold)),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          // TableRow(
                                                          //   children: [
                                                          //     Padding(
                                                          //       padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                                                          //       child: Row(
                                                          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          //         children: [
                                                          //           Text(AppStrings.transferTransactionFee, style: AppTextStyles.h3style),
                                                          //           Row(
                                                          //             children: [
                                                          //               Text(AppStrings.nairaUnicode,
                                                          //                   style: AppTextStyles.h3style.copyWith(fontSize: 12)),
                                                          //               Text(AppStrings.transferTransactionFeeAmount,
                                                          //                   style: AppTextStyles.h3style
                                                          //                       .copyWith(fontWeight: FontWeight.bold)),
                                                          //             ],
                                                          //           ),
                                                          //         ],
                                                          //       ),
                                                          //     ),
                                                          //   ],
                                                          // ),
                                                          TableRow(
                                                            children: [
                                                              Column(
                                                                children: [
                                                                  Padding(
                                                                    padding:
                                                                        const EdgeInsets.only(top: 20.0, bottom: 5),
                                                                    child: Text(
                                                                      '--------------------------------',
                                                                      style: AppTextStyles.h2style.copyWith(
                                                                          color: ColorSets.colorGrey.withOpacity(0.4)),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsets.only(
                                                                        left: 20.0, right: 20, bottom: 20),
                                                                    child: Row(
                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                      children: [
                                                                        Text(AppStrings.transferTotal,
                                                                            style: AppTextStyles.h2style),
                                                                        Row(
                                                                          children: [
                                                                            Text(AppStrings.nairaUnicode,
                                                                                style: AppTextStyles.h3style
                                                                                    .copyWith(fontSize: 15)),
                                                                            Text(
                                                                                '${Money.from(state.amount.toDouble() ?? '', Currency.create('USD', 2)).format('#,###.##')}',
                                                                                style: AppTextStyles.h2style),
                                                                          ],
                                                                        ),
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
                                                          builder: (context) => TransactionUI(),
                                                          fullscreenDialog: true));
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
                            : () => showToast(AppStrings.payBillEmptyField,
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
                                reverseCurve: Curves.fastOutSlowIn),
                        color: ColorSets.colorPrimaryLightYellow,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                        disabledTextColor: ColorSets.disableButtonColor,
                      ),
                    ),
                  ],
                )
              ],
              contentbody: ListView(
                children: [
                  <int>[1].contains(widget.payBillsName.screen)
                      ? EmptyWidgetUI()
                      : FormFieldUI(
                          textAlign: TextAlign.center,
                          currentnode: _amountnode,
                          fieldController: _amountController,
                          hint: AppStrings.buyairtimeThree,
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.number,
                          maxLength: 100,
                          readOnly: <int>[3].contains(widget.payBillsName.screen) ? true : false,
                          prefixicon: Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Text(AppStrings.nairaUnicode, style: AppTextStyles.h3style.copyWith(fontSize: 20)),
                          ),
                          errorText: null,
                          onchanged: (amount) {
                            _bloc.add(
                              PayBillsAmount(amount: double.parse(amount.replaceAll(RegExp(r'[,]'), ''))),
                            );
                          }),
                  OptionSelectionItemUI(
                      icon: AppVectors.phone_square,
                      title: state.isRadioSelectedPhoneNumber != null
                          ? phonenumber.elementAt(state.isRadioSelectedPhoneNumber)
                          : AppStrings.buyairtimeFour,
                      asset: false,
                      assetvector: null,
                      onTapped: () {
                        showModalBottomSheet(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                            ),
                            useRootNavigator: true,
                            enableDrag: true,
                            isDismissible: true,
                            context: context,
                            builder: (context) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Align(
                                      alignment: Alignment.topCenter,
                                      child: CustomDivider(),
                                    ),
                                  ),
                                  ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: phonenumber.length,
                                      itemBuilder: (context, index) {
                                        return BlocBuilder<PaybillsBloc, PaybillsState>(
                                            builder: (context, state) => LabeledRadio(
                                                  vector: false,
                                                  vectorpath: '',
                                                  title: '',
                                                  label: phonenumber[index],
                                                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                                  value: index,
                                                  groupValue: (state as PaybillsInputData).isRadioSelectedPhoneNumber,
                                                  onChanged: (position) async {
                                                    //if position is zero then it means the user clicked self label
                                                    if (position == 0) {
                                                      _bloc.add(PayBillsOthersNumber(
                                                          othersno:
                                                              (_profileBloc.state as ProfileLoaded).signUp.data.phone));
                                                    }
                                                    _bloc.add(PayBillsisRadioSelectedPhoneNumber(position: position));
                                                    await Navigator.of(context, rootNavigator: true).pop();
                                                  },
                                                ));
                                      }),
                                ],
                              );
                            });
                      }),
                  state.isRadioSelectedPhoneNumber == 1
                      ? FormFieldUI(
                          currentnode: _phonenonode,
                          fieldController: _phonenumberController,
                          hint: AppStrings.enterphonenumber,
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.number,
                          maxLength: 11,
                          textAlign: TextAlign.center,
                          errorText: null,
                          onchanged: (others) => _bloc.add(PayBillsOthersNumber(othersno: others)))
                      : EmptyWidgetUI(),
                  <int>[2, 3].contains(widget.payBillsName.screen)
                      ? FormFieldUI(
                          currentnode: _phonenonode,
                          fieldController: _otherpaybillsitemnameController,
                          hint: PayBillsName.paybillhint(screens: widget.payBillsName.screen),
                          readOnly: false,
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.number,
                          maxLength: 11,
                          textAlign: TextAlign.center,
                          errorText: null,
                          onchanged: (itemdata) => _bloc.add(PayBillsSmartCardOrMeterNo(smartcardormeterno: itemdata)))
                      : EmptyWidgetUI(),
                  (state is PaybillsInputData<String, GetPayBillsItem>)
                      ? state.getPayBillsCategory.data.isNotEmpty
                          ? Builder(
                              builder: (context) => OptionSelectionItemUI(
                                  icon:
                                      widget.payBillsName.screen <= 2 ? AppVectors.network_provider : AppStrings.empty,
                                  title: state.isRadioSelectedBillCategoryProvider != null
                                      ? state.getPayBillsCategory.data
                                          .elementAt(state.isRadioSelectedBillCategoryProvider)
                                      : AppStrings.buyairtimeFive,
                                  // asset: _isRadioSelectedBillCategoryProvider != null ? true : false,
                                  // assetvector: _isRadioSelectedBillCategoryProvider != null
                                  //     ? networkprovider.keys.elementAt(_isRadioSelectedBillCategoryProvider)
                                  //     : null,
                                  onTapped: state.phone.length < 10
                                      ? () {
                                          showToast(AppStrings.paybillsresponsewithoutSmartCardOrMeterNo,
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
                                        }
                                      : () {
                                          showModalBottomSheet(
                                              context: context,
                                              enableDrag: true,
                                              isDismissible: true,
                                              useRootNavigator: true,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  topRight: Radius.circular(10),
                                                ),
                                              ),
                                              builder: (context) {
                                                return Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.all(10),
                                                      child: Align(
                                                        alignment: Alignment.topCenter,
                                                        child: CustomDivider(),
                                                      ),
                                                    ),
                                                    ListView.builder(
                                                        shrinkWrap: true,
                                                        itemCount: state.getPayBillsCategory.data.toList().length,
                                                        itemBuilder: (context, index) {
                                                          return BlocBuilder<PaybillsBloc, PaybillsState>(
                                                              builder: (context, state) => LabeledRadio(
                                                                    vector: false,
                                                                    label: (state as PaybillsInputData<String,
                                                                            GetPayBillsItem>)
                                                                        .getPayBillsCategory
                                                                        .data
                                                                        .toList()[index],
                                                                    padding:
                                                                        const EdgeInsets.symmetric(horizontal: 5.0),
                                                                    value: index,
                                                                    title: AppStrings.empty,
                                                                    groupValue: (state as PaybillsInputData)
                                                                        .isRadioSelectedBillCategoryProvider,
                                                                    onChanged: (position) async {
                                                                      _bloc.add(
                                                                        PayBillsCategoryName(
                                                                          categoryName: (state as PaybillsInputData<
                                                                                  String, GetPayBillsItem>)
                                                                              .getPayBillsCategory
                                                                              .data
                                                                              .elementAt(position),
                                                                        ),
                                                                      );
                                                                      _bloc.add(
                                                                        PayBillsisRadioSelectedBillCategoryProvider(
                                                                          position: position,
                                                                        ),
                                                                      );
                                                                      await Navigator.of(context, rootNavigator: true)
                                                                          .pop();
                                                                    },
                                                                  ));
                                                        }),
                                                  ],
                                                );
                                              });
                                        }),
                            )
                          : EmptyWidgetUI()
                      : EmptyWidgetUI(),
                  if (state is PaybillsInputData<GetPayBillsItem, GetPayBillsItem>) ...[
                    //Added Electricity product response has category
                    state.getPayBillsCategory.data.isNotEmpty
                        ? Builder(
                            builder: (context) => InkWell(
                              onTap: state.smartcardormeterNo.isEmpty
                                  ? () {
                                      showToast(AppStrings.paybillsRequired,
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
                                    }
                                  : null,
                              child: IgnorePointer(
                                ignoring: state.smartcardormeterNo.isEmpty ? true : false,
                                child: OptionSelectionItemUI(
                                    icon: widget.payBillsName.screen <= 2
                                        ? AppVectors.network_provider
                                        : AppStrings.empty,
                                    title: state.isRadioSelectedBillCategoryProvider != null
                                        ? state.getPayBillsCategory.data
                                            .map((e) => e.billcode)
                                            .toSet()
                                            .elementAt(state.isRadioSelectedBillCategoryProvider)
                                        : AppStrings.buyProduct,
                                    // asset: _isRadioSelectedBillCategoryProvider != null ? true : false,
                                    // assetvector: _isRadioSelectedBillCategoryProvider != null
                                    //     ? networkprovider.keys.elementAt(_isRadioSelectedBillCategoryProvider)
                                    //     : null,
                                    onTapped: _otherpaybillsitemnameController.text.length < 10 &&
                                            _phonenumberController.text.length < 10
                                        ? () {
                                            showToast(AppStrings.paybillsresponsewithoutSmartCardOrMeterNo,
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
                                          }
                                        : () {
                                            showModalBottomSheet(
                                                enableDrag: true,
                                                isDismissible: true,
                                                context: context,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(10),
                                                    topRight: Radius.circular(10),
                                                  ),
                                                ),
                                                useRootNavigator: true,
                                                builder: (context) {
                                                  return Column(
                                                    mainAxisSize: MainAxisSize.min,
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
                                                            physics: BouncingScrollPhysics(),
                                                            itemCount: <int>[2].contains(widget.payBillsName.screen)
                                                                ? state.getPayBillsCategory.data
                                                                    .toList()
                                                                    .map((e) => e.name)
                                                                    .toSet()
                                                                    .length
                                                                : state.getPayBillsCategory.data
                                                                    .toList()
                                                                    .map((e) => e.billcode)
                                                                    .toSet()
                                                                    .length,
                                                            itemBuilder: (context, index) {
                                                              return BlocBuilder<PaybillsBloc, PaybillsState>(
                                                                  builder: (context, state) => LabeledRadio(
                                                                        vector: false,
                                                                        label: <int>[2].contains(widget.payBillsName.screen)
                                                                            ? (state as PaybillsInputData<GetPayBillsItem, GetPayBillsItem>)
                                                                                    .getPayBillsCategory
                                                                                    .data
                                                                                    .toList()
                                                                                    .map((e) => e.name)
                                                                                    .toSet()
                                                                                    .elementAt(index) ??
                                                                                (state as PaybillsInputData<
                                                                                        GetPayBillsItem,
                                                                                        GetPayBillsItem>)
                                                                                    .getPayBillsCategory
                                                                                    .data
                                                                                    .toList()[index]
                                                                                    .categoryName
                                                                            : (state as PaybillsInputData<
                                                                                        GetPayBillsItem,
                                                                                        GetPayBillsItem>)
                                                                                    .getPayBillsCategory
                                                                                    .data
                                                                                    .toList()
                                                                                    .map((e) => e.billcode)
                                                                                    .toSet()
                                                                                    .elementAt(index) ??
                                                                                (state as PaybillsInputData<
                                                                                        GetPayBillsItem,
                                                                                        GetPayBillsItem>)
                                                                                    .getPayBillsCategory
                                                                                    .data
                                                                                    .toList()[index]
                                                                                    .categoryName,
                                                                        padding:
                                                                            const EdgeInsets.symmetric(horizontal: 5.0),
                                                                        value: index,
                                                                        title: AppStrings.empty,
                                                                        groupValue: (state as PaybillsInputData)
                                                                            .isRadioSelectedBillCategoryProvider,
                                                                        onChanged: (position) async {
                                                                          await _bloc.add(
                                                                            PayBillsBillCode(
                                                                              billCode: (state as PaybillsInputData<
                                                                                      GetPayBillsItem, GetPayBillsItem>)
                                                                                  .getPayBillsCategory
                                                                                  .data
                                                                                  .toList()
                                                                                  .map((e) => e.billcode)
                                                                                  .toSet()
                                                                                  .elementAt(index),
                                                                            ),
                                                                          );
                                                                          await _bloc.add(PayBillsRetrieveName());
                                                                          <int>[3].contains(widget.payBillsName.screen)
                                                                              ? _bloc.add(
                                                                                  PayBillsProductCode(
                                                                                    productCode: (state
                                                                                            as PaybillsInputData<
                                                                                                GetPayBillsItem,
                                                                                                GetPayBillsItem>)
                                                                                        .getPayBillsCategory
                                                                                        .data
                                                                                        .toList()
                                                                                        .map((e) => e.productcode)
                                                                                        .toSet()
                                                                                        .elementAt(index),
                                                                                  ),
                                                                                )
                                                                              : null;
                                                                          // if ((state as PaybillsInputData<GetPayBillsItem,
                                                                          //           GetPayBillsItem>)
                                                                          //       .getPayBillsCategory
                                                                          //       .data
                                                                          //       .toList().map((e) => e.billcode).toSet().elementAt(index) !=
                                                                          //     null) {
                                                                          // _bloc.add(
                                                                          //   PayBillsCategoryName(
                                                                          //     categoryName: (state as PaybillsInputData<
                                                                          //             GetPayBillsItem, GetPayBillsItem>)
                                                                          //         .getPayBillsCategory
                                                                          //         .data
                                                                          //         .elementAt(position)
                                                                          //         .product,
                                                                          //   ),
                                                                          // );
                                                                          // _bloc.add(
                                                                          //   PayBillsCategoryId(
                                                                          //     categoryId: (state as PaybillsInputData<
                                                                          //             GetPayBillsItem, GetPayBillsItem>)
                                                                          //         .getPayBillsCategory
                                                                          //         .data
                                                                          //         .elementAt(position)
                                                                          //         .categoryId,
                                                                          //   ),
                                                                          // );
                                                                          // } else {
                                                                          //   _bloc.add(
                                                                          //     PayBillsCategoryName(
                                                                          //       categoryName: (state as PaybillsInputData<
                                                                          //               GetPayBillsItem, GetPayBillsItem>)
                                                                          //           .getPayBillsCategory
                                                                          //           .data
                                                                          //           .elementAt(position)
                                                                          //           .categoryName,
                                                                          //     ),
                                                                          //   );
                                                                          //   _bloc.add(
                                                                          //     PayBillsCategoryId(
                                                                          //       categoryId: (state as PaybillsInputData<
                                                                          //               GetPayBillsItem, GetPayBillsItem>)
                                                                          //           .getPayBillsCategory
                                                                          //           .data
                                                                          //           .elementAt(position)
                                                                          //           .categoryId,
                                                                          //     ),
                                                                          //   );
                                                                          // }

                                                                          // _bloc.add(
                                                                          //   PayBillsCategoryId(
                                                                          //     categoryId: (state as PaybillsInputData<GetPayBillsItem,
                                                                          //             GetPayBillsItem>)
                                                                          //         .getPayBillsCategory
                                                                          //         .data
                                                                          //         .elementAt(position)
                                                                          //         .categoryId,
                                                                          //   ),
                                                                          // );
                                                                          _bloc.add(
                                                                            PayBillsisRadioSelectedBillCategoryProvider(
                                                                              position: position,
                                                                            ),
                                                                          );
                                                                          await Navigator.of(context,
                                                                                  rootNavigator: true)
                                                                              .pop();
                                                                        },
                                                                      ));
                                                            }),
                                                      ),
                                                    ],
                                                  );
                                                });
                                          }),
                              ),
                            ),
                          )
                        : EmptyWidgetUI(),
                    //TV Cable
                    // state.getPayBillsProduct.data.elementAt(state.isRadioSelectedBillProductProvider).billcode
                    //state.getPayBillsCategory.data.elementAt(0).productcode.isNotEmpty
                    if (state.billcode != null && <int>[3].contains(widget.payBillsName.screen)) ...[
                      OptionSelectionItemUI(
                          icon: '',
                          title: state.isRadioSelectedBillProductProvider != null
                              ? state.getPayBillsCategory.data
                                  .where((data) =>
                                      data.billcode ==
                                      (state as PaybillsInputData<GetPayBillsItem, GetPayBillsItem>).billcode)
                                  .elementAt(state.isRadioSelectedBillProductProvider)
                                  .productcode
                              : 'Select Cable Product',
                          asset: false,
                          assetvector: null,
                          onTapped: state.isRadioSelectedBillCategoryProvider == null
                              ? () {
                                  showToast(AppStrings.paybillsresponsewithoutSmartCardOrMeterNo,
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
                                }
                              : () {
                                  showModalBottomSheet(
                                      context: context,
                                      enableDrag: true,
                                      isDismissible: true,
                                      useRootNavigator: true,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                        ),
                                      ),
                                      builder: (context) {
                                        return BlocBuilder<PaybillsBloc, PaybillsState>(
                                          builder: (context, state) {
                                            return Column(
                                              mainAxisSize: MainAxisSize.min,
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
                                                      itemCount:
                                                          (state as PaybillsInputData<GetPayBillsItem, GetPayBillsItem>)
                                                              .getPayBillsCategory
                                                              .data
                                                              .toList()
                                                              .where((data) =>
                                                                  data.billcode ==
                                                                  (state as PaybillsInputData<GetPayBillsItem,
                                                                          GetPayBillsItem>)
                                                                      .billcode)
                                                              .length,
                                                      itemBuilder: (context, index) {
                                                        return LabeledRadio(
                                                          vector: false,
                                                          // vectorpath: networkprovider.keys.toList()[index],
                                                          label: (state as PaybillsInputData<GetPayBillsItem,
                                                                  GetPayBillsItem>)
                                                              .getPayBillsCategory
                                                              .data
                                                              .where((data) =>
                                                                  data.billcode ==
                                                                  (state as PaybillsInputData<GetPayBillsItem,
                                                                          GetPayBillsItem>)
                                                                      .billcode)
                                                              .toList()[index]
                                                              .name,
                                                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                                          value: index,
                                                          title: AppStrings.empty,
                                                          groupValue: (state as PaybillsInputData<GetPayBillsItem,
                                                                  GetPayBillsItem>)
                                                              .isRadioSelectedBillProductProvider,
                                                          onChanged: (position) async {
                                                            await _bloc.add(PayBillsisRadioSelectedBillProductProvider(
                                                                position: position));
                                                            await _bloc.add(PayBillsProductCode(
                                                                productCode: (state as PaybillsInputData<
                                                                        GetPayBillsItem, GetPayBillsItem>)
                                                                    .getPayBillsCategory
                                                                    .data
                                                                    .where((data) =>
                                                                        data.billcode ==
                                                                        (state as PaybillsInputData<GetPayBillsItem,
                                                                                GetPayBillsItem>)
                                                                            .billcode)
                                                                    .elementAt(position)
                                                                    .productcode));

                                                            await _bloc.add(
                                                              PayBillsAmount(
                                                                  amount: (state as PaybillsInputData<GetPayBillsItem,
                                                                          GetPayBillsItem>)
                                                                      .getPayBillsCategory
                                                                      .data
                                                                      .where((data) =>
                                                                          data.billcode ==
                                                                          (state as PaybillsInputData<GetPayBillsItem,
                                                                                  GetPayBillsItem>)
                                                                              .billcode)
                                                                      .elementAt(position)
                                                                      .price),
                                                            );

                                                            _amountController.text = (state as PaybillsInputData<
                                                                    GetPayBillsItem, GetPayBillsItem>)
                                                                .getPayBillsCategory
                                                                .data
                                                                .where((data) =>
                                                                    data.billcode ==
                                                                    (state as PaybillsInputData<GetPayBillsItem,
                                                                            GetPayBillsItem>)
                                                                        .billcode)
                                                                .elementAt(position)
                                                                .price
                                                                .toString();

                                                            await Navigator.of(context, rootNavigator: true).pop();
                                                          },
                                                        );
                                                      }),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      });
                                })
                    ],

                    if (state.getPayBillsProduct.data.isNotEmpty) ...[
                      //Telecom Data
                      if (state.getPayBillsProduct.data.elementAt(0).label.isNotEmpty) ...[
                        OptionSelectionItemUI(
                          icon: '',
                          title: state.isRadioSelectedBillProductProvider != null
                              ? state.getPayBillsProduct.data.elementAt(state.isRadioSelectedBillProductProvider).label
                              : AppStrings.buyairtimeFive,
                          asset: false,
                          assetvector: null,
                          onTapped: () {
                            showModalBottomSheet(
                                context: context,
                                enableDrag: true,
                                isDismissible: true,
                                useRootNavigator: true,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                ),
                                builder: (context) {
                                  return BlocBuilder<PaybillsBloc, PaybillsState>(
                                    builder: (context, state) => Column(
                                      mainAxisSize: MainAxisSize.min,
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
                                              itemCount: (state as PaybillsInputData<GetPayBillsItem, GetPayBillsItem>)
                                                  .getPayBillsProduct
                                                  .data
                                                  .toList()
                                                  .length,
                                              itemBuilder: (context, index) {
                                                return LabeledRadio(
                                                  vector: false,
                                                  // vectorpath: networkprovider.keys.toList()[index],
                                                  label: (state as PaybillsInputData<GetPayBillsItem, GetPayBillsItem>)
                                                      .getPayBillsProduct
                                                      .data
                                                      .toList()[index]
                                                      .label,
                                                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                                  value: index,
                                                  title: AppStrings.empty,
                                                  groupValue:
                                                      (state as PaybillsInputData<GetPayBillsItem, GetPayBillsItem>)
                                                          .isRadioSelectedBillProductProvider,
                                                  onChanged: (position) async {
                                                    await _bloc.add(
                                                        PayBillsisRadioSelectedBillProductProvider(position: position));
                                                    await _bloc.add(PayBillsProductName(
                                                        productName: (state
                                                                as PaybillsInputData<GetPayBillsItem, GetPayBillsItem>)
                                                            .getPayBillsProduct
                                                            .data
                                                            .elementAt(position)
                                                            .label));
                                                    await Navigator.of(context, rootNavigator: true).pop();
                                                  },
                                                );
                                              }),
                                        ),
                                      ],
                                    ),
                                  );
                                });
                          },
                        ),
                        OptionSelectionItemUI(
                          icon: '',
                          title: state.isRadioSelectedBillProductProvider != null &&
                                  state.isRadioSelectedBillSubProductProvider != null
                              ? state.getPayBillsProduct.data
                                          .elementAt(state.isRadioSelectedBillProductProvider)
                                          .products
                                          .length <
                                      state.isRadioSelectedBillSubProductProvider
                                  ? AppStrings.buydataThree
                                  : state.getPayBillsProduct.data
                                      .elementAt(state.isRadioSelectedBillProductProvider)
                                      .products
                                      .elementAt(state.isRadioSelectedBillSubProductProvider)
                                      .name
                              : AppStrings.buydataThree,
                          asset: false,
                          assetvector: null,
                          onTapped: state.isRadioSelectedBillProductProvider == null
                              ? () {
                                  showToast(AppStrings.paybillsresponsewithoutSmartCardOrMeterNo,
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
                                  // Scaffold.of(context)
                                  //   ..hideCurrentSnackBar()
                                  //   ..showSnackBar(
                                  //     SnackBar(
                                  //       backgroundColor: ColorSets.colorPrimaryRed,
                                  //       content: Row(
                                  //         mainAxisSize: MainAxisSize.min,
                                  //         children: [
                                  //           Expanded(
                                  //             child: Text(
                                  //               AppStrings.paybillsresponsewithoutSmartCardOrMeterNo,
                                  //               style: AppTextStyles.h3style.copyWith(
                                  //                   color: ColorSets.colorPrimaryWhite,
                                  //                   decoration: TextDecoration.underline),
                                  //             ),
                                  //           ),
                                  //         ],
                                  //       ),
                                  //     ),
                                  //   );
                                }
                              : () {
                                  showModalBottomSheet(
                                      enableDrag: true,
                                      isDismissible: true,
                                      context: context,
                                      useRootNavigator: true,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                        ),
                                      ),
                                      builder: (context) {
                                        return BlocBuilder<PaybillsBloc, PaybillsState>(
                                          builder: (context, state) => Column(
                                            mainAxisSize: MainAxisSize.min,
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
                                                    itemCount: (state
                                                            as PaybillsInputData<GetPayBillsItem, GetPayBillsItem>)
                                                        .getPayBillsProduct
                                                        .data
                                                        .elementAt((state
                                                                as PaybillsInputData<GetPayBillsItem, GetPayBillsItem>)
                                                            .isRadioSelectedBillProductProvider)
                                                        .products
                                                        .length,
                                                    itemBuilder: (context, index) {
                                                      return LabeledRadio(
                                                        vector: false,
                                                        // vectorpath: networkprovider.keys.toList()[index],
                                                        label: (state
                                                                as PaybillsInputData<GetPayBillsItem, GetPayBillsItem>)
                                                            .getPayBillsProduct
                                                            .data
                                                            .elementAt((state as PaybillsInputData<GetPayBillsItem,
                                                                    GetPayBillsItem>)
                                                                .isRadioSelectedBillProductProvider)
                                                            .products
                                                            .elementAt(index)
                                                            .amount
                                                            .toString(),
                                                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                                        value: index,
                                                        title: (state
                                                                as PaybillsInputData<GetPayBillsItem, GetPayBillsItem>)
                                                            .getPayBillsProduct
                                                            .data
                                                            .elementAt((state as PaybillsInputData<GetPayBillsItem,
                                                                    GetPayBillsItem>)
                                                                .isRadioSelectedBillProductProvider)
                                                            .products
                                                            .elementAt(index)
                                                            .name,
                                                        groupValue: (state
                                                                as PaybillsInputData<GetPayBillsItem, GetPayBillsItem>)
                                                            .isRadioSelectedBillSubProductProvider,

                                                        onChanged: (position) async {
                                                          await _bloc.add(PayBillisRadioSelectedBillSubProductProvider(
                                                              position: position));
                                                          await _bloc.add(PayBillsProductCode(
                                                              productCode: (state as PaybillsInputData<GetPayBillsItem,
                                                                      GetPayBillsItem>)
                                                                  .getPayBillsProduct
                                                                  .data
                                                                  .elementAt((state as PaybillsInputData<
                                                                          GetPayBillsItem, GetPayBillsItem>)
                                                                      .isRadioSelectedBillProductProvider)
                                                                  .products
                                                                  .elementAt(index)
                                                                  .code));
                                                          await _bloc.add(PayBillsAmount(
                                                              amount: (state as PaybillsInputData<GetPayBillsItem,
                                                                      GetPayBillsItem>)
                                                                  .getPayBillsProduct
                                                                  .data
                                                                  .elementAt((state as PaybillsInputData<
                                                                          GetPayBillsItem, GetPayBillsItem>)
                                                                      .isRadioSelectedBillProductProvider)
                                                                  .products
                                                                  .elementAt(index)
                                                                  .amount));
                                                          await Navigator.of(context, rootNavigator: true).pop();
                                                        },
                                                      );
                                                    }),
                                              ),
                                            ],
                                          ),
                                        );
                                      });
                                },
                        ),
                      ],
                    ],
                  ],
                  state.verifyCustomer.data.name.isNotEmpty
                      ? FormFieldUI(
                          currentnode: _phonenonode,
                          fieldController: TextEditingController(text: state.verifyCustomer.data.name),
                          hint: AppStrings.paybillsCustomerName,
                          readOnly: true,
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.number,
                          maxLength: 6,
                          textAlign: TextAlign.center,
                          errorText: null,
                          onchanged: null)
                      : EmptyWidgetUI(),
                ],
              ),
            );
          } else {
            return LoadingUI(
              function: (_) {},
            );
          }
        },
      ),
    );
  }
}

class BillInformationTitleUI extends StatelessWidget {
  final int index;
  BillInformationTitleUI({this.index});
  @override
  Widget build(BuildContext context) {
    return [
      AppStrings.buyairtimeInformation,
      AppStrings.buydataInformation,
      AppStrings.payBillElectric,
      AppStrings.payBillWaterBill,
      AppStrings.payBillNeworkBill,
      AppStrings.payBillTithes,
      AppStrings.payBillTVCable,
      AppStrings.payBillTaxes
    ]
        .map((title) => Text(
              title,
              style: AppTextStyles.h2style,
            ))
        .elementAt(index);
  }
}

class BillTitle extends StatelessWidget {
  final int service;
  final double fontsize;

  BillTitle({this.service, this.fontsize});

  @override
  Widget build(BuildContext context) {
    switch (service) {
      case 0:
        return Text(AppStrings.buyairtimeOne,
            style: AppTextStyles.h3style.copyWith(fontWeight: FontWeight.w600, fontSize: fontsize));
        break;
      case 1:
        return Text(AppStrings.buydataOne,
            style: AppTextStyles.h3style.copyWith(fontWeight: FontWeight.w600, fontSize: fontsize));
        break;

      case 2:
        return Text(AppStrings.payBillElectric,
            style: AppTextStyles.h3style.copyWith(fontWeight: FontWeight.w600, fontSize: fontsize));
        break;
      case 3:
        return Text(AppStrings.payBillTVCable,
            style: AppTextStyles.h3style.copyWith(fontWeight: FontWeight.w600, fontSize: fontsize));
        break;
      case 4:
        return Text(AppStrings.payBillWaterBill,
            style: AppTextStyles.h3style.copyWith(fontWeight: FontWeight.w600, fontSize: fontsize));
        break;
      case 5:
        return Text(AppStrings.payBillNeworkBill,
            style: AppTextStyles.h3style.copyWith(fontWeight: FontWeight.w600, fontSize: fontsize));
        break;

      case 6:
        return Text(AppStrings.payBillTithes,
            style: AppTextStyles.h3style.copyWith(fontWeight: FontWeight.w600, fontSize: fontsize));
        break;

      default:
        return Text(AppStrings.payBillTaxes,
            style: AppTextStyles.h3style.copyWith(fontWeight: FontWeight.w600, fontSize: fontsize));
        break;
    }
  }
}
