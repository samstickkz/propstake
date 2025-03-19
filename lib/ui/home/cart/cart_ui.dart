import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:propstake/app_theme/palette.dart';
import 'package:propstake/gen/assets.gen.dart';
import 'package:propstake/localization/locales.dart';
import 'package:propstake/utils/string_extensions.dart';
import 'package:propstake/utils/widget_extensions.dart';
import 'package:propstake/widget/app_button.dart';
import 'package:propstake/widget/app_card.dart';
import 'package:propstake/widget/apptexts.dart';

import '../../../widget/appbar_widget.dart';
import '../../base/base-ui.dart';
import '../properties/properies.vm.dart';
import 'cart_vm.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<CartViewModel>(
      onModelReady: (m)=> m.onInit(),
      builder: (model, theme) => Scaffold(
        appBar: AppBars(
          text: convertListString(LocaleData.cartAmount.convertString(), data: [model.cartItems.length]),
        ),
        body: SafeArea(
          top: false,
          bottom: true,
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: 16.sp.padA,
                  itemCount: model.cartItems.length,
                  itemBuilder: (_, index){
                    TempCart cart = model.cartItems[index];
                    return AppCard(
                      bordered: true,
                      borderColor: stateColor4(isAppDark(context)),
                      backgroundColor: stateColor1(isAppDark(context)),
                      padding: 10.sp.padV,
                      child: Column(
                        children: [
                          Padding(
                            padding: 10.sp.padH,
                            child: Column(
                              spacing: 16.sp,
                              children: [
                                Row(
                                  spacing: 16.sp,
                                  children: [
                                    AppCard(
                                      heights: 94.sp,
                                      widths: 114.sp,
                                      backgroundImage: cart.product.coverImage,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          AppText(
                                            cart.product.name,
                                            size: 20.06.sp,
                                            weight: FontWeight.w700,
                                            color: stateColor12(theme.isDark),
                                          ),
                                          AppText(
                                            cart.product.location,
                                            size: 14.44.sp,
                                            weight: FontWeight.w500,
                                            color: stateColor11(theme.isDark),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    AppText(
                                      LocaleData.fiveYearTotalReturn.convertString(),
                                      size: 14.sp,
                                      weight: FontWeight.w500,
                                      color: stateColor11(theme.isDark),
                                    ),
                                    AppText(
                                      "${cart.product.returnPercentageFiveYears.toStringAsFixed(0)}%",
                                      size: 14.sp,
                                      weight: FontWeight.w500,
                                      color: stateColor11(theme.isDark),
                                    ),

                                  ],
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            height: 32.sp,
                          ),
                          Padding(
                            padding: 10.sp.padH,
                            child: Row(
                              spacing: 20.sp,
                              children: [
                                AppCard(
                                  padding: 0.0.padA,
                                  onTap: ()=> model.reduceAmount(cart),
                                  bordered: true,
                                  backgroundColor: Colors.transparent,
                                  heights: 42.sp,
                                  widths: 45.sp,
                                  child: Center(
                                    child: AppText("-", isTitle: true,),
                                  ),
                                ),
                                Expanded(
                                  child: AppCard(
                                    padding: 0.0.padA,
                                    bordered: true,
                                    borderColor: primaryColor,
                                    backgroundColor: Colors.transparent,
                                    heights: 42.sp,
                                    child: Center(
                                      child: AppText(cart.amountSelected, color: primaryColor, isTitle: true, size: 16.sp,),
                                    ),
                                  ),
                                ),
                                AppCard(
                                  onTap: ()=> model.increaseAmount(cart),
                                  padding: 0.0.padA,
                                  bordered: true,
                                  backgroundColor: Colors.transparent,
                                  heights: 42.sp,
                                  widths: 45.sp,
                                  child: Center(
                                    child: AppText("+", isTitle: true,),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          16.sp.sbH,
                          Divider(
                            height: 1.sp,
                          ),
                          AppButton.transparent(
                            text: LocaleData.remove.convertString(),
                            svgImage: Assets.svg.trash,
                            onTap: ()=> model.removeFromCart(cart),
                            textColor: stateColor11(isAppDark(context)),
                          )
                        ],
                      ),
                    );
                  }
                ),
              ),
              if(model.cartItems.isNotEmpty)
              Padding(
                padding: 16.sp.padA,
                child: AppButton.fullWidth(
                  isLoading: model.isLoading,
                  onTap: model.checkOut,
                  text: LocaleData.checkOut.convertString(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
