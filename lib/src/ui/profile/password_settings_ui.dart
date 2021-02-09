import 'package:azapay/app/app.dart';
import 'package:flutter/material.dart';

class PasswordSettingsUI extends StatefulWidget {
  @override
  _PasswordSettingsUIState createState() => _PasswordSettingsUIState();
}

class _PasswordSettingsUIState extends State<PasswordSettingsUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text(AppStrings.privacyFourI,
            style: AppTextStyles.h3style.copyWith(fontWeight: FontWeight.w600, fontSize: 20)),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15.0, left: 8, right: 5),
            child: InkWell(
              onTap: () async {
                await Navigator.pushNamed(context, AppRouteName.forgot_password);
                // Navigator.pushNamed(context, AppRouteName.reset_password, arguments: 1);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: ColorSets.colorPin,
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            AppStrings.passwordsettingsTitleI,
                            textAlign: TextAlign.left,
                            style: AppTextStyles.h3style.copyWith(fontWeight: FontWeight.w600, fontSize: 18),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            AppStrings.passwordsettingsSubTitleI,
                            textAlign: TextAlign.left,
                          ),
                        )
                      ],
                    ),
                    Expanded(
                        child: Align(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: ColorSets.colorGrey,
                      ),
                    ))
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, AppRouteName.transactionpin, arguments: 1);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: ColorSets.colorPin,
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            AppStrings.passwordsettingsTitleII,
                            style: AppTextStyles.h3style.copyWith(fontWeight: FontWeight.w600, fontSize: 18),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            AppStrings.passwordsettingsSubTitleII,
                            textAlign: TextAlign.left,
                          ),
                        )
                      ],
                    ),
                    Expanded(
                        child: Align(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: ColorSets.colorGrey,
                      ),
                    ))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
