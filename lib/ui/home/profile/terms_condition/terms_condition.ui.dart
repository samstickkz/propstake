import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:propstake/localization/locales.dart';
import 'package:propstake/utils/string_extensions.dart';
import 'package:propstake/utils/widget_extensions.dart';
import 'package:propstake/widget/appbar_widget.dart';

import '../../../../app_theme/palette.dart';
import '../../../../widget/apptexts.dart';
import '../../../base/base-ui.dart';
import '../my_account/my_account.ui.dart';
import 'terms_condition.vm.dart';

class TermsAndConditionScreen extends StatelessWidget {
  const TermsAndConditionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<TermsAndConditionViewModel>(
      builder: (model, child)=> Scaffold(
        appBar: AppBars(
          text: LocaleData.termsConditions.convertString(),
        ),
        body: ListView.builder(
          padding: 16.sp.padA,
          itemCount: model.terms.length,
          itemBuilder: (_, i){
            return SingleOptionWidgetCard(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if(model.terms[i].title.isNotEmpty)...[
                    AppText(
                      model.terms[i].title.toUpperCase(),
                      size: 14.sp,
                      weight: FontWeight.w700,
                      color: stateColor12(isAppDark(context)),
                    ),
                    10.sp.sbH
                  ],
                  model.terms[i].point.length == 1? AppText(
                    model.terms[i].point[0],
                    size: 12.sp,
                    color: stateColor12(isAppDark(context)),
                  ):
                  Column(
                    children: List.generate(
                      model.terms[i].point.length,
                      (index){
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: 6.sp.padT,
                              height: 5.sp, width: 5.sp,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: stateColor12(isAppDark(context))
                              ),
                            ),
                            16.sp.sbW,
                            Expanded(
                              child: AppText(
                                model.terms[i].point[index],
                                size: 12.sp,
                                color: stateColor12(isAppDark(context)),
                              )
                            )
                          ],
                        );
                      }
                    ),
                  )
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}
