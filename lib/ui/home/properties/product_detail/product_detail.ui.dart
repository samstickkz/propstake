import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:propstake/utils/constants.dart';
import 'package:propstake/widget/app_button.dart';
import 'package:propstake/widget/appbar_widget.dart';
import 'package:propstake/widget/inidicator.dart';
import 'package:propstake/widget/text_field.dart';

import '../../../../app_theme/palette.dart';
import '../../../../data/model/propert_response.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../localization/locales.dart';
import '../../../../utils/string_extensions.dart';
import '../../../../utils/widget_extensions.dart';
import '../../../../widget/app_card.dart';
import '../../../../widget/apptexts.dart';
import '../../../../widget/price_widget.dart';
import '../../../../widget/svg_builder.dart';
import '../../../base/base-ui.dart';
import 'product_detail.vm.dart';

class ProductDetailScreen extends StatelessWidget {
  final PropertyResponse property;
  const ProductDetailScreen({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return BaseView<ProductDetailViewModel>(
      builder: (model, theme)=> Stack(
        children: [
          Scaffold(
            body: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 381.sp,
                          width: width(context),
                          child: Stack(
                            children: [
                              SizedBox(
                                height: 381.sp,
                                width: width(context),
                                child: PageView.builder(
                                  onPageChanged: model.onChangeIndex,
                                  itemCount: property.images.length,
                                  itemBuilder: (_, _i){
                                    return Container(
                                      height: height(context),
                                      width: width(context),
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: CachedNetworkImageProvider(property.images.isEmpty? "" : property.images[_i]),
                                          fit: BoxFit.cover
                                        )
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding:16.sp.padA,
                                  child: DotIndicators(
                                    total: property.images.length??0,
                                    current: model.currentIndex,
                                    inactiveColor: const Color(0xFFD9D9D9),
                                    size: 11.sp,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: 16.sp.padH,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              30.sp.sbH,
                              AppText(
                                property.name??"",
                                size: 20.06.sp,
                                weight: FontWeight.w700,
                                color: stateColor12(theme.isDark),
                              ),
                              AppText(
                                property.location??"",
                                size: 14.44.sp,
                                weight: FontWeight.w500,
                                color: stateColor11(theme.isDark),
                              ),
                              Divider(
                                height: 30.sp,
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: 20.sp.padR,
                                    child: Row(
                                      children: [
                                        SvgBuilder(
                                          Assets.svg.bed,
                                          size: 13.7.sp,
                                        ),
                                        5.sp.sbW,
                                        AppText(
                                          convertListString(LocaleData.bedsNumber.convertString(), data: [property.bedAmount??0]),
                                          size: 10.sp,
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
                                          size: 13.7.sp,
                                        ),
                                        5.sp.sbW,
                                        AppText(
                                          property.forRent == true? LocaleData.rented.convertString(): LocaleData.sale.convertString(),
                                          size: 10.sp,
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
                                          size: 13.7.sp,
                                        ),
                                        5.sp.sbW,
                                        AppText(
                                          property.country??"",
                                          size: 10.sp,
                                          color: stateColor12(isAppDark(context)),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                height: 30.sp,
                              ),
                              AppCard(
                                backgroundColor: fadeBackground(theme.isDark),
                                radius: 0.sp,
                                child: Row(
                                  children: [
                                    Assets.png.threeDRotation.image(
                                      height: 18.sp,
                                      width: 18.sp,
                                      color: black(isAppDark(context))
                                    ),
                                    16.sp.sbW,
                                    AppText(
                                      LocaleData.takeATour.convertString(),
                                      color: black(isAppDark(context)),
                                    )
                                  ],
                                ),
                              ),
                              20.sp.sbH,
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  PriceWidget(
                                    value: property.amountFunded ?? 0,
                                    currency: Currency.naira,
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
                              20.sp.sbH,
                              AppCard(
                                bordered: true,
                                backgroundColor: stateColor2(isAppDark(context)),
                                borderColor: Theme.of(context).disabledColor.withValues(alpha: 0.2),
                                padding: 8.sp.padA,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        AppText(
                                          LocaleData.investors.convertString(),
                                          size: 10.99.sp,
                                          weight: FontWeight.w500,
                                          color: stateColor11(theme.isDark),
                                        ),
                                        AppText(
                                          "${property.totalInvestors??0}",
                                          size: 10.99.sp,
                                          weight: FontWeight.w500,
                                          color: stateColor11(theme.isDark),
                                        ),
                    
                                      ],
                                    ),
                                    10.sp.sbH,
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        AppText(
                                          LocaleData.remainingInvestmentAmount.convertString(),
                                          size: 10.99.sp,
                                          weight: FontWeight.w500,
                                          color: stateColor11(theme.isDark),
                                        ),
                                        PriceWidget(
                                          value: (property.totalCost??0) - (property.amountFunded??0),
                                          size: 10.99.sp,
                                          roundUp: true,
                                          weight: FontWeight.w500,
                                          color: stateColor11(theme.isDark),
                                        ),
                    
                                      ],
                                    ),
                                    10.sp.sbH,
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
                                    10.sp.sbH,
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
                              20.sp.sbH,
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
                              //     shrinkWrap: true,
                              //     scrollDirection: Axis.horizontal,
                              //     itemCount: locator<ProfileHomeViewModel>().faqs.length,
                              //     itemBuilder: (_, i){
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
                        )
                      ],
                    ),
                  ),
                ),
                if((property.amountFunded??0) /(property.totalCost??0) < 0.95)...[
                  if(!userService.cartItems.any((cart)=> cart.product?.id == property.id))...[
                    Form(
                      key: model.formKey,
                      child: AppCard(
                        backgroundColor: white(isAppDark(context)),
                        heights: 115.sp,
                        radius: 0.sp,
                        padding: EdgeInsets.symmetric(
                            vertical: 16.sp,
                            horizontal: 25.sp
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              spacing: 30.sp,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: AppTextField(
                                    // items: model.divideInto15((property.totalCost??0) - (property.amountFunded??0), Currency.naira),
                                    // prefix: AppText(getCurrencySymbol(property.currency)),
                                    onChanged: model.onchange,
                                    contentPadding: 10.sp.padA,
                                    prefixIcon: Padding(
                                      padding: 8.sp.padH,
                                      child: AppText(
                                        "\$",
                                        isTitle: true,
                                        color: primaryColor,
                                        family: "inter",
                                      ),
                                    ),
                                    keyboardType: TextInputType.number,
                                    errorStyle: TextStyle(fontSize: 0),
                                    controller: model.currentPrice,
                                    validator: (v)=> model.validator(v, property),
                                    fillColor: fadeBackground(isAppDark(context)),
                                    hint: LocaleData.selectAmount.convertString(),
                                  ),
                                ),
                                //(property.amountFunded??0)/(property.totalCost??0)
                                Expanded(
                                    child: AppButton.fullWidth(
                                      isLoading: model.isLoading,
                                      text: LocaleData.addToCart.convertString(),
                                      onTap: model.formKey.currentState?.validate() != true? null: ()=> model.addToCart(property),
                                      height: 40.sp,
                                    )
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ]
                ]
              ],
            ),
          ),
          IntrinsicHeight(child: AppBars(
            actions: [
              AppBarButton(
                onTap: ()=> model.saveUnsavedProperties(property),
                svg: Assets.svg.heartBlack,
                backgroundColor: userService.bookMarks.any((test)=> test.id == property.id)? red9(isAppDark(context)): null,
                iconColor: userService.bookMarks.any((test)=> test.id == property.id)? Colors.white: null,
              ),
              AppBarButton(onTap: (){}, svg: Assets.svg.forward, ),
              AppBarButton(onTap: (){}, svg: Assets.svg.questionCircle, ),
              16.sp.sbW,
            ],
          ))
        ],
      ),
    );
  }
}
