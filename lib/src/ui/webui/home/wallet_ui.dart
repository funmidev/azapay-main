import 'package:azapay/app/app.dart';
import 'package:azapay/src/blocs/blocs.dart';
import 'package:azapay/src/ui/webui/webui.dart';
import 'package:azapay/src/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:money2/money2.dart';

class WalletUIWeb extends StatefulWidget {
  @override
  _WalletUIWebState createState() => _WalletUIWebState();
}

class _WalletUIWebState extends State<WalletUIWeb> {
  WalletBloc _walletBloc;
  BankBloc _bankBloc;
  SendandrequestBloc _sendandrequestBloc;
  TextEditingController _searchController;
  TextEditingController _amountController;
  TextEditingController _tagController;
  TextEditingController _accountnoController;
  TextEditingController _descriptionController;
  TextEditingController pinInputFieldController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bankBloc = context.bloc<BankBloc>();
    _sendandrequestBloc = context.bloc<SendandrequestBloc>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _bankBloc.add(FetchListBank());
    });
    _searchController = TextEditingController();
    _descriptionController = TextEditingController();
    _tagController = TextEditingController();
    pinInputFieldController = TextEditingController();
    _accountnoController = TextEditingController();
    _walletBloc = context.bloc<WalletBloc>();
    _amountController = TextEditingController();
    _amountController.addListener(() {
      final text = _amountController.text.toLowerCase();
      if (text.isNotEmpty) {
        _amountController.value = _amountController.value.copyWith(
          text: Money.from(num.parse(text.replaceAll(RegExp(r'[,]'), '')), Currency.create('USD', 2)).format('#,###'),
          selection: TextSelection(baseOffset: text.length, extentOffset: text.length),
          composing: TextRange.empty,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<SendandrequestBloc, SendandrequestState>(
          listener: (context, state) async {
            if (state is InputDataFundState) {
              if (state.success == 200) {
                await Navigator.of(context, rootNavigator: true).pop();
                await showGeneralDialog(
                    context: context,
                    pageBuilder: (context, _, __) {
                      return CustomDialogUI(
                          loading: false,
                          icontitle: false,
                          titleheader: AppStrings.successTransactPinTitle,
                          subtitle: state.responsemessage,
                          twobutton: false,
                          discardtitle: AppStrings.empty,
                          discardtitleColor: Colors.transparent,
                          discardColor: Colors.transparent,
                          acceptedbutton: null,
                          acceptedtitle: AppStrings.empty,
                          acceptedtitleColor: Colors.transparent,
                          acceptedColor: Colors.transparent,
                          centerbutton: null,
                          centertitle: AppStrings.empty,
                          centerColor: null,
                          centertitleColor: null);
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
                await _sendandrequestBloc.add(SendandrequestEvent.clear());
                //todo: show success dialog
              } else if (state.error >= 400) {
                await Navigator.of(context, rootNavigator: true).pop();
                await showGeneralDialog(
                    context: context,
                    pageBuilder: (context, _, __) {
                      return CustomDialogUI(
                          loading: false,
                          icontitle: false,
                          titleheader: AppStrings.failedTransactPinTitle,
                          subtitle: state.responsemessage,
                          twobutton: false,
                          discardtitle: AppStrings.empty,
                          discardtitleColor: Colors.transparent,
                          discardColor: Colors.transparent,
                          acceptedbutton: null,
                          acceptedtitle: AppStrings.empty,
                          acceptedtitleColor: Colors.transparent,
                          acceptedColor: Colors.transparent,
                          centerbutton: () {
                            Navigator.of(context, rootNavigator: true).pop();
                          },
                          centertitle: AppStrings.close,
                          centerColor: ColorSets.colorPrimaryRed,
                          centertitleColor: ColorSets.colorPrimaryWhite);
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
                await _sendandrequestBloc.add(SendandrequestEvent.clear());
                //todo: show error dialog
              }
            } else if (state is LoadingFundState) {
              await showGeneralDialog(
                  context: context,
                  pageBuilder: (context, _, __) {
                    return CustomDialogUI(
                        loading: true,
                        icontitle: false,
                        titleheader: null,
                        subtitle: null,
                        twobutton: false,
                        discardtitle: AppStrings.empty,
                        discardtitleColor: Colors.transparent,
                        discardColor: Colors.transparent,
                        acceptedbutton: null,
                        acceptedtitle: AppStrings.empty,
                        acceptedtitleColor: Colors.transparent,
                        acceptedColor: Colors.transparent,
                        centerbutton: null,
                        centertitle: AppStrings.empty,
                        centerColor: null,
                        centertitleColor: null);
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
            }
          },
        ),
        BlocListener<BankBloc, BankState>(
          listener: (context, state) async {
            if (state is BankLoaded) {
              if (state.success == 200) {
                await Navigator.of(context, rootNavigator: true).pop();
                await showGeneralDialog(
                    context: context,
                    pageBuilder: (context, _, __) {
                      return CustomDialogUI(
                          loading: false,
                          icontitle: false,
                          titleheader: AppStrings.successTransactPinTitle,
                          subtitle: state.responsemessage,
                          twobutton: false,
                          discardtitle: AppStrings.empty,
                          discardtitleColor: Colors.transparent,
                          discardColor: Colors.transparent,
                          acceptedbutton: null,
                          acceptedtitle: AppStrings.empty,
                          acceptedtitleColor: Colors.transparent,
                          acceptedColor: Colors.transparent,
                          centerbutton: null,
                          centertitle: AppStrings.empty,
                          centerColor: null,
                          centertitleColor: null);
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
                await _bankBloc.add(ClearBankForm());
                //todo: show success dialog
              } else if (state.error >= 400) {
                await Navigator.of(context, rootNavigator: true).pop();
                await showGeneralDialog(
                    context: context,
                    pageBuilder: (context, _, __) {
                      return CustomDialogUI(
                          loading: false,
                          icontitle: false,
                          titleheader: AppStrings.failedTransactPinTitle,
                          subtitle: state.responsemessage,
                          twobutton: false,
                          discardtitle: AppStrings.empty,
                          discardtitleColor: Colors.transparent,
                          discardColor: Colors.transparent,
                          acceptedbutton: null,
                          acceptedtitle: AppStrings.empty,
                          acceptedtitleColor: Colors.transparent,
                          acceptedColor: Colors.transparent,
                          centerbutton: () {
                            Navigator.of(context, rootNavigator: true).pop();
                          },
                          centertitle: AppStrings.close,
                          centerColor: ColorSets.colorPrimaryRed,
                          centertitleColor: ColorSets.colorPrimaryWhite);
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

                await _bankBloc.add(ClearBankForm());
                //todo: show error dialog
              }
            } else if (state is BankLoading) {
              await showGeneralDialog(
                  context: context,
                  pageBuilder: (context, _, __) {
                    return CustomDialogUI(
                        loading: true,
                        icontitle: false,
                        titleheader: null,
                        subtitle: null,
                        twobutton: false,
                        discardtitle: AppStrings.empty,
                        discardtitleColor: Colors.transparent,
                        discardColor: Colors.transparent,
                        acceptedbutton: null,
                        acceptedtitle: AppStrings.empty,
                        acceptedtitleColor: Colors.transparent,
                        acceptedColor: Colors.transparent,
                        centerbutton: null,
                        centertitle: AppStrings.empty,
                        centerColor: null,
                        centertitleColor: null);
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
            }
          },
        ),
      ],
      child: BlocBuilder<BankBloc, BankState>(
        buildWhen: (previous, current) {
          if (previous is BankInitial && current is BankLoaded) {
            return true;
          } else if (previous is BankLoaded && current is BankLoaded) {
            return true;
          } else {
            return false;
          }
        },
        builder: (context, bankstate) {
          if (bankstate is BankLoaded) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      WalletBalanceCardUI(),
                      InkWell(
                        highlightColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        onTap: () {},
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Container(
                            height: MediaQuery.of(context).size.height / 3.5,
                            width: MediaQuery.of(context).size.width / 3,
                            color: ColorSets.webcardwallet,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Expanded(
                                        child: Image(
                                          alignment: Alignment.centerLeft,
                                          image: AssetImage(AppImages.webanaira),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          AppStrings.walletwebLoadAzaPayAccount,
                                          style: AppTextStyles.h2style.copyWith(color: ColorSets.colorPrimaryWhite),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                      Expanded(
                                        child: Image(
                                          alignment: Alignment.centerLeft,
                                          image: AssetImage(AppImages.webagalaxy),
                                        ),
                                      )
                                    ],
                                  ),
                                  Image(
                                    image: AssetImage(AppImages.webplanet),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      //todo: account name and balance - card
                      //todo: load azapay account - card
                    ],
                  ),
                  BlocBuilder<WalletBloc, WalletState>(
                    builder: (context, state) => Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  state is WalletStateLoaded
                                      ? state.transferswitch == 0
                                          ? AppStrings.walletwebBankTransfer
                                          : AppStrings.walletwebOneAzaMerchantTransfer
                                      : AppStrings.empty,
                                  style: AppTextStyles.h2style,
                                ),
                                state is WalletStateLoaded
                                    ? state.transferswitch == 0
                                        ? InkWell(
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: bankstate.bankcode.isEmpty
                                                ? () {
                                                    // //print(1);
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
                                              ignoring: bankstate.bankcode.isEmpty ? true : false,
                                              child: Padding(
                                                padding: const EdgeInsets.only(top: 30.0),
                                                child: AccountFormUI(
                                                    title: AppStrings.walletwebAccountnumber,
                                                    borderradius: 10,
                                                    contentpad: 13,
                                                    controller: _accountnoController,
                                                    node: null,
                                                    readOnly: false,
                                                    hint: AppStrings.empty,
                                                    action: TextInputAction.next,
                                                    type: TextInputType.text,
                                                    prefixicon: null,
                                                    error: null,
                                                    onChanged: (acctnumber) {
                                                      if (acctnumber.length >= 10) {
                                                        _bankBloc.add(AccountNumber(
                                                            number: acctnumber, bankcode: bankstate.bankcode));
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
                                                      } else {
                                                        return null;
                                                      }
                                                    }),
                                              ),
                                            ),
                                          )
                                        : EmptyWidgetUI()
                                    : EmptyWidgetUI(),
                                AccountFormUI(
                                    title: AppStrings.walletwebamount,
                                    borderradius: 10,
                                    contentpad: 13,
                                    controller: _amountController,
                                    readOnly: false,
                                    node: null,
                                    hint: AppStrings.empty,
                                    action: TextInputAction.next,
                                    type: TextInputType.text,
                                    prefixicon: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Text(
                                        AppStrings.nairaUnicode,
                                        style: AppTextStyles.h3style,
                                      ),
                                    ),
                                    error: null,
                                    onChanged: (amount) => state is WalletStateLoaded
                                        ? state.transferswitch == 0
                                            ? _bankBloc
                                                .add(TransferAmount(amount: amount.replaceAll(RegExp(r'[,]'), '')))
                                            : _sendandrequestBloc.add(SendandrequestEvent.contacts(
                                                screen: true,
                                                amount: double.parse(amount.replaceAll(RegExp(r'[,]'), ''))))
                                        : null),
                                AccountFormUI(
                                    title: AppStrings.walletwebDescription,
                                    borderradius: 10,
                                    contentpad: 13,
                                    controller: _descriptionController,
                                    node: null,
                                    hint: AppStrings.empty,
                                    action: TextInputAction.next,
                                    type: TextInputType.text,
                                    prefixicon: null,
                                    readOnly: false,
                                    error: null,
                                    maxLines: 10,
                                    onChanged: (description) => state is WalletStateLoaded
                                        ? state.transferswitch == 0
                                            ? _bankBloc.add(TransferNote(note: description))
                                            : _sendandrequestBloc.add(SendandrequestEvent.addnote(note: description))
                                        : null),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  state is WalletStateLoaded
                                      ? state.transferswitch == 0
                                          ? AppStrings.walletwebBankTransfer
                                          : AppStrings.walletwebOneAzaMerchantTransfer
                                      : AppStrings.empty,
                                  style: AppTextStyles.h2style.copyWith(color: Colors.transparent),
                                ),
                                state is WalletStateLoaded
                                    ? state.transferswitch == 0
                                        ? BlocBuilder<BankBloc, BankState>(builder: (context, state) {
                                            if (state is BankLoaded) {
                                              return Padding(
                                                padding: const EdgeInsets.only(top: 30.0, bottom: 10),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 8.0),
                                                      child: Text(
                                                        AppStrings.walletwebBank,
                                                        style: AppTextStyles.h3style,
                                                      ),
                                                    ),
                                                    OptionSelectionItemUI(
                                                      icon: '',
                                                      bordercolor: ColorSets.colorPin,
                                                      borderradius: 10,
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
                                                              // //print(state.banklist.length);
                                                              return BlocBuilder<BankBloc, BankState>(
                                                                builder: (context, state) {
                                                                  return ClipRRect(
                                                                    borderRadius: BorderRadius.circular(10.0),
                                                                    child: Container(
                                                                      height: MediaQuery.of(context).size.height /
                                                                          1.2, // your desired height here
                                                                      width: MediaQuery.of(context).size.width / 3,
                                                                      color: Colors.white,
                                                                      child: Column(
                                                                        children: [
                                                                          Padding(
                                                                            padding: const EdgeInsets.all(10),
                                                                            child: Align(
                                                                              alignment: Alignment.topRight,
                                                                              child: IconButton(
                                                                                onPressed: () {
                                                                                  Navigator.of(context,
                                                                                          rootNavigator: true)
                                                                                      .pop();
                                                                                },
                                                                                icon: Icon(
                                                                                  Icons.close,
                                                                                  color: ColorSets.colorPrimaryRed,
                                                                                ),
                                                                              ),
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
                                                                                child: (state as BankLoaded)
                                                                                        .searchtext
                                                                                        .isEmpty
                                                                                    ? EmptyWidgetUI()
                                                                                    : Icon(
                                                                                        Icons.cancel,
                                                                                        color: ColorSets
                                                                                            .colorPrimaryLightYellow,
                                                                                      ),
                                                                              ),
                                                                              suffixicon: Icon(
                                                                                Icons.search,
                                                                                color:
                                                                                    ColorSets.colorPrimaryLightYellow,
                                                                              ),
                                                                              textInputAction: TextInputAction.done,
                                                                              textInputType: TextInputType.text,
                                                                              errorText: null,
                                                                              onchanged: (search) => _bankBloc.add(
                                                                                SearchBankList(
                                                                                    search: search.toUpperCase()),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          if ((state as BankLoaded)
                                                                                  .searchtext
                                                                                  .isNotEmpty &&
                                                                              (state as BankLoaded)
                                                                                  .banklist
                                                                                  .where((bankList) => bankList.bankname
                                                                                      .contains((state as BankLoaded)
                                                                                          ?.searchtext))
                                                                                  .isNotEmpty) ...[
                                                                            Expanded(
                                                                              child: ListView.builder(
                                                                                  shrinkWrap: true,
                                                                                  itemCount: (state as BankLoaded)
                                                                                      .banklist
                                                                                      .where((bankList) =>
                                                                                          bankList.bankname.contains(
                                                                                              (state as BankLoaded)
                                                                                                  .searchtext))
                                                                                      .length,
                                                                                  itemBuilder: (context, index) {
                                                                                    return BlocBuilder<BankBloc,
                                                                                        BankState>(
                                                                                      builder: (context, state) =>
                                                                                          LabeledRadio(
                                                                                              title: AppStrings.empty,
                                                                                              label: (state
                                                                                                      as BankLoaded)
                                                                                                  .banklist
                                                                                                  .where((bankList) => bankList
                                                                                                      .bankname
                                                                                                      .contains((state
                                                                                                              as BankLoaded)
                                                                                                          ?.searchtext))
                                                                                                  .elementAt(index)
                                                                                                  .bankname,
                                                                                              padding:
                                                                                                  const EdgeInsets.symmetric(
                                                                                                      horizontal: 5.0),
                                                                                              groupValue: (state
                                                                                                      as BankLoaded)
                                                                                                  .isRadioSelectedBank,
                                                                                              value: index,
                                                                                              onChanged: (value) async {
                                                                                                _bankBloc.add(BankId(
                                                                                                    bankcode: (state
                                                                                                            as BankLoaded)
                                                                                                        .banklist
                                                                                                        .where((bankList) => bankList
                                                                                                            .bankname
                                                                                                            .contains((state
                                                                                                                    as BankLoaded)
                                                                                                                ?.searchtext))
                                                                                                        .elementAt(
                                                                                                            index)
                                                                                                        .bankcode));
                                                                                                _bankBloc.add(BankName(
                                                                                                    bankname: (state
                                                                                                            as BankLoaded)
                                                                                                        .banklist
                                                                                                        .where((bankList) => bankList
                                                                                                            .bankname
                                                                                                            .contains((state
                                                                                                                    as BankLoaded)
                                                                                                                ?.searchtext))
                                                                                                        .elementAt(
                                                                                                            index)
                                                                                                        .bankname));
                                                                                                _bankBloc.add(
                                                                                                    IsRadioSelectedBank(
                                                                                                        selecteditem:
                                                                                                            value));
                                                                                                await Navigator.of(
                                                                                                        context,
                                                                                                        rootNavigator:
                                                                                                            true)
                                                                                                    .pop();
                                                                                              },
                                                                                              vector: false,
                                                                                              vectorpath:
                                                                                                  'beneficiarybank.keys.elementAt(index)'),
                                                                                    );
                                                                                  }),
                                                                            ),
                                                                          ],
                                                                          if ((state as BankLoaded)
                                                                                  .searchtext
                                                                                  .isNotEmpty &&
                                                                              (state as BankLoaded)
                                                                                  .banklist
                                                                                  .where((bankList) => bankList.bankname
                                                                                      .contains((state as BankLoaded)
                                                                                          ?.searchtext))
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
                                                                          if ((state as BankLoaded)
                                                                              .searchtext
                                                                              .isEmpty) ...[
                                                                            Expanded(
                                                                              child: ListView.builder(
                                                                                  shrinkWrap: true,
                                                                                  itemCount: (state as BankLoaded)
                                                                                      .banklist
                                                                                      .length,
                                                                                  itemBuilder: (context, index) {
                                                                                    return BlocBuilder<BankBloc,
                                                                                        BankState>(
                                                                                      builder: (context, state) =>
                                                                                          LabeledRadio(
                                                                                              title: AppStrings.empty,
                                                                                              label:
                                                                                                  (state as BankLoaded)
                                                                                                      .banklist
                                                                                                      .elementAt(index)
                                                                                                      .bankname,
                                                                                              padding: const EdgeInsets
                                                                                                      .symmetric(
                                                                                                  horizontal: 5.0),
                                                                                              groupValue: (state
                                                                                                      as BankLoaded)
                                                                                                  .isRadioSelectedBank,
                                                                                              value: index,
                                                                                              onChanged: (value) async {
                                                                                                _bankBloc.add(BankId(
                                                                                                    bankcode: (state
                                                                                                            as BankLoaded)
                                                                                                        .banklist
                                                                                                        .elementAt(
                                                                                                            value)
                                                                                                        .bankcode));
                                                                                                _bankBloc.add(BankName(
                                                                                                    bankname: (state
                                                                                                            as BankLoaded)
                                                                                                        .banklist
                                                                                                        .elementAt(
                                                                                                            value)
                                                                                                        .bankname));
                                                                                                _bankBloc.add(
                                                                                                    IsRadioSelectedBank(
                                                                                                        selecteditem:
                                                                                                            value));
                                                                                                await Navigator.of(
                                                                                                        context,
                                                                                                        rootNavigator:
                                                                                                            true)
                                                                                                    .pop();
                                                                                              },
                                                                                              vector: false,
                                                                                              vectorpath:
                                                                                                  'beneficiarybank.keys.elementAt(index)'),
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
                                              );
                                            } else {
                                              return EmptyWidgetUI();
                                            }
                                          })
                                        : AccountFormUI(
                                            title: AppStrings.walletwebAzaTag,
                                            borderradius: 10,
                                            contentpad: 13,
                                            controller: _tagController,
                                            node: null,
                                            readOnly: false,
                                            hint: AppStrings.empty,
                                            action: TextInputAction.next,
                                            type: TextInputType.text,
                                            prefixicon: null,
                                            maxlength: 100,
                                            error: null,
                                            onChanged: (tag) =>
                                                _sendandrequestBloc.add(SendandrequestEvent.clientid(clientid: tag)),
                                          )
                                    : EmptyWidgetUI(),
                                state is WalletStateLoaded
                                    ? state.transferswitch == 0
                                        ? AccountFormUI(
                                            title: AppStrings.walletwebAccountname,
                                            borderradius: 10,
                                            contentpad: 13,
                                            controller: TextEditingController(text: bankstate.acctname),
                                            node: null,
                                            hint: AppStrings.empty,
                                            action: TextInputAction.next,
                                            type: TextInputType.text,
                                            prefixicon: null,
                                            maxlength: 100,
                                            error: null,
                                            onChanged: (accountname) {},
                                          )
                                        : EmptyWidgetUI()
                                    : EmptyWidgetUI(),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width / 4,
                                    // height: MediaQuery.of(context).size.height / 14,
                                    child: ButtonArrow(
                                        navigatorfunc: () async {
                                          // _walletBloc.add(event)
                                          await showGeneralDialog(
                                              context: context,
                                              pageBuilder: (context, _, __) {
                                                return CustomDialogUI(
                                                    loading: false,
                                                    icontitle: false,
                                                    titleheader: AppStrings.walletwebConfirmTransfer,
                                                    subtitle: state is WalletStateLoaded
                                                        ? state.transferswitch == 0
                                                            ? 'Transfer ${AppStrings.nairaUnicode}${_amountController.text} to ${_accountnoController.text} \n Description : ${_descriptionController.text}'
                                                            : 'Transfer ${AppStrings.nairaUnicode}${_amountController.text} to ${_tagController.text} \n Description : ${_descriptionController.text}'
                                                        : null,
                                                    twobutton: true,
                                                    discardtitle: AppStrings.cancel,
                                                    discardtitleColor: ColorSets.colorPrimaryWhite,
                                                    discardColor: ColorSets.colorPrimaryRed,
                                                    acceptedbutton: () async {
                                                      await Navigator.of(context, rootNavigator: true).pop();
                                                      await showGeneralDialog(
                                                          context: context,
                                                          pageBuilder: (context, _, __) {
                                                            return CustomDialogUI(
                                                                input: true,
                                                                inputdetails: AppStrings.walletwebTransactionPin,
                                                                inputhint: AppStrings.walletwebTransactionPinHint,
                                                                inputtitle: AppStrings.walletwebConfirmTransfer,
                                                                inputFieldController: pinInputFieldController,
                                                                onChanged: (_) => null,
                                                                loading: false,
                                                                icontitle: false,
                                                                titleheader: null,
                                                                subtitle: AppStrings.empty,
                                                                twobutton: false,
                                                                discardtitle: AppStrings.empty,
                                                                discardtitleColor: Colors.transparent,
                                                                discardColor: Colors.transparent,
                                                                acceptedbutton: null,
                                                                acceptedtitle: AppStrings.empty,
                                                                acceptedtitleColor: Colors.transparent,
                                                                acceptedColor: Colors.transparent,
                                                                centerbutton: (state is WalletStateLoaded)
                                                                    ? state.transferswitch == 0
                                                                        ? () async {
                                                                            // print(pinInputFieldController.text);
                                                                            await Navigator.of(context,
                                                                                    rootNavigator: true)
                                                                                .pop();
                                                                            await _bankBloc.add(SubmitLinkBankAccount(
                                                                                option: 1,
                                                                                pin: pinInputFieldController.text));
                                                                          }
                                                                        : () async {
                                                                            await Navigator.of(context,
                                                                                    rootNavigator: true)
                                                                                .pop();

                                                                            await _sendandrequestBloc.add(
                                                                                SendandrequestEvent.submit(
                                                                                    pin: pinInputFieldController.text));
                                                                          }
                                                                    : null,
                                                                centertitle: AppStrings.proceed,
                                                                centerColor: ColorSets.colorPrimaryLightGreen,
                                                                centertitleColor: ColorSets.colorPrimaryWhite);
                                                          },
                                                          barrierDismissible: true,
                                                          barrierLabel: '',
                                                          useRootNavigator: true,
                                                          barrierColor: Colors.black.withOpacity(0.8),
                                                          transitionDuration: Duration(milliseconds: 300),
                                                          transitionBuilder: (context, animation, __, child) {
                                                            return SlideTransition(
                                                              position: Tween(begin: Offset(0, 1), end: Offset(0, 0))
                                                                  .animate(animation),
                                                              child: child,
                                                            );
                                                          });
                                                    },
                                                    acceptedtitle: AppStrings.proceed,
                                                    acceptedtitleColor: ColorSets.colorPrimaryWhite,
                                                    acceptedColor: ColorSets.colorPrimaryLightGreen,
                                                    centerbutton: null,
                                                    centertitle: AppStrings.empty,
                                                    centerColor: null,
                                                    centertitleColor: null);
                                              },
                                              barrierDismissible: true,
                                              barrierLabel: '',
                                              useRootNavigator: true,
                                              barrierColor: Colors.black.withOpacity(0.8),
                                              transitionDuration: Duration(milliseconds: 300),
                                              transitionBuilder: (context, animation, __, child) {
                                                return SlideTransition(
                                                  position:
                                                      Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(animation),
                                                  child: child,
                                                );
                                              });
                                        },
                                        buttontitle: AppStrings.proceed,
                                        arrow: false,
                                        buttontitleColor: ColorSets.colorPrimaryWhite),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 35.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      AppStrings.walletwebOneLinkedBanks,
                                      style: AppTextStyles.h2style,
                                      textAlign: TextAlign.left,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: Color(0XFFFFB300),
                                          width: 1,
                                        ),
                                      ),
                                      width: MediaQuery.of(context).size.width / 8,
                                      height: MediaQuery.of(context).size.height / 10,
                                      child: Center(
                                        child: Text(
                                          AppStrings.walletwebNoBankLinked,
                                          style: AppTextStyles.h3style,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 15.0),
                                  child: BorderButtonUI(
                                    onPressed: () {
                                      if (state is WalletStateLoaded) {
                                        if (state.transferswitch == 0) {
                                          _walletBloc.add(WebWalletTransferSwitchPage(transferswitch: 1));
                                        } else {
                                          _walletBloc.add(WebWalletTransferSwitchPage(transferswitch: 0));
                                        }
                                      }
                                      //todo: change bank transfer to merchant-transfer
                                    },
                                    titlevalue: true,
                                    child: (state is WalletStateLoaded)
                                        ? state.transferswitch == 0
                                            ? Row(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Image.asset(
                                                    AppImages.webwebbanktransfer,
                                                    scale: 1.5,
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 8.0),
                                                    child: Text(
                                                      AppStrings.walletwebBankTransfer,
                                                      style: AppTextStyles.h2style
                                                          .copyWith(color: ColorSets.colorPrimaryBlack),
                                                    ),
                                                  )
                                                ],
                                              )
                                            : Row(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Image.asset(
                                                    AppImages.webwebmerchanttransfer,
                                                    scale: 1.5,
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 8.0),
                                                    child: Text(
                                                      AppStrings.walletwebMerchantTransfer,
                                                      style: AppTextStyles.h2style
                                                          .copyWith(color: ColorSets.colorPrimaryBlack),
                                                    ),
                                                  )
                                                ],
                                              )
                                        : EmptyWidgetUI(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          } else {
            return LoadingUI(function: (_) {});
          }
        },
      ),
    );
  }
}
