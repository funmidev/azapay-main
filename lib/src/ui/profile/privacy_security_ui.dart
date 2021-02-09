import 'package:azapay/app/app.dart';
import 'package:azapay/src/blocs/blocs.dart';
import 'package:azapay/src/widget/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universal_platform/universal_platform.dart';

class PrivacySecurityUI extends StatefulWidget {
  @override
  _PrivacySecurityUIState createState() => _PrivacySecurityUIState();
}

class _PrivacySecurityUIState extends State<PrivacySecurityUI> {
  SettingsBloc _settingsBloc;
  @override
  void initState() {
    super.initState();
    _settingsBloc = context.bloc<SettingsBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text(AppStrings.privacyOne),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: ColorSets.colorPin,
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: BlocBuilder<SettingsBloc, SettingsState>(
                    builder: (context, state) {
                      return PrivacySecurityItem(
                          title: AppStrings.privacyTwoI,
                          subtitle: AppStrings.privacyTwoII,
                          togglebuttonvisibility: true,
                          value: state.securityvalue,
                          onChanged: (newvalue) {
                            _settingsBloc.add(UpdateSettings(value: newvalue, position: 0));
                          });
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                decoration: BoxDecoration(
                  color: ColorSets.colorPin,
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: BlocBuilder<SettingsBloc, SettingsState>(
                    builder: (context, state) {
                      return PrivacySecurityItem(
                          title: AppStrings.privacyThreeI,
                          subtitle: AppStrings.privacyThreeII,
                          togglebuttonvisibility: true,
                          value: state.tagvisibilityvalue,
                          onChanged: (newvalue) {
                            _settingsBloc.add(UpdateSettings(value: newvalue, position: 1));
                          });
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, AppRouteName.passwordsettings);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorSets.colorPin,
                    borderRadius: BorderRadius.circular(
                      20,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: PrivacySecurityItem(
                      title: AppStrings.privacyFourI,
                      subtitle: AppStrings.privacyFourII,
                      togglebuttonvisibility: false,
                      value: null,
                      onChanged: null,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                decoration: BoxDecoration(
                  color: ColorSets.colorPin,
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        AppStrings.privacyFiveI,
                        textAlign: TextAlign.left,
                        style: AppTextStyles.h3style.copyWith(fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        AppStrings.privacyFiveII,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Divider(),
                    SizedBox(
                      height: 8,
                    ),
                    BlocBuilder<SettingsBloc, SettingsState>(
                      builder: (context, state) {
                        return PrivacySecurityItem(
                            title: AppStrings.privacySix,
                            subtitle: '',
                            togglebuttonvisibility: true,
                            value: state.alloweveryonevalue,
                            onChanged: (newvalue) {
                              _settingsBloc.add(UpdateSettings(value: newvalue, position: 2));
                            });
                      },
                    ),
                    BlocBuilder<SettingsBloc, SettingsState>(
                      builder: (context, state) {
                        return PrivacySecurityItem(
                            title: AppStrings.privacySeven,
                            subtitle: '',
                            togglebuttonvisibility: true,
                            value: state.contactsonlyvalue,
                            onChanged: (newvalue) {
                              _settingsBloc.add(UpdateSettings(value: newvalue, position: 3));
                            });
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PrivacySecurityItem extends StatelessWidget {
  const PrivacySecurityItem(
      {Key key,
      @required bool togglebuttonvisibility,
      @required String title,
      @required String subtitle,
      bool value,
      @required Function onChanged})
      : _togglebuttonvisibility = togglebuttonvisibility,
        _value = value,
        _onChanged = onChanged,
        _title = title,
        _subtitle = subtitle,
        super(key: key);

  final bool _togglebuttonvisibility;
  final bool _value;
  final Function _onChanged;
  final String _title;
  final String _subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        4.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _title,
                  textAlign: TextAlign.left,
                  style: AppTextStyles.h3style.copyWith(fontWeight: FontWeight.w600, fontSize: 18),
                ),
                Text(
                  _subtitle,
                  textAlign: TextAlign.left,
                  style: AppTextStyles.h3style,
                )
              ],
            ),
          ),
          UniversalPlatform.isIOS
              ? (_togglebuttonvisibility
                  ? CupertinoSwitch(
                      value: _value,
                      onChanged: _onChanged,
                    )
                  : EmptyWidgetUI())
              : UniversalPlatform.isAndroid
                  ? ((_togglebuttonvisibility)
                      ? Switch(
                          value: _value,
                          onChanged: _onChanged,
                        )
                      : EmptyWidgetUI())
                  : EmptyWidgetUI()
        ],
      ),
    );
  }
}

// Widget _switchwidget({bool togglebuttonvisibility, bool value, Function onChanged}) {
//   return ;
//   // if (Platform.isIOS) {
//   //   if (togglebuttonvisibility) {
//   //     return CupertinoSwitch(value: value, onChanged: onChanged);
//   //   }
//   // } else  if (Platform.isAndroid) {
//   //   if (togglebuttonvisibility) {
//   //     return Switch(value: value, onChanged: onChanged);
//   //   }
//   // }
//   // return EmptyWidgetUI();
// }
