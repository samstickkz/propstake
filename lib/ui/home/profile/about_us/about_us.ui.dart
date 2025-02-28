import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:propstake/localization/locales.dart';
import 'package:propstake/utils/string_extensions.dart';
import 'package:propstake/utils/widget_extensions.dart';
import 'package:propstake/widget/app_card.dart';
import 'package:propstake/widget/appbar_widget.dart';
import 'package:propstake/widget/apptexts.dart';

import '../../../base/base-ui.dart';
import 'about_us.vm.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<AboutUsViewModel>(
      builder: (model, child)=> Scaffold(
        appBar: AppBars(
          text: LocaleData.aboutUs.convertString(),
        ),
        body: ListView(
          padding: 16.sp.padA,
          children: [
            AppCard(
              child: AppText(LocaleData.loremIpsumPlaceholder.convertString()),
            )
          ],
        ),
      ),
    );
  }
}
