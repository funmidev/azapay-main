import 'package:azapay/app/app.dart';
import 'package:azapay/src/blocs/blocs.dart';
import 'package:azapay/src/models/models.dart';
import 'package:azapay/src/ui/ui.dart';
import 'package:azapay/src/widget/responsive_web/data/classes/responsive_web.dart';
import 'package:azapay/src/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeWebUI extends StatefulWidget {
  @override
  _HomeWebUIState createState() => _HomeWebUIState();
}

class _HomeWebUIState extends State<HomeWebUI> {
  DashboardBloc _bloc;
  @override
  void initState() {
    _bloc = context.bloc<DashboardBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WalletBloc, WalletState>(
      builder: (context, state) {
        if (state is WalletStateLoaded) {
          return TwoColumnNavigation(
            title: Image.asset(
              AppImages.azaPayLogo,
              scale: 45,
            ),
//             expandedIconData: AnimatedIcon(
//   icon: AnimatedIcons.menu_arrow,
//   progress: controller,
//   semanticLabel: 'Show menu',
// ),
            showDetailsArrows: false,
            backgroundColor: ColorSets.colorPin.withOpacity(0.6),
            bottomAppBar: BottomAppBar(
              elevation: 0.0,
              color: Colors.transparent,
              child: InkWell(
                onHover: (value) {},
                onTap: () {
                  context.bloc<ProfileBloc>().add(DeleteEveryResponse());
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // InkWell(
                      //   onTap: () {},
                      //   child: ListTile(
                      //     leading: Icon(MdiIcons.logout),
                      //     title: Text(
                      //       AppStrings.logout,
                      //       style: AppTextStyles.h2style,
                      //     ),
                      //   ),
                      // ),
                      Icon(
                        Merchant.outline_logout,
                        size: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text(
                          AppStrings.logout,
                          style: AppTextStyles.h3style.copyWith(fontWeight: FontWeight.w600),
                        ),
                      ),
                      // IconButton(icon: Icon(Icons.settings), onPressed: null),
                      // IconButton(icon: Icon(Icons.info), onPressed: null),
                      // IconButton(icon: Icon(Icons.library_books), onPressed: null),
                      // IconButton(icon: Icon(MdiIcons.wallet), onPressed: null),
                    ],
                  ),
                ),
              ),
            ),
            sections: [
              MainSection(
                  itemBuilder: (context, index, selected) {},
                  itemCount: null,
                  getDetails: (contex, index) {
                    return DetailsWidget(
                        title: Text(
                          AppStrings.empty,
                          style: AppTextStyles.h3style.copyWith(fontWeight: FontWeight.w600),
                        ),
                        child: DashBoardUIWeb());
                  },
                  icon: Icon(
                    Merchant.outline_dashboard,
                    size: 20,
                  ),
                  label: Text(
                    AppStrings.dashboardweb,
                    style: AppTextStyles.h3style.copyWith(fontWeight: FontWeight.w600),
                  )),
              MainSection(
                  itemBuilder: (context, index, selected) {},
                  itemCount: null,
                  getDetails: (contex, index) {
                    return DetailsWidget(
                        title: Text(
                          AppStrings.empty,
                          style: AppTextStyles.h3style.copyWith(fontWeight: FontWeight.w600),
                        ),
                        child: WalletUIWeb());
                  },
                  icon: Icon(
                    Merchant.outline_wallet,
                    size: 20,
                  ),
                  label: Text(
                    AppStrings.walletweb,
                    style: AppTextStyles.h3style.copyWith(fontWeight: FontWeight.w600),
                  )),
              MainSection(
                  itemBuilder: (context, index, selected) {},
                  itemCount: null,
                  getDetails: (contex, index) {
                    return DetailsWidget(
                        title: Text(
                          AppStrings.empty,
                          style: AppTextStyles.h3style.copyWith(fontWeight: FontWeight.w600),
                        ),
                        child: TransactionUIWeb());
                  },
                  icon: Icon(
                    Merchant.outline_transaction,
                    size: 20,
                  ),
                  label: Text(
                    AppStrings.transactionweb,
                    style: AppTextStyles.h3style.copyWith(fontWeight: FontWeight.w600),
                  )),
              MainSection(
                  itemBuilder: (context, index, selected) {},
                  itemCount: null,
                  getDetails: (contex, index) {
                    return DetailsWidget(
                        title: Text(
                          AppStrings.empty,
                          style: AppTextStyles.h3style.copyWith(fontWeight: FontWeight.w600),
                        ),
                        child: SettingsUIWeb());
                  },
                  icon: Icon(
                    Merchant.outline_settings,
                    size: 20,
                  ),
                  label: Text(
                    AppStrings.settingsweb,
                    style: AppTextStyles.h3style.copyWith(fontWeight: FontWeight.w600),
                  )),
            ],
          );
        } else {
          return LoadingUI(function: (_) {
            if ((state as WalletStateInitial).value) {
              _bloc.add(Fetch());
            }
          });
        }
      },
    );
  }
}
