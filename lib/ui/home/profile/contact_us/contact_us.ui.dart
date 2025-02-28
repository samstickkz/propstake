import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:propstake/app_theme/palette.dart';
import 'package:propstake/localization/locales.dart';
import 'package:propstake/utils/string_extensions.dart';
import 'package:propstake/utils/validator.dart';
import 'package:propstake/utils/widget_extensions.dart';
import 'package:propstake/widget/app_button.dart';
import 'package:propstake/widget/appbar_widget.dart';
import 'package:propstake/widget/apptexts.dart';
import 'package:propstake/widget/text_field.dart';

import '../../../base/base-ui.dart';
import 'contact_us.vm.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<ContactUsViewModel>(
      onModelReady: (m)=> m.init(),
      builder: (model, child)=> Scaffold(
        appBar: AppBars(
          text: LocaleData.contactUs.convertString(),
        ),
        body: Form(
          key: model.formKey,
          child: ListView(
            padding: 16.sp.padA,
            children: [
              AppText(
                LocaleData.howCanWeHelpYou.convertString(),
                size: 16.sp,
                weight: FontWeight.w500,
                color: stateColor12(isAppDark(context)),
              ),
              30.sp.sbH,
              AppTextField(
                controller: model.nameController,
                readonly: true,
                hintText: LocaleData.yourName.convertString(),
                textSize: 14.sp,
                hintColor: stateColor11(isAppDark(context)),
              ),
              30.sp.sbH,
              TextArea(
                controller: model.messageController,
                hintText: LocaleData.yourMessage.convertString(),
                hintColor: stateColor11(isAppDark(context)),
                maxLines: 10,
                onChanged: model.onChanged,
                validator: emptyValidator,
              ),
              30.sp.sbH,
              AppButton.fullWidth(
                isLoading: model.isLoading,
                onTap: model.formKey.currentState?.validate()== true? (){} : null,
                text: LocaleData.submit.convertString(),
              ),
              30.sp.sbH,

            ],
          ),
        ),
      ),
    );
  }
}
