import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:propstake/data/model/cart_model.dart';
import 'package:propstake/localization/locales.dart';
import 'package:propstake/ui/base/base-vm.dart';
import 'package:propstake/ui/home/bottom_nav.ui.dart';
import 'package:propstake/ui/home/my_investment/deposit/account_details.ui.dart';
import 'package:propstake/ui/home/profile/profile_home.vm.dart';
import 'package:propstake/utils/app_buttom_sheet.dart';
import 'package:propstake/utils/app_logger.dart';
import 'package:propstake/utils/constants.dart';
import 'package:propstake/utils/dartz.x.dart';
import 'package:propstake/utils/string_extensions.dart';
import 'package:propstake/widget/price_widget.dart';

import '../../../data/model/propert_response.dart';
import '../../../data/model/transaction_response.dart';
import '../../../gen/assets.gen.dart';
import 'auto_invest/auto_invest.ui.dart';
import 'deposit/deposit.ui.dart';
import 'faq_details/faq_detail_page.dart';
import 'my_investment.ui.dart';
import 'transaction_history/transaction_history.ui.dart';
import 'withdraw/withdraw.ui.dart';

class MyInvestHomeViewModel extends BaseViewModel {

  // List<Transaction> transactionsData = [];
  List<TempTransactions> transactionsData = [];

  double totalInvestment() =>
      transactionsData.fold(0.0, (a, t) => a + (t.amountSelected ?? 0));

  String getTextFromDateTime(DateTime dateTime){
    return DateFormat("h:mm a | MMM d, yyyy").format(dateTime);
  }

  List<PropertyResponse> properties = [];

  void listenToFirestore() {
    FirebaseFirestore.instance
        .collection("new") // Listening to the entire "new" collection
        .snapshots()
        .listen((snapshot) {

      List<Map<String, dynamic>> data = snapshot.docs.map((doc) {
        // Create a new map to avoid modifying Firestore's immutable data
        Map<String, dynamic> docData = Map<String, dynamic>.from(doc.data());
        docData['id'] = doc.id;  // Add document ID to the map
        return docData;
      }).toList();

      for (var dat in data) {

        try {
          PropertyResponse propertyData = PropertyResponse.fromJson(dat);
          if(properties.any((test)=> test.id == propertyData.id)){
            properties[properties.indexWhere((test)=> test.id == propertyData.id)] = propertyData;
          }else{
            properties.add(propertyData);
          }
          notifyListeners();
        } catch (e) {
          AppLogger.debug("Error parsing PropertyResponse: $e | Data: $dat");
        }
      }

    });
    notifyListeners();
  }

  init() async {
    listenToFirestore();
    // getApiBalance();
    await getTransactions();
  }

  start()async{
    balance = totalInvestment();
    myBalance = [
      {
        "title": LocaleData.totalInvestmentOnly.convertString(),
        "value": balance ?? 0,
        "currency": Currency.dollar
      },
      {
        "title": "USD Balance",
        "value": 0,
        "currency": Currency.naira
      },
      {
        "title": "NGN Balance",
        "value":  (balance ?? 0)*1550,
        "currency": Currency.naira
      },
    ];
    notifyListeners();
  }

  // getApiBalance()async{
  //
  //   if(balance == null){
  //     startLoader();
  //   }
  //   balance = await getWallet();
  //   myBalance = [
  //     {
  //       "title": LocaleData.totalBalance.convertString(),
  //       "value": balance ?? 0,
  //       "currency": Currency.naira
  //     },
  //     {
  //       "title": "USD Balance",
  //       "value": 0,
  //       "currency": Currency.naira
  //     },
  //     {
  //       "title": "NGN Balance",
  //       "value":  (balance ?? 0)*1590,
  //       "currency": Currency.naira
  //     },
  //   ];
  //   stopLoader();
  //   notifyListeners();
  // }

  num? balance;

  List<Map<String, dynamic>> myBalance = [
    {
      "title": LocaleData.totalBalance.convertString(),
      "value": 0,
      "currency": Currency.naira
    },
    {
      "title": "USD Balance",
      "value": 0,
      "currency": Currency.naira
    },
    {
      "title": "NGN Balance",
      "value": 0,
      "currency": Currency.naira
    },
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
      var res = await walletService.fetchTransactions();
      if(res.isNotEmpty){
        transactionsData = res;
        await start();
      }
      notifyListeners();
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
        explore: ()=> navigationService.navigateToAndRemoveUntilWidget(BottomNavigationScreen()),
      )
    );
  }

}