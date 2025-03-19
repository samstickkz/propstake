import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:propstake/app_theme/palette.dart';
import 'package:propstake/localization/locales.dart';
import 'package:propstake/utils/string_extensions.dart';
import 'package:propstake/utils/widget_extensions.dart';
import 'package:propstake/widget/app_card.dart';
import 'package:propstake/widget/price_widget.dart';
import 'package:propstake/widget/svg_builder.dart';

import '../../../gen/assets.gen.dart';
import '../../../widget/appbar_widget.dart';
import '../../../widget/apptexts.dart';
import '../../base/base-ui.dart';
import 'reward_home.vm.dart';

class RewardHomeScreen extends StatelessWidget {
  const RewardHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<RewardHomeViewModel>(
      builder: (model, theme)=> Scaffold(
        appBar: AppBars(
          noLeading: true,
          centerTitle: false,
          text: LocaleData.reward.convertString(),
          actions: [
            AppCard(
              heights: 36.sp,
              widths: 110.sp,
              bordered: true,
              backgroundColor: Colors.transparent,
              margin: 16.sp.padR,
              padding: 8.sp.padA,
              onTap: model.goToAboutTiers,
              child: Row(
                spacing: 3.sp,
                children: [
                  SvgBuilder(Assets.svg.questionCircle, size: 16.sp, color: black(isAppDark(context)),),
                  Expanded(child: AppText(LocaleData.aboutTiers.convertString(), size: 10.sp, color: black(isAppDark(context)),)),
                  SvgBuilder(Assets.svg.arrowRight, size: 16.sp, color: black(isAppDark(context)),),
                ],
              ),
            ),

          ],
        ),
        body: ListView(
          padding: EdgeInsets.only(left: 16.sp, right: 16.sp, top: 16.sp, bottom: 150.sp),
          children: [
            AppCard(
              onTap: model.goToAllTiersScreen,
              heights: 129.sp,
              child: Row(
                spacing: 16.sp,
                children: [
                  SvgBuilder(model.currentTier.image, size: 80.sp),
                  Expanded(child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText(
                            model.currentTier.name,
                            size: 16.47.sp,
                            weight: FontWeight.w700,
                            isTitle: true
                          ),
                          SvgBuilder(Assets.svg.arrowRight, color: stateColor12(isAppDark(context)),),
                        ]
                      ),
                      ProgressAppIndicator(
                        rank: model.currentTier.rank/4,
                      ),
                      Row(
                        spacing: 10.sp,
                        children: [
                          SvgBuilder(
                            Assets.svg.autoStars,
                            size: 20.sp,
                          ),
                          Expanded(child: AppText(
                            LocaleData.startInvestingToUpgradeYourTier.convertString(),
                            size: 11.sp,
                            color: stateColor12(isAppDark(context)),
                          ))
                        ],
                      )
                    ],
                  ))
                ],
              ),
            ),
            30.sp.sbH,
            AppText(
              LocaleData.myEarnings.convertString(),
              isTitle: true,
              size: 16.sp,
            ),
            16.sp.sbH,
            Row(
              spacing: 10.sp,
              children: List.generate(
                model.bonuses.length,
                (index){
                  return Expanded(
                    child: AppCard(
                      heights: 107.sp,
                      backgroundImage: Assets.png.backOne.path,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AppText(
                            model.bonuses[index].name,
                            color: Colors.white,
                            size: 9.66.sp,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  height: 20.sp,
                                  child: FittedBox(
                                    child: Row(
                                      children: [
                                        PriceWidget(
                                          value: model.bonuses[index].value,
                                          currency: model.bonuses[index].currency,
                                          color: Colors.white,
                                          size: 15.17.sp,
                                          weight: FontWeight.w700,
                                          useSymbol: false,
                                          roundUp: true,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),
                  );
                }
              ),
            ),
            30.sp.sbH,
            AppText(
              LocaleData.referAndEarn.convertString(),
              isTitle: true,
              size: 16.sp,
            ),
            16.sp.sbH,
            AppCard(
              backgroundColor: Theme.of(context).primaryColor.withValues(alpha: 0.2),
              padding: EdgeInsets.only(
                right: 16.sp,
                top: 16.sp,
                bottom: 16.sp,
              ),
              radius: 5.5.r,
              child: Row(
                spacing: 16.sp,
                children: [
                  ImageBuilder(Assets.png.rewardImage.path, size: 93.sp,),
                  Expanded(
                    child: Column(
                      spacing: 16.sp,
                      children: [
                        AppText(
                          LocaleData.shareUniqueCode.convertString(),
                          color: stateColor12(isAppDark(context)),
                          weight: FontWeight.w500,
                        ),
                        AppCard(
                          heights: 48.sp,
                          radius: 5.5.r,
                          color: primaryColor,
                          child: Row(
                            children: [
                              Expanded(child: AppText(model.referralCode??"", color: Colors.white,)),
                              InkWell(
                                onTap: ()=> model.copyText(model.referralCode??""),
                                child: Padding(
                                  padding: 8.sp.padH,
                                  child: SvgBuilder(Assets.svg.copy, color: Colors.white, size: 20.sp,),
                                ),
                              ),
                              Padding(
                                padding: 8.sp.padH,
                                child: SvgBuilder(Assets.svg.iosShare, color: Colors.white, size: 20.sp,),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            30.sp.sbH,
            AppText(
              LocaleData.howToEarnMore.convertString(),
              isTitle: true,
              size: 16.sp,
            ),
            16.sp.sbH,
            GridView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(0),
              shrinkWrap: true,
              itemCount: model.howToEarn.length,
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
                  borderColor: stateColor5(isAppDark(context)),
                  bordered: true,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgBuilder(model.howToEarn[i].image, color: primaryColor,),
                      Padding(
                        padding: 8.sp.padH,
                        child: AppText(model.howToEarn[i].name, align: TextAlign.center, color: stateColor12(isAppDark(context)), weight: FontWeight.w500, size: 14.sp,),
                      ),
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}


class ProgressAppIndicator extends StatelessWidget {
  final double? height;
  final num rank;
  const ProgressAppIndicator({super.key, this.height, required this.rank});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        double width = constraint.maxWidth;
        return SizedBox(
          height: height ?? 5.sp,
          width: width,
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              AppCard(
                widths: width,
                heights: height ?? 5.sp,
                color: stateColor6(isAppDark(context)),
              ),
              AppCard(
                widths: width * rank,
                heights: height ?? 5.sp,
                color: primaryColor,
              )
            ],
          ),
        );
      }
    );
  }
}
