import 'package:azapay/app/app.dart';
import 'package:azapay/src/blocs/blocs.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TransactionCardDetailsWebUI extends StatelessWidget {
  const TransactionCardDetailsWebUI({
    Key key,
    @required this.cardA,
    @required WalletBloc walletBloc,
    // @required ActivityLoaded state,
    // @required int index,
    @required final String fromKey,
    @required final String toKey,
    @required final double amount,
    @required final String status,
    @required final double charge,
    @required final String fromType,
    @required final String toType,
    @required final String ref,
  })  : _walletBloc = walletBloc,
        // _state = state,
        // _index = index,
        _fromKey = fromKey,
        _toKey = toKey,
        _amount = amount,
        _status = status,
        _charge = charge,
        _fromType = fromType,
        _toType = toType,
        _ref = ref,
        super(key: key);

  final GlobalKey<ExpansionTileCardState> cardA;
  final WalletBloc _walletBloc;
  // final ActivityLoaded _state;
  // final int _index;
  final String _fromKey;
  final String _toKey;
  final double _amount;
  final String _status;
  final double _charge;
  final String _fromType;
  final String _toType;
  final String _ref;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Color(0XFFFFB300),
            width: 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: ExpansionTileCard(
            elevation: 2.0,
            borderRadius: BorderRadius.circular(10),
            // key: cardA,
            leading: CircleAvatar(
              backgroundColor: ColorSets.colorPrimaryWhite.withOpacity(0.5),
              child: Icon(
                Icons.account_balance,
                color: ColorSets.colorPrimaryLightYellow,
              ),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    '${AppStrings.from} ${_fromKey} to ${_toKey}',
                    style: AppTextStyles.h3style.copyWith(fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: _walletBloc.state is WalletStateLoaded
                      ? _fromKey == (_walletBloc.state as WalletStateLoaded).wallet.data.key
                          ? Text(
                              '+${AppStrings.nairaUnicode}${_amount}',
                              style: AppTextStyles.h3style.copyWith(fontWeight: FontWeight.w500),
                            )
                          : Text(
                              '+${AppStrings.nairaUnicode}${_amount}',
                              style: AppTextStyles.h3style.copyWith(fontWeight: FontWeight.w500),
                            )
                      : Text(''),
                ),
              ],
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text('${_ref}', style: AppTextStyles.h3style),
            ),
            trailing: Icon(Icons.arrow_drop_down_circle_outlined),
            children: <Widget>[
              // Divider(
              //   thickness: 1.0,
              //   height: 1.0,
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(AppStrings.activityStatusforTransaction, style: AppTextStyles.h3style),
                      Text('${_status}',
                          style: AppTextStyles.h3style.copyWith(
                              color: _status == AppStrings.activityconfirmedforTransaction
                                  ? ColorSets.colorPrimaryLightGreen
                                  : ColorSets.colorPrimaryRed))
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(AppStrings.azapayFee, style: AppTextStyles.h3style),
                      Text('${_charge}', style: AppTextStyles.h3style),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(AppStrings.payementInfo, style: AppTextStyles.h3style),
                      Text(
                        '${_fromType}  to ${_toType}',
                        style: AppTextStyles.h3style,
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
