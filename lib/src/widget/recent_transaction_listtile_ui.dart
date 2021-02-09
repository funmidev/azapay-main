import 'dart:typed_data';

import 'package:azapay/app/app.dart';
import 'package:azapay/src/models/models.dart';
import 'package:azapay/src/widget/empty_widget.dart';
import 'package:azapay/utils/convert_bytes_to_image.dart';
import 'package:flutter/material.dart';

class RecentTransactionListTileUI extends StatelessWidget {
  final RecentTransact recentTransact;
  final bool nonotifyvisibility;
  final VoidCallback onTapped;
  RecentTransactionListTileUI({this.recentTransact, this.nonotifyvisibility, this.onTapped});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
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
              onTap: onTapped,
              leading: CircleAvatar(
                backgroundColor: ColorSets.colorPrimaryWhite.withOpacity(0.8),
                child: Icon(
                  Icons.account_balance,
                  color: ColorSets.colorPrimaryLightYellow,
                ),
              ),
              title: Text(recentTransact.title, style: AppTextStyles.h3style.copyWith(fontWeight: FontWeight.bold)),
              subtitle: Text(recentTransact.subtitle, style: AppTextStyles.h3style.copyWith(fontSize: 14)),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  recentTransact.showicon
                      ? Icon(
                          recentTransact.credit ? Icons.add : Icons.remove,
                          color: recentTransact.credit ? ColorSets.colorPrimaryLightGreen : ColorSets.colorPrimaryRed,
                        )
                      : EmptyWidgetUI(),
                  Text(
                    recentTransact.iscurrency ? recentTransact.transact : recentTransact.status,
                    style: AppTextStyles.h3style.copyWith(
                        fontSize: 12,
                        color: recentTransact.credit ? ColorSets.colorPrimaryLightGreen : ColorSets.colorPrimaryRed),
                  ),
                ],
              ),
            ),
          ),
        ),
        nonotifyvisibility
            ? EmptyWidgetUI()
            : Positioned(
                // draw a red marble
                top: 13.0,
                right: 11.0,
                child: Icon(Icons.brightness_1, size: 8.0, color: Colors.redAccent),
              ),
      ],
    );
  }
}
