import 'package:cached_network_image/cached_network_image.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:propstake/app_theme/palette.dart';
import 'package:propstake/data/model/propert_response.dart';
import 'package:propstake/gen/assets.gen.dart';
import 'package:propstake/localization/locales.dart';
import 'package:propstake/ui/base/base-ui.dart';
import 'package:propstake/ui/home/cart/cart_vm.dart';
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
import '../../bottom_nav.ui.dart';

class AccountDetailScreen extends StatelessWidget {
  final PropertyResponse propertyResponse;
  final num price;
  const AccountDetailScreen({super.key, required this.propertyResponse, required this.price});

  @override
  Widget build(BuildContext context) {
    return BaseView<CartViewModel>(
      builder: (model, theme) {
        return Scaffold(
          appBar: AppBars(
            text: LocaleData.accountDetails.convertString(),
          ),
          body: DefaultTabController(
            length: 2,
            child: Column(
              children: [
                TabBar(
                  tabs: [
                    Tab(text: "Fiat (Naira)",),
                    Tab(text: "Crypto",),
                  ],
                  dividerColor: Theme.of(context).disabledColor.withValues(alpha: 0.5),
                  indicatorSize: TabBarIndicatorSize.tab,
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      ListView(
                        padding: 16.sp.padA,
                        children: [
                          AppText(LocaleData.copyDetailsAndMakePayment.convertString()),
                          16.sp.sbH,
                          AccountOptionWidget(
                            title: LocaleData.amount.convertString(),
                            value: price.toStringAsFixed(2),
                            isPrice: true,
                            currency: Currency.dollar,
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
                            value: propertyResponse.id??"",
                            copy: true,
                          ),
                          30.sp.sbH,
                          AppText(
                            LocaleData.clickHereAfterYouMakeTheTransfer.convertString(),
                            align: TextAlign.center,
                            weight: FontWeight.w500,
                          ),
                          10.sp.sbH,
                          AppButton.fullWidth(
                            isLoading: false,
                            text: LocaleData.iHaveMadeTheTransfer.convertString(),
                            onTap: ()=> model.submit(
                              property: propertyResponse,
                              price: price,
                              paymentType: "FIAT",
                              wallet: "FCMB - 2004749140",
                              id: DateTime.now().toIso8601String()+getRandomString(15)
                            ),
                          ),
                          100.sp.sbH,
                        ],
                      ),
                      ListView(
                        padding: 16.sp.padH,
                        children: [
                          AppText(LocaleData.copyDetailsAndMakePayment.convertString()),
                          16.sp.sbH,
                          AccountOptionWidget(
                            title: LocaleData.amount.convertString(),
                            value: price.toStringAsFixed(2),
                            isPrice: true,
                            currency: Currency.dollar,
                          ),
                          ListView.builder(
                            padding: 16.sp.padV,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: crypto.length,
                            itemBuilder: (_, i) {
                              return AppCard(
                                margin: i == 2? null: 10.sp.padB,
                                bordered: true,
                                child: Column(
                                  spacing: 16.sp,
                                  children: [
                                    Row(
                                      children: [
                                        AppText(crypto[i].name, isTitle: true,)
                                      ],
                                    ),
                                    SizedBox(
                                      height: 250.sp,
                                      child: PrettyQrView.data(
                                        data: crypto[i].value,
                                      ),
                                    ),
                                    AccountOptionWidget(
                                      title: LocaleData.address.convertString(),
                                      value: crypto[i].value,
                                      copy: true,
                                      border: false,
                                    ),
                                    AppButton.fullWidth(
                                      isLoading: model.isLoading,
                                      text: LocaleData.done.convertString(),
                                      onTap: ()=>  model.submit(
                                          property: propertyResponse,
                                          price: price,
                                          paymentType: "CRYPTO",
                                          wallet: "${crypto[i].name} - ${crypto[i].value}",
                                          id: DateTime.now().toIso8601String()+getRandomString(15)
                                      )
                                    )
                                  ],
                                ),
                              );
                            }
                          )
                        ],
                      )
                    ]
                  ),
                )
              ],
            )
          ),
        );
      }
    );
  }
}

class AccountOptionWidget extends StatelessWidget {
  final String title;
  final String value;
  final bool isPrice;
  final bool border;
  final bool copy;
  final Currency? currency;

  const AccountOptionWidget({
    super.key,
    required this.title,
    required this.value,
    this.isPrice = false,
    this.copy = false,
    this.border = true,
    this.currency
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: 16.sp.padV,
      decoration: BoxDecoration(
        border: border? Border(
          bottom: BorderSide(
            color: stateColor5(isAppDark(context)),
            width: 1.sp
          )
        ): null
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
                      "${LocaleData.accountNumber.convertString() == title? LocaleData.accountNumber.convertString(): value}${LocaleData.copiedToClipboard.convertString()}",
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

List<CryptoMap> crypto = [
  CryptoMap(
    name: "USDT TRC20",
    value: "TQD7BAMqmnd4oxniCgnJbo2oJKzbSRVLMZ",
    logo: "https://cryptologos.cc/logos/tether-usdt-logo.png?v=040"
  ),
  CryptoMap(
      name: "USDT Bep20",
      value: "0x0055eda96506afe0f0b577be9f8e0d34f5ee1417",
    logo: "https://cryptologos.cc/logos/tether-usdt-logo.png?v=040"
  ),
  CryptoMap(
    name: "Solana",
    value: "Dcg26An2oig7LU5WR6pR7bwnYwDxjtqcfowv53smR6qh",
    logo: "https://cryptologos.cc/logos/solana-sol-logo.png?v=040"
  ),
];


class CryptoMap {
  final String name;
  final String value;
  final String logo;

  CryptoMap({
    required this.name,
    required this.value,
    required this.logo,
  });
}