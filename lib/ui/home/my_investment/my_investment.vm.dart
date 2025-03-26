import 'package:dio/dio.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:propstake/localization/locales.dart';
import 'package:propstake/ui/base/base-vm.dart';
import 'package:propstake/ui/home/my_investment/deposit/account_details.ui.dart';
import 'package:propstake/ui/home/profile/profile_home.vm.dart';
import 'package:propstake/utils/app_buttom_sheet.dart';
import 'package:propstake/utils/app_logger.dart';
import 'package:propstake/utils/constants.dart';
import 'package:propstake/utils/dartz.x.dart';
import 'package:propstake/utils/snack_message.dart';
import 'package:propstake/utils/string_extensions.dart';
import 'package:propstake/widget/price_widget.dart';

import '../../../data/model/cart_model.dart';
import '../../../data/model/transaction_response.dart';
import '../../../gen/assets.gen.dart';
import '../../../utils/widget_extensions.dart';
import '../../../widget/success_screen.dart';
import '../bottom_nav.ui.dart';
import 'auto_invest/auto_invest.ui.dart';
import 'deposit/deposit.ui.dart';
import 'faq_details/faq_detail_page.dart';
import 'my_investment.ui.dart';
import 'transaction_history/transaction_history.ui.dart';
import 'withdraw/withdraw.ui.dart';

class MyInvestHomeViewModel extends BaseViewModel {

  submit(){
    navigationService.navigateToRoute(
        SuccessScreen(
          onTap:()=> navigationService.navigateToAndRemoveUntilWidget(BottomNavigationScreen(initialIndex: 1,)),
          title: LocaleData.oncePaymentIsConfirmed.convertString(),
          body: "",
        )
    );
  }

  popInfo(){
    popDialog(
      // barrierDismissible: true,
        oneButton: true,
        width: width(navigationService.context)-100.sp,
        title: LocaleData.paymentInformation.convertString(),
        subTitle: LocaleData.paymentDetailsInfo.convertString()
    );
  }

  submitPayment(List<TempCart> items, String currentPrice)async{
    startLoader();
    try {
      await walletService.submitPayment(currentPrice: currentPrice, items: items);
      submit();
    } catch (err) {
      showCustomToast("Error making payment");
    } finally {
      stopLoader();
      notifyListeners();
    }
  }

  onInit(){
    Future.delayed(Duration(milliseconds: 300),popInfo);
  }

  confirm(List<TempCart> items, String currentPrice){
    popDialog(
      // barrierDismissible: true,
      // oneButton: false,
      width: width(navigationService.context)-100.sp,
      title: LocaleData.confirmPayment.convertString(),
      subTitle: LocaleData.confirmPaymentInfo.convertString(),
      onTap: ()=> submitPayment(items, currentPrice)
    );
  }

  List<Transaction> transactionsData = [];

  String getTextFromDateTime(DateTime dateTime){
    return DateFormat("h:mm a | MMM d, yyyy").format(dateTime);
  }

  init() async {
    await start();
    getApiBalance();
    getTransactions();
  }

  start()async{
    balance = userService.userBalance;
    myBalance = [
      {
        "title": LocaleData.totalBalance.convertString(),
        "value": balance ?? 0,
        "currency": Currency.naira
      },
      {
        "title": "NGN Balance",
        "value":  (balance ?? 0)*1590,
        "currency": Currency.naira
      },
    ];
    notifyListeners();
  }

  getApiBalance()async{

    if(balance == null){
      startLoader();
    }
    balance = await getWallet();
    myBalance = [
      {
        "title": LocaleData.totalBalance.convertString(),
        "value": balance ?? 0,
        "currency": Currency.naira
      },
      {
        "title": "USD Balance",
        "value": 0,
        "currency": Currency.naira
      },
      {
        "title": "NGN Balance",
        "value":  (balance ?? 0)*1590,
        "currency": Currency.naira
      },
    ];
    stopLoader();
    notifyListeners();
  }

  num? balance;

  List<Map<String, dynamic>> myBalance = [

  ];

  // List<Map<String, dynamic>> transactions = [
  //   {
  //     "title": "Investment in Ocean View Apartments",
  //     "image": Assets.svg.invest,
  //     "value": 300,
  //     "dateTime": DateTime(2025, 03, 27, 22, 10),
  //   },
  //   {
  //     "title": "Funds Withdrawn to Bank",
  //     "image": Assets.svg.fund,
  //     "value": 1200,
  //     "dateTime": DateTime(2025, 03, 22, 22, 10),
  //   },
  //   {
  //     "title": "Referral Bonus Earned",
  //     "image": Assets.svg.referralReward,
  //     "value": 3000,
  //     "dateTime": DateTime(2025, 03, 21, 10, 10),
  //   },
  //
  // ];

  getTransactions()async {
    startLoader();
    try{
      var res = await walletService.getTransactions();
      if(res.isRight()){
        transactionsData = res.asRight().data;
      }
    }on DioException catch(err){
      AppLogger.debug(err.message??"");
    } finally {
      stopLoader();
    }
    notifyListeners();
  }

  goFaqDetail(FaqModel faq)async {
    navigationService.navigateToRoute(FaqDetailPage(faq: faq,));
  }

  goToTransactions()async {
    navigationService.navigateToRoute(TransactionHomeScreen());
  }

  goToDeposit()async {
    navigationService.navigateToRoute(AccountDetailScreen());
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