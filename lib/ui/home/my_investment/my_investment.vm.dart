import 'package:intl/intl.dart';
import 'package:propstake/localization/locales.dart';
import 'package:propstake/ui/base/base-vm.dart';
import 'package:propstake/ui/home/profile/profile_home.vm.dart';
import 'package:propstake/utils/app_buttom_sheet.dart';
import 'package:propstake/utils/constants.dart';
import 'package:propstake/utils/string_extensions.dart';
import 'package:propstake/widget/price_widget.dart';

import '../../../gen/assets.gen.dart';
import 'auto_invest/auto_invest.ui.dart';
import 'deposit/deposit.ui.dart';
import 'faq_details/faq_detail_page.dart';
import 'my_investment.ui.dart';
import 'transaction_history/transaction_history.ui.dart';
import 'withdraw/withdraw.ui.dart';

class MyInvestHomeViewModel extends BaseViewModel {

  String getTextFromDateTime(DateTime dateTime){
    return DateFormat("h:mm a | MMM d, yyyy").format(dateTime);
  }

  List<Map<String, dynamic>> myBalance = [
    {
      "title": LocaleData.totalBalance.convertString(),
      "value": 5000,
      "currency": Currency.dollar
    },
    {
      "title": "USD Balance",
      "value": 1000,
      "currency": Currency.dollar
    },
    {
      "title": "NGN Balance",
      "value": 4000*1590,
      "currency": Currency.naira
    },
  ];

  List<Map<String, dynamic>> transactions = [
    {
      "title": "Investment in Ocean View Apartments",
      "image": Assets.svg.invest,
      "value": 300,
      "dateTime": DateTime(2025, 03, 27, 22, 10),
    },
    {
      "title": "Funds Withdrawn to Bank",
      "image": Assets.svg.fund,
      "value": 1200,
      "dateTime": DateTime(2025, 03, 22, 22, 10),
    },
    {
      "title": "Referral Bonus Earned",
      "image": Assets.svg.referralReward,
      "value": 3000,
      "dateTime": DateTime(2025, 03, 21, 10, 10),
    },

  ];

  goFaqDetail(FaqModel faq)async {
    navigationService.navigateToRoute(FaqDetailPage(faq: faq,));
  }

  goToTransactions()async {
    navigationService.navigateToRoute(TransactionHomeScreen());
  }

  goToDeposit()async {
    navigationService.navigateToRoute(DepositScreen());
  }

  goToWithdraw()async {
    navigationService.navigateToRoute(WithdrawScreen());
  }

  goToAutoInvest()async {
    navigationService.navigateToRoute(AutoInvestScreen());
  }

  popInvest()async{
    bottomSheets(
      noHeader: true,
      child: InvestOption(
        autoInvest: goToAutoInvest,
        explore: (){},
      )
    );
  }

}