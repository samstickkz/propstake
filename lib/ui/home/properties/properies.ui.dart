import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:propstake/app_theme/palette.dart';
import 'package:propstake/data/model/propert_response.dart';
import 'package:propstake/gen/assets.gen.dart';
import 'package:propstake/localization/locales.dart';
import 'package:propstake/ui/base/base-ui.dart';
import 'package:propstake/utils/constants.dart';
import 'package:propstake/utils/string_extensions.dart';
import 'package:propstake/utils/widget_extensions.dart';
import 'package:propstake/widget/app_button.dart';
import 'package:propstake/widget/app_card.dart';
import 'package:propstake/widget/apptexts.dart';
import 'package:propstake/widget/default_profile_pic.dart';
import 'package:propstake/widget/inidicator.dart';
import 'package:propstake/widget/price_widget.dart';
import 'package:propstake/widget/svg_builder.dart';
import 'package:propstake/widget/text_field.dart';

import '../../../widget/appbar_widget.dart';
import 'properies.vm.dart';

class PropertiesHomeScreen extends StatelessWidget {
  const PropertiesHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<PropertiesViewModel>(
      useFullScreenLoader: true,
      onModelReady: (m)=> m.init(),
      builder: (model, theme)=> Scaffold(
        appBar: AppBars(
          noLeading: true,
          title: Row(
            children: [
              ProfilePic(user: userService.user, size: 40.sp),
              16.sp.sbW,
              AppText(
                convertListString(LocaleData.hi.convertString(), data: [userService.user.fname??""]),
                size: 16.sp,
                weight: FontWeight.w500,
                color: stateColor12(isAppDark(context)),
              )
            ],
          ),
          actions: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppCard(
                  onTap: model.goToBookMark,
                  heights: 35.sp,
                  widths: 35.sp,
                  padding: 5.5.sp.padA,
                  radius: 40.r,
                  child: SvgBuilder(Assets.svg.loveOutline, color: black(theme.isDark),),
                ),
                16.sp.sbW,
                AppCard(
                  onTap: model.goToCart,
                  heights: 35.sp,
                  widths: 35.sp,
                  padding: 5.5.sp.padA,
                  radius: 40.r,
                  child: SvgBuilder(Assets.svg.cart, color: black(theme.isDark),),
                ),
                16.sp.sbW,
                AppCard(
                  onTap: (){},
                  heights: 35.sp,
                  widths: 35.sp,
                  padding: 5.5.sp.padA,
                  radius: 40.r,
                  child: SvgBuilder(Assets.svg.notificationBell, color: black(theme.isDark),),
                ),
                16.sp.sbW,
              ],
            )
          ],
        ),
        body: NestedScrollView(
          controller: model.scrollController,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 353.sp,
                automaticallyImplyLeading: false,
                floating: false,
                foregroundColor: Colors.white,
                backgroundColor: Colors.transparent,
                scrolledUnderElevation: 0,
                elevation: 0,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  titlePadding: const EdgeInsets.all(0),
                  expandedTitleScale: 1.1,
                  centerTitle: true,
                  background: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: height(context),
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: 16.sp.padH,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  16.sp.sbH,
                                  AppText(
                                    LocaleData.properties.convertString(),
                                    isTitle: true,
                                    size: 18.sp,
                                  ),
                                  16.sp.sbH,
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10.r),
                                    child: AppTextField(
                                      useBorder: false,
                                      fillColor: isAppDark(context)? Colors.black: Color(0xFFF6F6F6),
                                      contentPadding: 12.sp.padA,
                                      prefixIcon: Padding(
                                        padding: 12.sp.padL,
                                        child: SvgBuilder(
                                            Assets.svg.search
                                        ),
                                      ),
                                      suffixIcon: Padding(
                                        padding: 12.sp.padR,
                                        child: SvgBuilder(
                                            Assets.svg.filter
                                        ),
                                      ),
                                      hint: LocaleData.searchForProperties.convertString(),
                                    ),
                                  ),
                                  20.sp.sbH,
                                  AppText(
                                    LocaleData.update.convertString(),
                                    isTitle: true,
                                    size: 18.sp,
                                    weight: FontWeight.w500,
                                  ),
                                  20.sp.sbH,
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 103.sp,
                              width: width(context),
                              child: ListView.builder(
                                padding: 16.sp.padL,
                                itemCount: model.properties.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (_, i){
                                  PropertyResponse property = model.properties[i];
                                  return AppCard(
                                    backgroundImage: property.images.isEmpty? Assets.png.houseFrame.path: property.images[0],
                                    widths: 286.sp,
                                    margin: 16.sp.padR,
                                    padding: 0.0.padA,
                                    child: Container(
                                      height: height(context),
                                      width: width(context),
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(colors: [Colors.transparent, Colors.black87])
                                      ),
                                      child: Row(
                                        children: [
                                          Expanded(
                                              flex: 3,
                                              child: 0.sp.sbH
                                          ),
                                          Expanded(
                                              flex: 2,
                                              child: Padding(
                                                padding: 8.sp.padV,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    AppText(
                                                      property.name??"",
                                                      color: Colors.white,
                                                      size: 13.61.sp,
                                                      maxLine: 2,
                                                      weight: FontWeight.w700,
                                                      height: 1.1,
                                                    ),
                                                    AppText(
                                                      property.location??"",
                                                      maxLine: 2,
                                                      color: Colors.white,
                                                      size: 8.67.sp,
                                                      weight: FontWeight.w500,
                                                      height: 1.1,
                                                    ),
                                                    Spacer(),
                                                    PriceWidget(
                                                      currency: Currency.naira,
                                                      value: 2095,
                                                      weight: FontWeight.w900,
                                                      roundUp: true,
                                                      color: Colors.white,
                                                      height: 1.1,
                                                    ),
                                                    AppText(
                                                      convertListString(LocaleData.percentageFunded.convertString(), data: [(((property.amountFunded??0)/(property.totalCost??0))*100).toInt()]),
                                                      color: Colors.white,
                                                      size: 8.67.sp,
                                                      weight: FontWeight.w500,
                                                    ),

                                                  ],
                                                ),
                                              )
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }
                              ),
                            ),
                            20.sp.sbH,
                            Padding(
                              padding: 16.sp.padH,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: AppButton.fullWidth(
                                      isLoading: false,
                                      backgroundColor: const Color(0xFFD9D9D9),
                                      textColor: stateColor12(false),
                                      height: 37.sp,
                                      text: LocaleData.latestListing.convertString(),
                                      onTap: (){},
                                    ),
                                  ),
                                  16.sp.sbW,
                                  Expanded(
                                    child: AppButton.fullWidth(
                                      isLoading: false,
                                      height: 37.sp,
                                      text: LocaleData.fullyFunded.convertString(),
                                      onTap: (){},
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ];
          },
          body: ListView.builder(
            padding: EdgeInsets.only(left: 16.sp, right: 16.sp, top: 16.sp, bottom: 120.sp),
            itemCount: model.properties.length,
            itemBuilder: (_, i){
              PropertyResponse property = model.properties[i];
              return AppCard(
                onTap: ()=> model.goToPropertyDetail(property),
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
          ),
        ),
      ),
    );
  }
}
