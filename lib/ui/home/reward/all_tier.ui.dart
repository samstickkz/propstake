import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:propstake/localization/locales.dart';
import 'package:propstake/ui/base/base-ui.dart';
import 'package:propstake/ui/home/reward/reward_home.ui.dart';
import 'package:propstake/utils/string_extensions.dart';
import 'package:propstake/utils/widget_extensions.dart';
import 'package:propstake/widget/appbar_widget.dart';
import 'package:propstake/widget/apptexts.dart';
import 'package:propstake/widget/price_widget.dart';
import 'package:propstake/widget/svg_builder.dart';

import '../../../app_theme/palette.dart';
import '../../../widget/app_card.dart';
import 'reward_home.vm.dart';

class AllTiersScreen extends StatelessWidget {
  final int currentIndex;
  final Tier? currentTier;
  const AllTiersScreen({super.key, required this.currentIndex, this.currentTier});

  @override
  Widget build(BuildContext context) {
    return BaseView<RewardHomeViewModel>(
      builder: (model, theme)=> PageView.builder(
        controller: PageController(initialPage: currentIndex),
        itemCount: appTiers.length,
        itemBuilder: (_, _i){
          Tier tier = appTiers[_i];
          return Scaffold(
            appBar: AppBars(
              text: tier.name,
            ),
            body: ListView(
              padding: 16.sp.padA,
              children: [
                SvgBuilder(tier.image, size: 93.sp,),
                30.sp.sbH,
                AppCard(
                  radius: 5.r,
                  heights: 134.sp,
                  borderColor: stateColor5(isAppDark(context)),
                  bordered: true,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            AppText(
                              currentTier == null? LocaleData.amountToBeInvestedIn12Months.convertString(): LocaleData.amountInvested.convertString(),
                              size: 12.sp,
                              weight: FontWeight.w700,
                            ),
                            ProgressAppIndicator(rank: currentTier == null? 0: _i == (appTiers.length - 1)? 1: ((currentTier?.currentValue??0 )/ (appTiers[_i+ 1].minimumValue))),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "${(_i == (appTiers.length - 1)) || (currentTier?.rank??0) > tier.rank? LocaleData.investedAbove.convertString(): LocaleData.invest.convertString()} ",
                                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500
                                    ),
                                  ),
                                  if((_i == (appTiers.length - 1)) || (currentTier?.rank??0) > tier.rank)...[
                                    TextSpan(
                                      text: "${getCurrencySymbol(Currency.dollar)}${_i == (appTiers.length - 1)? tier.minimumValue: tier.totalValue} ",
                                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500
                                      ),
                                    ),
                                  ],
                                  if(!((_i == (appTiers.length - 1)) || (currentTier?.rank??0) > tier.rank))...[
                                    TextSpan(
                                      text: "${getCurrencySymbol(Currency.dollar)}${currentTier == null? appTiers[_i+ 1].minimumValue: appTiers[_i+ 1].minimumValue- (currentTier?.currentValue??0)} ",
                                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500
                                      ),
                                    ),
                                    TextSpan(
                                      text: "${LocaleData.toReach.convertString()} ",
                                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500
                                      ),
                                    ),
                                    TextSpan(
                                      text: appTiers[_i+ 1].name,
                                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w700,
                                        color: primaryColor
                                      ),
                                    ),
                                  ],

                                ],
                              ),
                              textAlign: TextAlign.start,
                            )
                          ],
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          PriceWidget(
                            value: currentTier?.currentValue??0,
                            currency: Currency.dollar,
                            weight: FontWeight.w700,
                            size: 20.sp,
                            color: black(isAppDark(context)),
                            roundUp: true,
                          ),
                          AppText("/ ${_i == (appTiers.length - 1)? "~" : appTiers[_i].totalValue}")
                        ],
                      )
                    ],
                  ),
                ),
                30.sp.sbH,
                AppText(
                  LocaleData.benefits.convertString(),
                  isTitle: true,
                  size: 16.sp,
                ),
                16.sp.sbH,
                AppCard(
                  padding: 0.sp.padA,
                  child: Column(
                    children: List.generate(
                        tier.benefit.length,
                            (index){
                          return Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.sp,
                                vertical: 16.sp
                            ),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: index == (tier.benefit.length-1)? BorderSide.none : BorderSide(color: stateColor4(isAppDark(context)))
                                )
                            ),
                            child: Row(
                              spacing: 16.sp,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgBuilder(tier.benefit[index].image, size: 32.sp,),
                                Expanded(child: Column(
                                  spacing: 4.sp,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppText(
                                      tier.benefit[index].topic,
                                      weight: FontWeight.w500,
                                      size: 14.sp,
                                    ),
                                    AppText(
                                      tier.benefit[index].value,
                                      size: 12.sp,
                                    )
                                  ],
                                ))

                              ],
                            ),
                          );
                        }
                    ),
                  ),
                ),
                if(!(_i == (appTiers.length - 1)))...[
                  30.sp.sbH,
                  AppText(
                    LocaleData.howToUpgrade.convertString(),
                    isTitle: true,
                    size: 16.sp,
                  ),
                  16.sp.sbH,
                  GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.all(0),
                    shrinkWrap: true,
                    itemCount: model.howToUpgrade.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing:5.sp,
                      mainAxisSpacing: 5.sp,
                      childAspectRatio: 1.5,
                      // mainAxisExtent: MediaQuery.of(context).size.width/ 2,
                      mainAxisExtent: 104.h,
                    ),
                    itemBuilder: (_, i){
                      return AppCard(
                        radius: 5.r,
                        padding: 10.sp.padA,
                        borderColor: stateColor5(isAppDark(context)),
                        bordered: true,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgBuilder(model.howToUpgrade[i].image, color: primaryColor,),
                            Padding(
                              padding: 8.sp.padH,
                              child: AppText(model.howToUpgrade[i].name, align: TextAlign.center, color: stateColor12(isAppDark(context)), weight: FontWeight.w500, size: 14.sp,),
                            ),
                            Padding(
                              padding: 8.sp.padH,
                              child: AppText(
                                convertListString(model.howToUpgrade[i].subText, data: i==0? [tier.totalValue, appTiers[_i+ 1].name] : i ==1? ["${tier.rank == 1? 5 : 10}"]: []),
                                align: TextAlign.center,
                                size: 10.sp,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  )
                ],
                30.sp.sbH
              ],
            ),
          );
        }
      )
    );
  }
}
