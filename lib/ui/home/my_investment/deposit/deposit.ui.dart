import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:propstake/app_theme/palette.dart';
import 'package:propstake/gen/assets.gen.dart';
import 'package:propstake/localization/locales.dart';
import 'package:propstake/utils/string_extensions.dart';
import 'package:propstake/utils/widget_extensions.dart';
import 'package:propstake/widget/appbar_widget.dart';
import 'package:propstake/widget/apptexts.dart';

import '../../../../utils/constants.dart';
import '../../../../widget/app_card.dart';
import '../../../../widget/svg_builder.dart';
import 'account_details.ui.dart';

class DepositScreen extends StatelessWidget {
  const DepositScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars(
        text: LocaleData.deposit.convertString(),
      ),
      body: ListView(
        padding: 16.sp.padA,
        children: [
          AppText(LocaleData.chooseAPaymentMethodThatWorksBestForYou.convertString()),
          16.sp.sbH,
          AppCard(
            onTap: ()=> navigationService.navigateToRoute(AccountDetailScreen()),
            color: stateColor3(isAppDark(context)),
              padding: EdgeInsets.symmetric(
                  horizontal: 10.sp,
                  vertical: 16.sp
              ),
            child: Row(
              spacing: 16.sp,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgBuilder(Assets.svg.bankTransfer),
                Expanded(child: Column(
                  spacing: 4.sp,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      LocaleData.bankTransfer.convertString(),
                      weight: FontWeight.w500,
                      size: 14.sp,
                    ),
                    AppText(
                      LocaleData.transferFundsFromYourLocalOrInternationalBankAccounts.convertString(),
                      size: 10.sp,
                    )
                  ],
                )),
                SvgBuilder(Assets.svg.arrowRight, color: stateColor12(isAppDark(context)),),
              ],
            )
          ),
        ],
      ),
    );
  }
}
