import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:propstake/app_theme/palette.dart';
import 'package:propstake/localization/locales.dart';
import 'package:propstake/utils/string_extensions.dart';
import 'package:propstake/utils/widget_extensions.dart';
import 'package:propstake/widget/app_card.dart';
import 'package:propstake/widget/appbar_widget.dart';
import 'package:propstake/widget/apptexts.dart';
import 'package:propstake/widget/price_widget.dart';
import 'package:propstake/widget/svg_builder.dart';

import '../../../gen/assets.gen.dart';
import '../../base/base-ui.dart';
import 'my_investment.vm.dart';

class MyInvestHomeScreen extends StatelessWidget {
  const MyInvestHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<MyInvestHomeViewModel>(
      builder: (model, theme)=> Scaffold(
        appBar: AppBars(
          noLeading: true,
          text: LocaleData.myPortfolio.convertString(),
          centerTitle: false,
        ),
        body: ListView(
          children: [
            SizedBox(
              height: 158.sp,
              width: width(context),
              child: ListView.builder(
                // itemExtentBuilder: (index, value){
                //   print(index);
                // },
                scrollDirection: Axis.horizontal,
                padding: 16.sp.padL,
                itemCount: model.myBalance.length,
                itemBuilder: (_, i){
                  return AppCard(
                    heights: height(context),
                    widths: width(context)*0.8,
                    margin: 16.sp.padR,
                    backgroundImage: i%2 == 0? Assets.png.backOne.path : Assets.png.backTwo.path,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AppText(
                          model.myBalance[i]["title"],
                          weight: FontWeight.w500,
                          size: 14.32.sp,
                          color: Colors.white,
                        ),
                        PriceWidget(
                          value: model.myBalance[i]["value"],
                          currency: model.myBalance[i]["currency"],
                          isTitle: true,
                          color: Colors.white,
                          useSymbol: false,
                          roundUp: true,
                        )
                      ],
                    ),
                  );
                }
              ),
            ),
            20.sp.sbH,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      height: 65.sp,
                      width: 65.sp,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF0C5C73),
                      ),
                      child: SvgBuilder(Assets.svg.investUpDown),
                    ),
                    10.sp.sbH,
                    AppText(
                      LocaleData.invest.convertString(),
                      size: 16.sp,
                      color: black(theme.isDark),
                      weight: FontWeight.w500,
                    )
                  ],
                ),
                30.sp.sbW,
                Column(
                  children: [
                    Container(
                      height: 65.sp,
                      width: 65.sp,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF0C5C73),
                      ),
                      child: SvgBuilder(Assets.svg.addIcon),
                    ),
                    10.sp.sbH,
                    AppText(
                      LocaleData.deposit.convertString(),
                      size: 16.sp,
                      color: black(theme.isDark),
                      weight: FontWeight.w500,
                    )
                  ],
                ),
                30.sp.sbW,
                Column(
                  children: [
                    Container(
                      height: 65.sp,
                      width: 65.sp,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFD9D9D9),
                        border: Border.all(
                          color: Color(0xFF0C5C73)
                        ),
                      ),
                      child: SvgBuilder(Assets.svg.outIcon),
                    ),
                    10.sp.sbH,
                    AppText(
                      LocaleData.withdraw.convertString(),
                      size: 16.sp,
                      color: black(theme.isDark),
                      weight: FontWeight.w500,
                    )
                  ],
                ),

              ],
            ),
            20.sp.sbH,
            Padding(
              padding: 16.sp.padH,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AppText(
                        LocaleData.transactionHistory.convertString(),
                        weight: FontWeight.w700,
                        size: 16.sp,
                        isTitle: true,
                      ),
                      AppText(
                        onTap: (){},
                        LocaleData.seeAll.convertString(),
                        weight: FontWeight.w600,
                        color: primaryColor,
                        size: 12.sp,
                      ),

                    ],
                  ),
                  16.sp.sbH,
                  AppCard(
                    heights: 100.sp,
                  )
                ],
              ),
            ),
            100.sp.sbH,
          ],
        ),
      ),
    );
  }
}
