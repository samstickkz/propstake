import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:propstake/app_theme/palette.dart';
import 'package:propstake/gen/assets.gen.dart';
import 'package:propstake/localization/locales.dart';
import 'package:propstake/utils/string_extensions.dart';
import 'package:propstake/utils/widget_extensions.dart';
import 'package:propstake/widget/appbar_widget.dart';
import 'package:propstake/widget/apptexts.dart';
import 'package:propstake/widget/svg_builder.dart';

import '../../../base/base-ui.dart';
import '../my_account/my_account.ui.dart';
import '../profile_home.vm.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<ProfileHomeViewModel>(
      builder: (model, child)=> Scaffold(
        appBar: AppBars(
          text: LocaleData.faq.convertString(),
        ),
        body: ListView.builder(
          itemCount: model.faqs.length,
          padding: 16.sp.padA,
          itemBuilder: (_, index){
            return SingleOptionWidgetCard(
              title: Column(
                children: [
                  InkWell(
                    onTap: ()=> model.onChange(index),
                    child: Padding(
                      padding: 4.sp.padV,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: AppText(
                              model.faqs[index].title,
                              size: 16.sp,
                              weight: FontWeight.w500,
                              color: stateColor12(isAppDark(context)),
                            ),
                          ),
                          16.sp.sbH,
                          SvgBuilder(model.faqs[index].isOpen? Assets.svg.arrowUp :  Assets.svg.arrowDown)
                        ],
                      ),
                    ),
                  ),
                  if(model.faqs[index].isOpen)...[
                    10.sp.sbH,
                    AppText(model.faqs[index].body, family: "Inter",)
                  ]
                ],
              )
            );
          }
        ),
      ),
    );
  }
}
