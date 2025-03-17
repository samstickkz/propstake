import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:propstake/gen/assets.gen.dart';
import 'package:propstake/localization/locales.dart';
import 'package:propstake/utils/string_extensions.dart';
import 'package:propstake/utils/widget_extensions.dart';
import 'package:propstake/widget/appbar_widget.dart';
import 'package:propstake/widget/apptexts.dart';

import '../../../../widget/svg_builder.dart';

class AutoInvestScreen extends StatelessWidget {
  const AutoInvestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars(
        text: LocaleData.autoInvest.convertString(),
      ),
      body: SizedBox(
        width: width(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgBuilder(Assets.svg.comingSoon),
            20.sp.sbH,
            AppText(
              LocaleData.comingSoon.convertString(),
              isTitle: true,
              size: 20.sp,
            )
          ],
        ),
      ),
    );
  }
}
