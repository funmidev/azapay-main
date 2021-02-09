import 'dart:convert';
import 'dart:typed_data';
import 'package:azapay/app/app.dart';
import 'package:azapay/src/blocs/blocs.dart';
import 'package:azapay/src/ui/ui.dart';
import 'package:azapay/src/widget/custom_formfield_ui.dart';
import 'package:azapay/src/widget/widget.dart';
import 'package:azapay/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:azapay/src/models/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money2/money2.dart';

class SendRequestUI extends StatefulWidget {
  final SendAndRequest sendAndRequest;
  //true - send
  //false -request
  const SendRequestUI({Key key, @required this.sendAndRequest}) : super(key: key);

  @override
  _SendRequestUIState createState() => _SendRequestUIState();
}

class _SendRequestUIState extends State<SendRequestUI> {
  TextEditingController _toController;
  final TextEditingController _forController = TextEditingController();

  final FocusNode _tonode = FocusNode();
  final FocusNode _fornode = FocusNode();

  SendandrequestBloc _bloc;

  @override
  void dispose() {
    super.dispose();
    _toController?.dispose();
    _forController?.dispose();
    _bloc.add(SendandrequestEvent.clear(exit: true));
  }

  @override
  void initState() {
    super.initState();
    _bloc = context.bloc<SendandrequestBloc>();
    _toController = TextEditingController();
    // _toController.addListener(() async {
    //   await _bloc
    //       .add(SendandrequestEvent.clientid(image: clientimage ?? AppStrings.empty, clientid: _toController.text));
    // });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _bloc.add(SendandrequestEvent.contacts(
          screen: widget.sendAndRequest.whichoption, amount: widget.sendAndRequest.amount));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<TransactionpinBloc, TransactionpinState>(
          listener: (context, state) async {
            if (state is TransactionpinChecked) {
              Future.delayed(Duration(seconds: 1), () async {
                await _bloc.add(SendandrequestEvent.submit(pin: state.transactionPin.pin));
                // await showGeneralDialog(
                //     context: context,
                //     pageBuilder: (context, _, __) {
                //       return CustomDialogUI(
                //           icontitle: false,
                //           titleheader: widget.sendAndRequest.whichoption
                //               ? '${AppStrings.confirmTransfer}'
                //               : '${AppStrings.azaRequest}',
                //           subtitle: widget.sendAndRequest.whichoption
                //               ? '${AppStrings.transferFund} ${widget.sendAndRequest.amount >= 5000 ? widget.sendAndRequest.amount + 5 : widget.sendAndRequest.amount} naira to  ${_toController.text}'
                //               : '${AppStrings.requestFund} ${widget.sendAndRequest.amount} naira from  ${_toController.text}',
                //           twobutton: true,
                //           discardtitle: AppStrings.cancel,
                //           discardtitleColor: ColorSets.colorPrimaryWhite,
                //           discardColor: ColorSets.colorPrimaryRed,
                //           acceptedbutton: () async {
                //             await _bloc.add(SendandrequestEvent.submit(pin: state.transactionPin.pin));
                //             await Navigator.pop(context);
                //           },
                //           acceptedtitle: AppStrings.proceed,
                //           acceptedtitleColor: ColorSets.colorPrimaryWhite,
                //           acceptedColor: ColorSets.colorPrimaryLightGreen,
                //           centerbutton: null,
                //           centertitle: null,
                //           centerColor: null,
                //           centertitleColor: null);
                //     },
                //     barrierDismissible: true,
                //     barrierLabel: '',
                //     barrierColor: Colors.black.withOpacity(0.8),
                //     useRootNavigator: true,
                //     transitionDuration: Duration(milliseconds: 300),
                //     transitionBuilder: (context, animation, __, child) {
                //       return SlideTransition(
                //         position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(animation),
                //         child: child,
                //       );
                //     });
              });
            }
          },
        ),
      ],
      child: BlocConsumer<SendandrequestBloc, SendandrequestState>(
        listener: (context, state) async {
          if (state is InputDataFundState) {
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
              await _bloc.add(SendandrequestEvent.clear());
            } else if (state.error >= 203) {
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
              await _bloc.add(SendandrequestEvent.clear());
            }
          }
        },
        builder: (context, state) {
          if (state is InputDataFundState) {
            return Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: AppBar(
                elevation: 0.0,
                centerTitle: true,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(DashBoard.naira, size: 12),
                    Text(Money.from(widget.sendAndRequest.amount, Currency.create('USD', 2))
                        .format('#,###.##')
                        .toString()),
                  ],
                ),
                actions: [
                  Row(
                    children: [
                      FlatButton(
                        child: Text(widget.sendAndRequest.whichoption ? AppStrings.send : AppStrings.request),
                        onPressed: (state.client.isNotEmpty || state.note.isNotEmpty)
                            ? () async {
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
                                                  widget.sendAndRequest.whichoption
                                                      ? '${AppStrings.confirmTransfer}'
                                                      : '${AppStrings.azaRequest}',
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
                                                          padding:
                                                              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 2),
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
                                                          padding:
                                                              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            children: [
                                                              Expanded(
                                                                child: Text(AppStrings.recipient,
                                                                    textAlign: TextAlign.start,
                                                                    style: AppTextStyles.h3style),
                                                              ),
                                                              Expanded(
                                                                child: Text(state.client,
                                                                    textAlign: TextAlign.right,
                                                                    style: AppTextStyles.h3style
                                                                        .copyWith(fontWeight: FontWeight.bold)),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        Padding(
                                                          padding: const EdgeInsets.symmetric(
                                                              horizontal: 20.0, vertical: 10),
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [
                                                              Expanded(
                                                                  child: Text(AppStrings.transferNote,
                                                                      textAlign: TextAlign.start,
                                                                      style: AppTextStyles.h3style)),
                                                              Expanded(
                                                                  child: Text(state.note ?? AppStrings.empty,
                                                                      textAlign: TextAlign.right,
                                                                      style: AppTextStyles.h3style
                                                                          .copyWith(fontWeight: FontWeight.bold))),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        Padding(
                                                          padding: const EdgeInsets.symmetric(
                                                              horizontal: 20.0, vertical: 10),
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [
                                                              Expanded(
                                                                child: Text(AppStrings.transferAmount,
                                                                    textAlign: TextAlign.start,
                                                                    style: AppTextStyles.h3style),
                                                              ),
                                                              Expanded(
                                                                child: Text(
                                                                    '${AppStrings.nairaUnicode}${state.amount.toString()}',
                                                                    textAlign: TextAlign.end,
                                                                    style: AppTextStyles.h3style
                                                                        .copyWith(fontWeight: FontWeight.bold)),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    state.amount >= 5000
                                                        ? TableRow(
                                                            children: [
                                                              Padding(
                                                                padding: const EdgeInsets.symmetric(
                                                                    horizontal: 20.0, vertical: 10),
                                                                child: Row(
                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                  children: [
                                                                    Text(AppStrings.transferTransactionFee,
                                                                        textAlign: TextAlign.start,
                                                                        style: AppTextStyles.h3style),
                                                                    Text(
                                                                        '${AppStrings.nairaUnicode}${AppStrings.transferTransactionFeeAmount}',
                                                                        textAlign: TextAlign.end,
                                                                        style: AppTextStyles.h3style
                                                                            .copyWith(fontWeight: FontWeight.bold)),
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
                                                                  Text(
                                                                      widget.sendAndRequest.whichoption
                                                                          ? '${AppStrings.nairaUnicode}${Money.from(state.amount >= 5000 ? state.amount + 5 : state.amount, Currency.create('USD', 2)).format('#,###.##')}'
                                                                          : '${AppStrings.nairaUnicode}${Money.from(state.amount, Currency.create('USD', 2)).format('#,###.##')}',
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
                            : null,
                        color: ColorSets.colorPrimaryLightYellow,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                        disabledColor: ColorSets.disableButtonColor,
                      ),
                    ],
                  )
                ],
              ),
              body: SafeArea(
                child: Column(
                  children: [
                    Column(
                      children: [
                        FormFieldUI(
                          currentnode: _tonode,
                          fieldController: _toController,
                          nextnode: _fornode,
                          contentpad: 12,
                          hint: AppStrings.entertagemail,
                          textInputAction: TextInputAction.next,
                          textInputType: TextInputType.text,
                          prefixicon: Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Text(
                              AppStrings.to,
                              style: AppTextStyles.h3style.copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                          errorText: null,
                          onchanged: (client) => _bloc.add(
                            SendandrequestEvent.clientid(clientid: client),
                          ),
                        ),
                        widget.sendAndRequest.whichoption
                            ? FormFieldUI(
                                currentnode: _fornode,
                                fieldController: _forController,
                                contentpad: 12,
                                hint: AppStrings.addnote,
                                textInputAction: TextInputAction.done,
                                textInputType: TextInputType.text,
                                prefixicon: Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: Text(AppStrings.fornote,
                                      style: AppTextStyles.h3style.copyWith(fontWeight: FontWeight.bold)),
                                ),
                                errorText: null,
                                onchanged: (note) => _bloc.add(
                                  SendandrequestEvent.addnote(note: note),
                                ),
                              )
                            : EmptyWidgetUI(),
                      ],
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Text(
                          AppStrings.recent,
                          style: AppTextStyles.h2style,
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 100,
                      child: state.contacts.isNotEmpty
                          ? Align(
                              alignment: Alignment.centerLeft,
                              child: ListView.builder(
                                  itemCount: state.contacts.length,
                                  shrinkWrap: true,
                                  physics: ScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        // //print(state.contacts[index].client);
                                        _toController = TextEditingController(
                                            text: state.contacts[index].client.replaceAll(RegExp(r'\s+\b|\b\s'), ''));
                                        _bloc.add(
                                          SendandrequestEvent.clientid(
                                            clientid: state.contacts[index].client,
                                          ),
                                        );
                                        // _bloc.add(SendandrequestEvent.isRadioSelectedPhoneNumber(selecteditem: index));
                                      },
                                      child: Card(
                                        key: ValueKey(index),
                                        elevation: 3.0,
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              CircleAvatar(
                                                child: Icon(
                                                  Icons.person,
                                                ),
                                              ),
                                              Text(
                                                state.contacts[index].client,
                                                style: AppTextStyles.h3style.copyWith(fontSize: 12),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                            )
                          : Center(
                              child: Text(AppStrings.noRecentContact,
                                  textAlign: TextAlign.center, style: AppTextStyles.h3style),
                            ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Text(
                          AppStrings.contacts,
                          style: AppTextStyles.h2style,
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    state.devicecontact.isNotEmpty
                        ? Expanded(
                            child: ListView.builder(
                              itemCount: state.devicecontact.length,
                              physics: BouncingScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) {
                                // //print(state.contact[index].avatar);
                                return BlocBuilder<SendandrequestBloc, SendandrequestState>(
                                  builder: (context, state) => LabeledRadio(
                                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                    vector: true,
                                    vectorpath: AppStrings.empty,
                                    title: (state as InputDataFundState).devicecontact[index].title ?? AppStrings.empty,
                                    label:
                                        (state as InputDataFundState).devicecontact[index].number ?? AppStrings.empty,
                                    transferstyle: true,
                                    value: index,
                                    groupValue: (state as InputDataFundState).isRadioSelectedPhoneNumber,
                                    onChanged: (position) {
                                      _toController = TextEditingController(
                                          text: (state as InputDataFundState)
                                              .devicecontact[position]
                                              .number
                                              .replaceAll(RegExp(r'\s+\b|\b\s'), ''));
                                      _bloc.add(
                                        SendandrequestEvent.clientid(
                                          clientid: (state as InputDataFundState)
                                              .devicecontact[position]
                                              .number
                                              .replaceAll(RegExp(r'\s+\b|\b\s'), ''),
                                        ),
                                      );
                                      _bloc.add(SendandrequestEvent.isRadioSelectedPhoneNumber(selecteditem: position));
                                    },
                                  ),
                                );
                              },
                            ),
                          )
                        : Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: Text(
                                AppStrings.noContact,
                                textAlign: TextAlign.center,
                                style: AppTextStyles.h3style,
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            );
          } else {
            return LoadingUI(function: (_) {}, showtext: true);
          }
        },
      ),
    );
  }
}
