import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:propstake/localization/locales.dart';
import 'package:propstake/ui/base/base-ui.dart';
import 'package:propstake/utils/string_extensions.dart';
import 'package:propstake/utils/widget_extensions.dart';
import 'package:propstake/widget/appbar_widget.dart';

import '../../../../app_theme/palette.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../widget/app_card.dart';
import '../../../../widget/apptexts.dart';
import '../../../../widget/price_widget.dart';
import '../../../../widget/svg_builder.dart';
import '../my_investment.vm.dart';

class TransactionHomeScreen extends StatelessWidget {
  const TransactionHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<MyInvestHomeViewModel>(
      onModelReady: (m)=>m.init(),
      useFullScreenLoader: true,
      builder: (model, theme)=> Scaffold(
        appBar: AppBars(
          text: LocaleData.transactionHistory.convertString(),
        ),
        body: ListView(
          padding: 16.sp.padA,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppText(
                  LocaleData.recent.convertString(),
                  weight: FontWeight.w700,
                  size: 16.sp,
                  isTitle: true,
                ),
              ],
            ),
            16.sp.sbH,
            AppCard(
              padding: 0.sp.padA,
              child: Column(
                children: List.generate(
                    model.transactionsData.length,
                        (index){
                      return Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.sp,
                            vertical: 16.sp
                        ),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: index == (model.transactionsData.length-1)? BorderSide.none : BorderSide(color: stateColor4(isAppDark(context)))
                            )
                        ),
                        child: Row(
                          spacing: 16.sp,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgBuilder(Assets.svg.invest, size: 32.sp,),
                            Expanded(child: Column(
                              spacing: 4.sp,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(
                                  model.transactionsData[index].description??"",
                                  weight: FontWeight.w500,
                                  size: 14.sp,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    PriceWidget(
                                      value: model.transactionsData[index].rewardAmount,
                                      size: 12.sp,
                                      currency: Currency.dollar,
                                      roundUp: true,
                                      useSymbol: false,
                                    ),
                                    AppText(
                                      model.getTextFromDateTime(DateTime.parse(model.transactionsData[index].createdAt?? DateTime.now().toString())),
                                      size: 10.sp,
                                    )
                                  ],
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
          ],
        ),
      ),
    );
  }
}
