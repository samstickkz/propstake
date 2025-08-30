import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:propstake/data/model/propert_response.dart';
import 'package:propstake/utils/constants.dart';
import 'package:propstake/widget/appbar_widget.dart';

import '../../../../app_theme/palette.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../localization/locales.dart';
import '../../../../utils/string_extensions.dart';
import '../../../../utils/widget_extensions.dart';
import '../../../../widget/app_card.dart';
import '../../../../widget/apptexts.dart';
import '../../../../widget/price_widget.dart';
import '../../../../widget/svg_builder.dart';
import '../../../base/base-ui.dart';
import '../product_detail/product_detail.vm.dart';

class BookMarkScreen extends StatelessWidget {
  const BookMarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<ProductDetailViewModel>(
      builder: (model, theme)=> Scaffold(
        appBar: AppBars(
          text: LocaleData.favouriteProperties.convertString(),
        ),
        body: ListView(
          padding: 16.sp.padA,
          children: [
            AppText(LocaleData.yourSavedPropertiesAtAGlance.convertString()),
            16.sp.sbH,
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.only(bottom: 120.sp),
              itemCount: userService.bookMarks.length,
              itemBuilder: (_, i){
                PropertyResponse property = userService.bookMarks[i];
                return AppCard(
                  onTap: ()=> model.goToPropertyDetail(i),
                  bordered: true,
                  margin: 20.sp.padB,
                  padding: 0.0.padA,
                  color: Colors.transparent,
                  borderColor: Theme.of(context).disabledColor.withValues(alpha: 0.3),
                  child: Column(
                    children: [
                      Container(
                        padding: 16.sp.padA,
                        height: 168.h,
                        width: width(context),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: CachedNetworkImageProvider(property.images.isEmpty? "": property.images[0]),
                                fit: BoxFit.fill
                            )
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: ()=> model.saveUnsavedProperties(property),
                              child: SvgBuilder(
                                Assets.svg.love,
                                size: 25.sp,
                                color: userService.bookMarks.any((test)=> test.id == property.id)? red9(isAppDark(context)): null,
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: 14.sp.padA,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: 20.sp.padR,
                                  child: Row(
                                    children: [
                                      SvgBuilder(
                                        Assets.svg.bed,
                                        size: 16.sp,
                                      ),
                                      5.sp.sbW,
                                      AppText(
                                        convertListString(LocaleData.bedsNumber.convertString(), data: [property.bedAmount??0]),
                                        size: 13.sp,
                                        weight: FontWeight.w500,
                                        color: stateColor12(isAppDark(context)),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: 20.sp.padR,
                                  child: Row(
                                    children: [
                                      SvgBuilder(
                                        Assets.svg.document,
                                        size: 16.sp,
                                      ),
                                      5.sp.sbW,
                                      AppText(
                                        property.forRent == true? LocaleData.rented.convertString(): LocaleData.sale.convertString(),
                                        size: 13.sp,
                                        weight: FontWeight.w500,
                                        color: stateColor12(isAppDark(context)),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: 20.sp.padR,
                                  child: Row(
                                    children: [
                                      SvgBuilder(
                                        Assets.svg.location,
                                        size: 16.sp,
                                      ),
                                      5.sp.sbW,
                                      AppText(
                                        property.country??"",
                                        size: 13.sp,
                                        weight: FontWeight.w500,
                                        color: stateColor12(isAppDark(context)),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Divider(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                AppText(
                                  property.name??"",
                                  size: 15.6.sp,
                                  weight: FontWeight.w700,
                                  color: stateColor12(theme.isDark),
                                ),
                                AppText(
                                  property.location??"",
                                  size: 10.99.sp,
                                  weight: FontWeight.w500,
                                  color: stateColor11(theme.isDark),
                                ),
                                10.sp.sbH,
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    PriceWidget(
                                      value: property.amountFunded,
                                      color: primaryColor,
                                      size: 16.49.sp,
                                      weight: FontWeight.w900,
                                      roundUp: true,
                                    ),
                                    AppText(
                                      convertListString(LocaleData.percentageFunded.convertString(), data: [(((property.amountFunded??0)/(property.totalCost??0))*100).toInt()]),
                                      size: 10.99.sp,
                                      weight: FontWeight.w500,
                                      color: stateColor11(theme.isDark),
                                    ),
                                  ],
                                ),
                                5.sp.sbH,
                                AppCard(
                                  heights: 5.sp,
                                  padding: 0.sp.padA,
                                  color: Color(0xFFD9D9D9),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: LayoutBuilder(
                                            builder: (context, constraint) {
                                              double width =  ((property.amountFunded??0)/(property.totalCost??0)) * constraint.maxWidth;
                                              return Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  AppCard(
                                                    expandable: true,
                                                    heights: 5.sp,
                                                    widths: width,
                                                    color: primaryColor,
                                                  ),
                                                ],
                                              );
                                            }
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(),
                                AppCard(
                                  bordered: true,
                                  borderColor: Theme.of(context).disabledColor.withValues(alpha: 0.4),
                                  padding: 8.sp.padA,
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          AppText(
                                            LocaleData.fiveYearTotalReturn.convertString(),
                                            size: 10.99.sp,
                                            weight: FontWeight.w500,
                                            color: stateColor11(theme.isDark),
                                          ),
                                          AppText(
                                            "${(property.returnPercentageFiveYears??0).toStringAsFixed(0)}%",
                                            size: 10.99.sp,
                                            weight: FontWeight.w500,
                                            color: stateColor11(theme.isDark),
                                          ),

                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          AppText(
                                            LocaleData.yearlyReturns.convertString(),
                                            size: 10.99.sp,
                                            weight: FontWeight.w500,
                                            color: stateColor11(theme.isDark),
                                          ),
                                          AppText(
                                            "${(property.returnPercentagePerYear??0).toStringAsFixed(0)}%",
                                            size: 10.99.sp,
                                            weight: FontWeight.w500,
                                            color: stateColor11(theme.isDark),
                                          ),

                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
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
