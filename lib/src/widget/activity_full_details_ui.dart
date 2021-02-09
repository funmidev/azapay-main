import 'package:azapay/app/app.dart';
import 'package:azapay/src/models/models.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money2/money2.dart';

class ActivityFullDetailsUI extends StatelessWidget {
  final TransactionHistory transactionHistory;

  ActivityFullDetailsUI({this.transactionHistory});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          AppStrings.activityTitle,
          style: AppTextStyles.h3style.copyWith(fontWeight: FontWeight.w600, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.width / 7, left: 10, right: 10),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: ColorSets.colorItemBackground,
                        border: Border.all(
                          color: Color(0XFFFFB300),
                          width: 1,
                        ),
                      ),
                      child: Table(
                        children: [
                          TableRow(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: MediaQuery.of(context).size.width / 6, bottom: 20),
                                child: Center(
                                    child: Text(
                                  AppStrings.activityTitleforTransaction,
                                  style: AppTextStyles.h2style,
                                )),
                              )
                            ],
                          ),
                          TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                        child: Text(AppStrings.activityDateforTransaction,
                                            textAlign: TextAlign.left, style: AppTextStyles.h3style)),
                                    Expanded(
                                      child: Text(
                                          DateFormat('EEE, d-MM-yyyy').format(
                                            DateTime.parse(transactionHistory.createdAt),
                                          ),
                                          textAlign: TextAlign.right,
                                          style: AppTextStyles.h3style),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                        child: Text(AppStrings.activityTimeforTransaction,
                                            textAlign: TextAlign.left, style: AppTextStyles.h3style)),
                                    Expanded(
                                      child: Text(
                                          DateFormat.jms().format(
                                            DateTime.parse(transactionHistory.createdAt),
                                          ),
                                          textAlign: TextAlign.right,
                                          style: AppTextStyles.h3style),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                        child: Text(AppStrings.activityAmountforTransaction,
                                            textAlign: TextAlign.left, style: AppTextStyles.h3style)),
                                    Expanded(
                                      child: Text(
                                          '${AppStrings.nairaUnicode}${Money.from(transactionHistory.amount ?? 0, Currency.create('USD', 2)).format('#,###.##').toString()}',
                                          textAlign: TextAlign.right,
                                          style: AppTextStyles.h3style),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                        child: Text(AppStrings.azapayFee,
                                            textAlign: TextAlign.left, style: AppTextStyles.h3style)),
                                    Expanded(
                                      child: Text('${AppStrings.nairaUnicode}${transactionHistory.charge}',
                                          textAlign: TextAlign.right, style: AppTextStyles.h3style),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                        child: Text(AppStrings.recipientAccountNumber,
                                            textAlign: TextAlign.left, style: AppTextStyles.h3style)),
                                    Expanded(
                                      child: Text('${transactionHistory.pair.to_key}',
                                          textAlign: TextAlign.right, style: AppTextStyles.h3style),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                        child: Text(AppStrings.payementInfo,
                                            textAlign: TextAlign.left, style: AppTextStyles.h3style)),
                                    Expanded(
                                      child: Text(
                                          '${transactionHistory.pair.from_type} to ${transactionHistory.pair.to_type}',
                                          textAlign: TextAlign.right,
                                          style: AppTextStyles.h3style),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                        child: Text(AppStrings.activityReferenceforTransaction,
                                            textAlign: TextAlign.left, style: AppTextStyles.h3style)),
                                    Expanded(
                                      child: Text(
                                        transactionHistory.ref,
                                        style: AppTextStyles.h3style,
                                        textAlign: TextAlign.right,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                        child: Text(AppStrings.activityTypeforTransaction,
                                            textAlign: TextAlign.left, style: AppTextStyles.h3style)),
                                    Expanded(
                                      child: Text(
                                        transactionHistory.type,
                                        style: AppTextStyles.h3style,
                                        textAlign: TextAlign.right,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(AppStrings.activityNoteforTransaction,
                                          textAlign: TextAlign.left, style: AppTextStyles.h3style),
                                    ),
                                    Expanded(
                                      child: Text(
                                        transactionHistory.note ?? AppStrings.empty,
                                        textAlign: TextAlign.right,
                                        style: AppTextStyles.h3style,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(AppStrings.activityStatusforTransaction,
                                        textAlign: TextAlign.left, style: AppTextStyles.h3style),
                                    Text(
                                      transactionHistory.status,
                                      style: AppTextStyles.h3style.copyWith(
                                        color: transactionHistory.status == AppStrings.activityconfirmedforTransaction
                                            ? ColorSets.colorPrimaryLightGreen
                                            : ColorSets.colorPrimaryRed,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.width / 17),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        border: Border.all(color: ColorSets.colorPrimaryBlack, width: 1),
                        shape: BoxShape.circle,
                        color: ColorSets.colorPrimaryWhite,
                        // borderRadius: BorderRadius.circular(40),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Center(
                          child: Icon(
                            Icons.account_balance,
                            color: ColorSets.colorPrimaryLightYellow,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
