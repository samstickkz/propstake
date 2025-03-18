import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:propstake/localization/locales.dart';
import 'package:propstake/ui/home/reward/reward_home.vm.dart';
import 'package:propstake/utils/string_extensions.dart';
import 'package:propstake/utils/widget_extensions.dart';
import 'package:propstake/widget/app_card.dart';
import 'package:propstake/widget/appbar_widget.dart';
import 'package:propstake/widget/apptexts.dart';

import '../../../app_theme/palette.dart';
import '../../../gen/assets.gen.dart';
import '../../../utils/constants.dart';
import '../../../widget/svg_builder.dart';
import 'all_tier.ui.dart';

class AboutTier extends StatelessWidget {
  final Tier currentTier;
  const AboutTier({super.key, required this.currentTier});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars(
        text: LocaleData.aboutTiers.convertString(),
      ),
      body: ListView(
        padding: 16.sp.padA,
        children: [
          AppText(
            LocaleData.yourJourneyToEliteReward.convertString(),
            isTitle: true,
            size: 20.sp,
            weight: FontWeight.w500,
          ),
          16.sp.sbH,
          AppText(LocaleData.discoverHowYourTierSystem.convertString()),
          30.sp.sbH,
          AppCard(
            padding: 0.sp.padA,
            bordered: true,
            borderColor: stateColor3(isAppDark(context)),
            backgroundColor: stateColor2(isAppDark(context)),
            child: Column(
              children: List.generate(
                appTiers.length,
                (index){
                  Tier tier = appTiers[index];
                  return InkWell(
                    onTap: ()=> goToAllTiersScreen(index),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.sp,
                          vertical: 16.sp
                      ),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: index == (appTiers.length-1)? BorderSide.none : BorderSide(color: stateColor3(isAppDark(context)))
                          )
                      ),
                      child: Row(
                        spacing: 16.sp,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppCard(
                            padding: 3.sp.padA,
                            widths: 30.sp,
                            radius: 2.r,
                            color: fadeBackground(isAppDark(context)),
                            child: SvgBuilder(
                              tier.image,
                              size: 24.sp,
                            ),
                          ),
                          Expanded(child: Column(
                            spacing: 4.sp,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                tier.name,
                                weight: FontWeight.w500,
                                size: 14.sp,
                                color: stateColor12(isAppDark(context)),
                              ),
                              AppText(
                                tier.info,
                                size: 12.sp,
                              )
                            ],
                          )),
                          SvgBuilder(
                            Assets.svg.arrowRight,
                            size: 24.sp,
                            color: black(isAppDark(context)),
                          )
                        ],
                      ),
                    ),
                  );
                }
              ),
            ),
          )
        ],
      ),
    );
  }

  goToAllTiersScreen(int index){
    navigationService.navigateToRoute(AllTiersScreen(currentIndex: index, currentTier: currentTier,));
  }
}
