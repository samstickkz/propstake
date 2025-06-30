import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:propstake/app_theme/palette.dart';
import 'package:propstake/localization/locales.dart';
import 'package:propstake/utils/constants.dart';
import 'package:propstake/utils/string_extensions.dart';
import 'package:propstake/utils/widget_extensions.dart';
import 'package:propstake/widget/app_card.dart';
import 'package:propstake/widget/appbar_widget.dart';
import 'package:propstake/widget/apptexts.dart';
import 'package:propstake/widget/price_widget.dart';
import 'package:propstake/widget/svg_builder.dart';

import '../../../gen/assets.gen.dart';
import '../../base/base-ui.dart';
import '../profile/profile_home.vm.dart';
import 'my_investment.vm.dart';

class MyInvestHomeScreen extends StatelessWidget {
  const MyInvestHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<MyInvestHomeViewModel>(
      useFullScreenLoader: true,
      onModelReady: (m)=> m.init(),
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
                    InkWell(
                      borderRadius: BorderRadius.circular(65.sp/2),
                      onTap: model.popInvest,
                      child: Container(
                        height: 65.sp,
                        width: 65.sp,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF0C5C73),
                        ),
                        child: SvgBuilder(Assets.svg.investUpDown),
                      ),
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
                    InkWell(
                      borderRadius: BorderRadius.circular(65.sp/2),
                      // onTap: model.goToDeposit,
                      child: Container(
                        height: 65.sp,
                        width: 65.sp,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF0C5C73),
                        ),
                        child: SvgBuilder(Assets.svg.addIcon),
                      ),
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
                    InkWell(
                      borderRadius: BorderRadius.circular(65.sp/2),
                      onTap: model.goToWithdraw,
                      child: Container(
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
                        onTap: model.goToTransactions,
                        LocaleData.seeAll.convertString(),
                        weight: FontWeight.w600,
                        color: primaryColor,
                        size: 12.sp,
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
                                      model.properties.firstWhere((t)=> t.id == model.transactionsData[index].product?.id).name??"",
                                      weight: FontWeight.w500,
                                      size: 14.sp,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        PriceWidget(
                                          value: model.transactionsData[index].amountSelected??"",
                                          size: 12.sp,
                                          roundUp: true,
                                          useSymbol: false,
                                        ),
                                        AppText(
                                          model.getTextFromDateTime(model.transactionsData[index].addedAt?? DateTime.now()),
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
                  30.sp.sbH,
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  //   children: [
                  //     AppText(
                  //       LocaleData.frequentlyAskedQuestion.convertString(),
                  //       weight: FontWeight.w700,
                  //       size: 16.sp,
                  //       isTitle: true,
                  //     ),
                  //   ],
                  // ),
                  // 16.sp.sbH,
                  // SizedBox(
                  //   height: 92.sp,
                  //   width: width(context),
                  //   child: ListView.builder(
                  //     // itemExtentBuilder: (index, value){
                  //     //   print(index);
                  //     // },
                  //       scrollDirection: Axis.horizontal,
                  //       itemCount: locator<ProfileHomeViewModel>().faqs.length,
                  //       itemBuilder: (_, i){
                  //         return AppCard(
                  //           onTap: ()=> model.goFaqDetail(locator<ProfileHomeViewModel>().faqs[i]),
                  //           heights: height(context),
                  //           widths: 139.sp,
                  //           margin: 16.sp.padR,
                  //           backgroundImage: i%2 == 0? Assets.png.backOne.path : Assets.png.backTwo.path,
                  //           child: Column(
                  //             mainAxisAlignment: MainAxisAlignment.center,
                  //             crossAxisAlignment: CrossAxisAlignment.center,
                  //             children: [
                  //               Row(
                  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //                 children: [
                  //                   SvgBuilder(Assets.svg.money, size: 16.sp,),
                  //                   SvgBuilder(Assets.svg.arrowRightWhite, size: 16.sp,),
                  //                 ],
                  //               ),
                  //               Expanded(
                  //                 child: Align(
                  //                   alignment: Alignment.centerLeft,
                  //                   child: AppText(
                  //                     locator<ProfileHomeViewModel>().faqs[i].title,
                  //                     weight: FontWeight.w500,
                  //                     size: 10.sp,
                  //                     color: Colors.white,
                  //                   ),
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //         );
                  //       }
                  //   ),
                  // ),
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

class InvestOption extends StatelessWidget {
  final VoidCallback autoInvest;
  final VoidCallback explore;
  const InvestOption({super.key, required this.autoInvest, required this.explore});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OptionsView(
          title: LocaleData.exploreProperties.convertString(),
          body: LocaleData.browseThroughAVarietyOfProperties.convertString(),
          image: Assets.svg.exploreProperties,
          onTap: explore,
        ),
        OptionsView(
          title: LocaleData.autoInvest.convertString(),
          body: LocaleData.chooseAPlanAndLetsHandleTheRest.convertString(),
          image: Assets.svg.autoInvest,
          onTap: autoInvest,
        ),
        30.sp.sbH
      ],
    );
  }
}


class OptionsView extends StatelessWidget {
  final String title;
  final String body;
  final String image;
  final VoidCallback onTap;
  const OptionsView({super.key, required this.title, required this.body, required this.image, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        navigationService.goBack();
        onTap();
      },
      child: Container(
        padding: 16.sp.padV,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: stateColor4(isAppDark(context)),
              width: 1.sp
            )
          )
        ),
        child: Row(
          spacing: 16.sp,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgBuilder(image),
            Expanded(child: Column(
              spacing: 4.sp,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  title,
                  weight: FontWeight.w500,
                  size: 14.sp,
                ),
                AppText(
                  body,
                  size: 10.sp,
                )
              ],
            )),
            SvgBuilder(Assets.svg.arrowRight, color: stateColor12(isAppDark(context)),),
          ],
        ),
      ),
    );
  }
}
