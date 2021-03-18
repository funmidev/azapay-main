import 'package:azapay/app/app.dart';
import 'package:azapay/src/models/models.dart';
import 'package:azapay/src/ui/dashboard/azaAgent/cardless/aza_agent_pin_ui.dart';
import 'package:azapay/src/ui/dashboard/azaAgent/cardless/aza_agent_transaction_review.dart';
import 'package:azapay/src/ui/dashboard/azaAgent/cardless/cardless_withdrawal.dart';
import 'package:azapay/src/ui/dashboard/azaAgent/cardless/input_cardless_amount_ui.dart';
import 'package:azapay/src/ui/dashboard/azaAgent/cardless/pay_to_aza_agent_ui.dart';
import 'package:azapay/src/ui/dashboard/azaAgent/locateAgent/azaAgent_profile.dart';
import 'package:azapay/src/ui/dashboard/azaAgent/locateAgent/locate_aza_agent_ui.dart';
import 'package:azapay/src/ui/dashboard/azaAgent/saveBeneficiary/save_beneficiary.dart';
import 'package:azapay/src/ui/dashboard/wallet/load_by_transfer_ui.dart';
import 'package:azapay/src/ui/dashboard/wallet/load_by_ussd_ui.dart';
import 'package:azapay/src/ui/ui.dart';
import 'package:azapay/src/widget/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:universal_platform/universal_platform.dart';

import 'src/ui/dashboard/hub/merchant_cash_till.dart';
import 'src/ui/dashboard/hub/merchant_cashier.dart';

class RouteGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      // case AppRouteName.app:
      //   return _pageRoute(widget: App());
      //   break;
      case AppRouteName.home:
        return _pageRoute(settings: settings, widget: DashBoardUI());
        break;
      case AppRouteName.onboardingmain:
        return _pageRoute(settings: settings, widget: OnBoardMainUI());
        break;
      case AppRouteName.sendandrequest:
        return _pageRoute(
            settings: settings, widget: SendRequestUI(sendAndRequest: args));
        break;
      case AppRouteName.paybillservices:
        if (args is PayBillsName) {
          return _pageRoute(
              settings: settings, widget: BuyOptionUI(payBillsName: args));
        }
        return _errorRoute(settings: null);
        break;
      case AppRouteName.paybills:
        return _pageRoute(settings: settings, widget: PayBillUI());
        break;
      case AppRouteName.signin:
        return _pageRoute(settings: settings, widget: SignInUI());
        break;
      case AppRouteName.activity:
        return _pageRoute(settings: settings, widget: ActivityUI());

        break;
      case AppRouteName.profile:
        return _pageRoute(settings: settings, widget: UserProfileUI());
        break;
      case AppRouteName.qrcode:
        if (args is QrScan) {
          return _pageRoute(
              settings: settings,
              widget: QRCodeUI(
                qrScan: args,
              ));
        }
        return _errorRoute();
        break;
      case AppRouteName.completeprofile:
        return PageRouteBuilder(
          opaque: false,
          pageBuilder: (context, _, __) => CompleteProfileUI(),
          fullscreenDialog: true,
        );
        break;
      case AppRouteName.email_creation:
        return _pageRoute(settings: settings, widget: CreateEmailTelephoneUI());
        break;
      case AppRouteName.otp_code:
        return _pageRoute(settings: settings, widget: OtpCodeUI());
        break;
      case AppRouteName.transactionpin:
        return _pageRoute(
            settings: settings,
            widget: TransactionUI(
              value: args,
            ));
        break;
      case AppRouteName.ticket:
        if (args is TicketDetails) {
          return _pageRoute(
              settings: settings,
              widget: CustomTicketDetails(
                ticketDetails: args,
              ));
        }
        return _errorRoute();
        break;
      case AppRouteName.full_name_creation:
        return _pageRoute(settings: settings, widget: CreateFullNameUI());
        break;
      case AppRouteName.password_creation:
        return _pageRoute(settings: settings, widget: CreatePasswordUI());
        break;
      case AppRouteName.azapay_tag:
        return _pageRoute(settings: settings, widget: AzaPayTagUI());

        break;
      case AppRouteName.forgot_password:
        return _pageRoute(settings: settings, widget: ForgotPasswordUI());
        break;
      case AppRouteName.forgot_password_success:
      case AppRouteName.forgot_password_verified_user_success:
      case AppRouteName.reset_password_success:
      case AppRouteName.signup_success:
        // case AppRouteName.successresponse:
        // case AppRouteName.failedresponse:
        if (args is VerifiedSuccessResponse) {
          return _pageRoute(
              settings: settings,
              widget: VerifiedSuccessUI(verifiedSuccessResponse: args));
        }
        return _errorRoute();
        break;
      case AppRouteName.forgot_password_verification:
        return _pageRoute(settings: settings, widget: ForgotPasswordVerifyUI());
        break;
      case AppRouteName.documentprofile:
        return _pageRoute(settings: settings, widget: DocumentsUI());
        break;
      case AppRouteName.referralprofile:
        return _pageRoute(settings: settings, widget: ReferralCodeUI());
        break;
      case AppRouteName.notificationprofile:
        return _pageRoute(settings: settings, widget: NotificationUI());
        break;
      case AppRouteName.helpsupportpprofile:
        return _pageRoute(settings: settings, widget: HelpSupportUI());
        break;
      case AppRouteName.tierprofile:
        return _pageRoute(settings: settings, widget: TierUI());
        break;
      case AppRouteName.privacysecurityprofile:
        return _pageRoute(settings: settings, widget: PrivacySecurityUI());
        break;
      case AppRouteName.useraccountinfoprofile:
        return _pageRoute(
            settings: settings,
            widget: UserAccountInfoUI(
              requireddetails: args,
            ));
        break;
      case AppRouteName.reset_password:
        return _pageRoute(settings: settings, widget: ResetPasswordUI());
        break;
      case AppRouteName.passwordsettings:
        return _pageRoute(settings: settings, widget: PasswordSettingsUI());
        break;
      case AppRouteName.changepassword:
        return _pageRoute(settings: settings, widget: ChangePasswordUI());
        break;
      case AppRouteName.banklinkaccount:
        return _pageRoute(
            settings: settings, widget: AddBeneficiaryAccountUI());
        break;
      case AppRouteName.linkbank:
        return _pageRoute(settings: settings, widget: LinkBanksUI());
        break;
      case AppRouteName.bankmaketransfer:
        return _pageRoute(settings: settings, widget: MakeTransferUI());
        break;
      case AppRouteName.wallet:
        return _pageRoute(settings: settings, widget: WalletUI());
        break;
      case AppRouteName.walletloadaccount:
        return _pageRoute(settings: settings, widget: LoadAccountUI());
        break;
      case AppRouteName.walletloadbytransfer:
        return _pageRoute(settings: settings, widget: LoadByTransferUI());
        break;
      case AppRouteName.walletloadbyussd:
        return _pageRoute(settings: settings, widget: LoadByUssdUI());
        break;
      //---------Web---------------//
      case AppRouteName.getstartedWeb:
        return _pageRoute(settings: settings, widget: OnBoardingMainUIWeb());
        break;
      case AppRouteName.onboardingWeb:
        return _pageRoute(settings: settings, widget: OnBoardingWelcomeUIWeb());
        break;
      case AppRouteName.signinWeb:
        return _pageRoute(settings: settings, widget: SignInUIWeb());
        break;
      case AppRouteName.signupEmailPhoneWeb:
        return _pageRoute(settings: settings, widget: EmailPhoneUIWeb());
        break;
      case AppRouteName.signupOtpcodeWeb:
        return _pageRoute(settings: settings, widget: OtpCodeUIWeb());
        break;
      case AppRouteName.signupPasswordWeb:
        return _pageRoute(settings: settings, widget: CreatePasswordUIWeb());
        break;
      case AppRouteName.signupAzatagWeb:
        return _pageRoute(settings: settings, widget: AzatagUIWeb());
        break;
      // case AppRouteName.signupWeb:
      //   return _pageRoute(widget: LoadByUssdUI());
      //   break;
      case AppRouteName.dashboardWeb:
        return _pageRoute(settings: settings, widget: DashBoardUIWeb());
        break;
      case AppRouteName.forgotPasswordWeb:
        return _pageRoute(settings: settings, widget: ForgotPasswordWebUI());
        break;
      case AppRouteName.walletWeb:
        return _pageRoute(settings: settings, widget: WalletUIWeb());
        break;
      case AppRouteName.transactionWeb:
        return _pageRoute(settings: settings, widget: TransactionUIWeb());
        break;
      case AppRouteName.settingsWeb:
        return _pageRoute(settings: settings, widget: SettingsUIWeb());
        break;
      case AppRouteName.logoutWeb:
        return _pageRoute(settings: settings, widget: LoadByUssdUI());
        break;
      case AppRouteName.homeWeb:
        return _pageRoute(settings: settings, widget: HomeWebUI());
        break;
      case AppRouteName.profileWeb:
        return _pageRoute(settings: settings, widget: ProfileWebUI());
        break;
      case AppRouteName.transactionPinWeb:
        return _pageRoute(settings: settings, widget: TransactionPinWebUI());
        break;
      case AppRouteName.resetpasswordWeb:
        return _pageRoute(settings: settings, widget: ResetPasswordWebUI());
        break;
      case AppRouteName.forgotpasswordotpWeb:
        return _pageRoute(
            settings: settings, widget: ForgotVerificationCodeWebUI());
        break;
      // case AppRouteName.completedProcessWeb:
      // //todo:
      //   return _pageRoute(widget: CompletedProcessWebUI());
      //   break;

      //Saturday edits
      case AppRouteName.merchant:
        return _pageRoute(settings: settings, widget: MerchantHubUI());
        break;
      case AppRouteName.merchantTill:
        return _pageRoute(
            settings: settings, widget: MerchantCashTillTagging());
        break;
      case AppRouteName.merchantCashier:
        return _pageRoute(
            settings: settings,
            widget: MerchantCashier(
              merchantData: args,
            ));
        break;

      ///
      ///
      ///
      ///---------adding the cashless-withdrawal to the route----------
      case AppRouteName.cardlessWithdrawal:
        return _pageRoute(settings: settings, widget: CardlessWithdrawal());
        break;

      ///
      ///  InputMerchantAmountUI
      /// -------- adding pay-to-AzaAgent to the route-------------
      case AppRouteName.paytoAzaAgent:
        return _pageRoute(settings: settings, widget: PayToAzaAgent());
        break;

      /// -------- adding inputAmount to the route-------------
      case AppRouteName.inputmyAmount:
        return _pageRoute(
            settings: settings,
            widget: InputCardlessAmountUi(
              AzaAgentName: args,
            ));
        break;

      ///
      ///
      ///
      case AppRouteName.azaAgentTransacReview:
        return _pageRoute(
            settings: settings, widget: AzaAgentTransactionReview());
        break;

      ///
      ///
      ///
      case AppRouteName.azaAgentPin:
        return _pageRoute(settings: settings, widget: AzaAgentPinUi());
        break;

      ///
      ///
      ///
      case AppRouteName.locateAzaAgent:
        return _pageRoute(settings: settings, widget: LocateAzaAgent(
          azaAgentData: args,
        ));
        break;

      ///
      ///
      ///
      case AppRouteName.saveBeneficiary:
        return _pageRoute(settings: settings, widget: SaveBeneficiary());
        break;

      ///
      ///
      ///
      case AppRouteName.azaAgentProfile:
        return _pageRoute(settings: settings, widget: AzaAgentProfile());
        break;

      default:
        return _errorRoute(
          settings: settings,
        );
    }
  }

  static Route<dynamic> _errorRoute({@required RouteSettings settings}) {
    return MaterialPageRoute(
        settings: settings,
        builder: (_) {
          if (UniversalPlatform.isAndroid) {
            return Scaffold(
              appBar: AppBar(
                title: Text('Error'),
                centerTitle: true,
              ),
            );
          } else if (UniversalPlatform.isIOS) {
            return CupertinoPageScaffold(
                navigationBar: CupertinoNavigationBar(
                  middle: Text('Error'),
                ),
                child: Center(child: Text('Hi')));
          } else {
            return Center(
              child: Text('Invalid Device'),
            );
          }
        });
  }
}

PageRoute _pageRoute(
    {@required RouteSettings settings, @required Widget widget}) {
  if (UniversalPlatform.isAndroid) {
    return MaterialPageRoute(settings: settings, builder: (_) => widget);
  } else if (UniversalPlatform.isIOS) {
    return CupertinoPageRoute(settings: settings, builder: (_) => widget);
  } else {
    return MaterialPageRoute(settings: settings, builder: (_) => widget);
  }
}
