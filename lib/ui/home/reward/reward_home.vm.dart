import 'package:clipboard/clipboard.dart';
import 'package:dio/dio.dart';
import 'package:propstake/localization/locales.dart';
import 'package:propstake/utils/constants.dart';
import 'package:propstake/utils/dartz.x.dart';
import 'package:propstake/utils/string_extensions.dart';
import 'package:propstake/widget/price_widget.dart';

import '../../../gen/assets.gen.dart';
import '../../../utils/app_logger.dart';
import '../../../utils/snack_message.dart';
import '../../base/base-vm.dart';
import 'about_tiers.ui.dart';
import 'all_tier.ui.dart';

class RewardHomeViewModel extends BaseViewModel {
  
  num currentInvestment = 0;
  String? referralCode;

  goToAllTiersScreen(){
    currentTier.currentValue = currentInvestment;
    navigationService.navigateToRoute(AllTiersScreen(currentIndex: appTiers.indexWhere((tier)=> tier.rank == currentTier.rank), currentTier: currentTier,));
  }

  getReferralCode()async {
    if(userService.referralCode == null){
      startLoader();
      try{
        var res = await authenticationService.getReferralCode();
        if(res.isRight()){
          referralCode = res.asRight().data;
          notifyListeners();
        }
      }on DioException catch(err){
        AppLogger.debug(err.message??"");
      } finally {
        stopLoader();
        notifyListeners();
      }
    }else{
      referralCode = userService.referralCode;
      notifyListeners();
    }
    notifyListeners();
  }

  copyText(String value) async {
    FlutterClipboard.copy(value).then(( val ) => showCustomToast(
      LocaleData.referralCodeCopped.convertString(),
      success: true
    ));
  }

  RewardHomeViewModel(){
    currentInvestment = getTotalBonusValue(bonuses);
    currentTier = appTiers.firstWhere((tier)=> tier.totalValue != null? (tier.minimumValue <= currentInvestment && (tier.totalValue??0) >= currentInvestment) : tier.minimumValue <= currentInvestment);
    init();
  }

  init()async{
    getReferralCode();
  }

  Tier currentTier = appTiers.first;

  double getTotalBonusValue(List<Bonus> bonuses) {
    return bonuses.fold(0, (sum, bonus) => sum + bonus.value);
  }

  List<Bonus> bonuses = [
    Bonus(name: LocaleData.cashback.convertString(), value: 0, currency: Currency.naira),
    Bonus(name: LocaleData.referrals.convertString(), value: 0, currency: Currency.naira),
    Bonus(name: LocaleData.promotions.convertString(), value: 0, currency: Currency.naira),
  ];
  
  List<Earn> howToEarn = [
    Earn(name: LocaleData.investingInNewProperties.convertString(), image: Assets.svg.propertiesActive),
    Earn(name: LocaleData.invitingFriends.convertString(), image: Assets.svg.userMultiple),
    Earn(name: LocaleData.participatingInPromotions.convertString(), image: Assets.svg.joinPromotion),
    Earn(name: LocaleData.settingUpAutoInvestPlans.convertString(), image: Assets.svg.autoStars),
  ];

  List<ToUpgrade> howToUpgrade = [
    ToUpgrade(name: LocaleData.investMore.convertString(), image: Assets.svg.money, subText: LocaleData.amountRequiredToUpgrade.convertString()),
    ToUpgrade(name: LocaleData.inviteFriend.convertString(), image: Assets.svg.userMultiple, subText: LocaleData.referralNumber.convertString()),
    ToUpgrade(name: LocaleData.joinPromotions.convertString(), image: Assets.svg.joinPromotion, subText: LocaleData.spreadTheWordAboutProstake.convertString()),
  ];

  goToAboutTiers(){
    currentTier.currentValue = currentInvestment;
    navigationService.navigateToRoute(AboutTier(currentTier: currentTier,));
  }

}

class Earn {
  String name;
  String image;

  Earn({
    required this.name,
    required this.image
  });
}

class ToUpgrade {
  String name;
  String subText;
  String image;

  ToUpgrade({
    required this.name,
    required this.subText,
    required this.image
  });
}

class Bonus {
  String name;
  num value;
  Currency currency;

  Bonus({
    required this.name,
    required this.value,
    required this.currency,
  });
}

List<Tier> appTiers = [
  Tier(
    rank: 1,
    name: LocaleData.bronzeTier.convertString(),
    image: Assets.svg.bronze,
    info: LocaleData.getStartedWithBasicBenefitsAsYouBegin.convertString(),
    benefit: [
      Benefit(
        topic: LocaleData.cashbackOnInvestments.convertString(),
        value: convertListString(LocaleData.cashbackOnInvestmentsInfo.convertString(), data: [0.5]),
        image: Assets.svg.invest
      ),
      Benefit(
        topic: LocaleData.basicSupport.convertString(),
        value: LocaleData.basicSupportInfo.convertString(),
        image: Assets.svg.fund
      ),

    ],
    totalValue: 4000,
    minimumValue: 0,
    nextLevel: LocaleData.silverTier.convertString()
  ),
  Tier(
    rank: 2,
    name: LocaleData.silverTier.convertString(),
    image: Assets.svg.silver,
    info: LocaleData.enjoyIncreasedCashBackAndBetter.convertString(),
    benefit: [
      Benefit(
        topic: LocaleData.cashbackOnInvestments.convertString(),
        value: convertListString(LocaleData.cashbackOnInvestmentsInfo.convertString(), data: [1.5]),
        image: Assets.svg.invest
      ),
      Benefit(
        topic: LocaleData.prioritySupport.convertString(),
        value: LocaleData.prioritySupportInfo.convertString(),
        image: Assets.svg.fund
      ),
      Benefit(
        topic: LocaleData.referralBonusBoost.convertString(),
        value: LocaleData.referralBonusBoostInfo.convertString(),
        image: Assets.svg.fund
      ),
    ],
    totalValue: 10000,
    minimumValue: 4001,
    nextLevel: LocaleData.goldTier.convertString()
  ),
  Tier(
    rank: 3,
    name: LocaleData.goldTier.convertString(),
    image: Assets.svg.gold,
    info: LocaleData.accessEarlyPropertyDealsPriority.convertString(),
    benefit: [
      Benefit(
        topic: LocaleData.higherCashbackReturns.convertString(),
        value: convertListString(LocaleData.cashbackOnInvestmentsInfo.convertString(), data: [2]),
        image: Assets.svg.invest
      ),
      Benefit(
        topic: LocaleData.premiumSupport.convertString(),
        value: LocaleData.premiumSupportInfo.convertString(),
        image: Assets.svg.fund
      ),
      Benefit(
        topic: LocaleData.earlyAccessToNewDeals.convertString(),
        value: LocaleData.earlyAccessToNewDealsInfo.convertString(),
        image: Assets.svg.fund
      ),
      Benefit(
        topic: LocaleData.earlyAccessToNewDeals.convertString(),
        value: LocaleData.earlyAccessToNewDealsInfo.convertString(),
        image: Assets.svg.fund
      ),
    ],
    totalValue: 50000,
    minimumValue: 10001,
    nextLevel: LocaleData.platinumTier.convertString()
  ),
  Tier(
    rank: 4,
    name: LocaleData.platinumTier.convertString(),
    image: Assets.svg.platnum,
    info: LocaleData.unlockTopTierBenefitsIncludingPersonalizedAdvice.convertString(),
    benefit: [
      Benefit(
        topic: LocaleData.higherCashbackReturns.convertString(),
        value: convertListString(LocaleData.cashbackOnInvestmentsInfo.convertString(), data: [2]),
        image: Assets.svg.invest
      ),
      Benefit(
        topic: LocaleData.premiumSupport.convertString(),
        value: LocaleData.premiumSupportInfo.convertString(),
        image: Assets.svg.fund
      ),
      Benefit(
        topic: LocaleData.earlyAccessToNewDeals.convertString(),
        value: LocaleData.earlyAccessToNewDealsInfo.convertString(),
        image: Assets.svg.fund
      ),
      Benefit(
        topic: LocaleData.earlyAccessToNewDeals.convertString(),
        value: LocaleData.earlyAccessToNewDealsInfo.convertString(),
        image: Assets.svg.fund
      ),
    ],
    minimumValue: 1000001
  ),

];

class Tier {
  String name;
  String image;
  String info;
  String? nextLevel;
  List<Benefit> benefit;
  num? totalValue;
  num minimumValue;
  num? currentValue;
  int rank;

  Tier({
    required this.name,
    required this.rank,
    required this.image,
    required this.info,
    required this.benefit,
    required this.minimumValue,
    this.nextLevel,
    this.totalValue,
    this.currentValue,
  });
}

class Benefit {
  String topic;
  String value;
  String image;

  Benefit({
    required this.topic,
    required this.value,
    required this.image,
  });
}