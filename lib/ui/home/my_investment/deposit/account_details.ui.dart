import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:propstake/app_theme/palette.dart';
import 'package:propstake/gen/assets.gen.dart';
import 'package:propstake/localization/locales.dart';
import 'package:propstake/locator.dart';
import 'package:propstake/ui/base/base-vm.dart';
import 'package:propstake/ui/home/properties/properies.vm.dart';
import 'package:propstake/utils/string_extensions.dart';
import 'package:propstake/utils/widget_extensions.dart';
import 'package:propstake/widget/app_button.dart';
import 'package:propstake/widget/appbar_widget.dart';
import 'package:propstake/widget/apptexts.dart';
import 'package:propstake/widget/price_widget.dart';

import '../../../../data/model/cart_model.dart';
import '../../../../utils/constants.dart';
import '../../../../utils/snack_message.dart';
import '../../../../widget/app_card.dart';
import '../../../../widget/success_screen.dart';
import '../../../../widget/svg_builder.dart';
import '../../../base/base-ui.dart';
import '../../bottom_nav.ui.dart';
import '../my_investment.vm.dart';

class AccountDetailScreen extends StatelessWidget {
  final List<TempCart>? cart;
  const AccountDetailScreen({super.key, this.cart});

  @override
  Widget build(BuildContext context) {
    return BaseView<MyInvestHomeViewModel>(
      onModelReady: (m)=> m.onInit(),
      builder: (model, theme) => Scaffold(
        appBar: AppBars(
          text: LocaleData.accountDetails.convertString(),
        ),
        body: ListView(
          padding: 16.sp.padA,
          children: [
            AppText(LocaleData.copyDetailsAndMakePayment.convertString()),
            16.sp.sbH,
            AccountOptionWidget(
              title: LocaleData.amount.convertString(),
              value: cart == null || (cart??[]).isEmpty? "": (cart??[]).fold(0, (sum, item) => sum + int.parse(item.amountSelected ?? "0")).toString(),
              isPrice: true,
              currency: Currency.naira,
            ),
            AccountOptionWidget(
              title: LocaleData.accountName.convertString(),
              value: "NPJ Luxury Properties Ltd",
            ),
            AccountOptionWidget(
              title: LocaleData.accountNumber.convertString(),
              value: "2004749140",
              copy: true,
            ),
            AccountOptionWidget(
              title: LocaleData.bankName.convertString(),
              value: "FCMB Bank",
            ),
            AccountOptionWidget(
              title: LocaleData.addMemoPleaseAddMemoToTheTransaction.convertString(),
              value: cart == null? "prop-manny" : cart!.map((item) => item.id).join("-"),
              copy: true,
            ),
            30.sp.sbH,
            if(cart != null)...[
              AppText(
                LocaleData.clickHereAfterYouMakeTheTransfer.convertString(),
                align: TextAlign.center,
                weight: FontWeight.w500,
              ),
              10.sp.sbH,
              AppButton.fullWidth(
                isLoading: model.isLoading,
                text: LocaleData.iHaveMadeTheTransfer.convertString(),
                onTap: ()=> model.confirm(cart??[], (cart??[]).fold(0, (sum, item) => sum + int.parse(item.amountSelected ?? "0")).toString()),
              ),
            ],
            100.sp.sbH,
          ],
        ),
      ),
    );
  }
}

class AccountOptionWidget extends StatelessWidget {
  final String title;
  final String value;
  final bool isPrice;
  final bool copy;
  final Currency? currency;

  const AccountOptionWidget({
    super.key,
    required this.title,
    required this.value,
    this.isPrice = false,
    this.copy = false,
    this.currency
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: 16.sp.padV,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: stateColor5(isAppDark(context)),
            width: 1.sp
          )
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(title, weight: FontWeight.w500,),
          16.sp.sbH,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if(isPrice)...[
                Expanded(
                  child: PriceWidget(
                    value: num.tryParse(value)??0,
                    roundUp: true,
                    weight: FontWeight.w700,
                    isTitle: true,
                    currency: currency!,
                    size: 16.sp,
                    color: black(isAppDark(context)),
                  ),
                )
              ] else ...[
                Expanded(
                  child: AppText(
                    value,
                    weight: FontWeight.w700,
                    isTitle: true,
                    size: 16.sp,
                    color: black(isAppDark(context)),
                  ),
                )
              ],
              if(copy)...[
                InkWell(
                  onTap: (){
                    FlutterClipboard.copy(value).then(( val ) => showCustomToast(
                      "${LocaleData.accountNumber.convertString() == title? LocaleData.accountNumber.convertString(): LocaleData.addMemoPleaseAddMemoToTheTransaction.convertString() == title? LocaleData.memeo.convertString(): value}${LocaleData.copiedToClipboard.convertString()}",
                      success: true
                    ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: SvgBuilder(
                        Assets.svg.copy,
                      color: stateColor12(isAppDark(context)),
                    ),
                  ),
                )
              ]
            ],
          ),
          10.sp.sbH
        ],
      ),
    );
  }
}


class InfoPageOne extends StatelessWidget {
  const InfoPageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
