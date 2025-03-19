import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:propstake/localization/locales.dart';
import 'package:propstake/ui/base/base-ui.dart';
import 'package:propstake/utils/string_extensions.dart';
import 'package:propstake/utils/validator.dart';
import 'package:propstake/utils/widget_extensions.dart';
import 'package:propstake/widget/app_button.dart';
import 'package:propstake/widget/appbar_widget.dart';
import 'package:propstake/widget/text_field.dart';

import '../../../../widget/apptexts.dart';
import 'withdraw.vm.dart';

class WithdrawScreen extends StatelessWidget {
  const WithdrawScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<WithdrawViewModel>(
      builder: (model, theme)=> Scaffold(
        appBar: AppBars(
          text: LocaleData.withdraw.convertString(),
        ),
        body: Form(
          key: model.formKey,
          child: ListView(
            padding: 16.sp.padA,
            children: [
              AppText(LocaleData.enterYourBankDetailsToReceivePayment.convertString()),
              30.sp.sbH,
              AppTextField(
                controller: model.accountNameController,
                onChanged: model.onChanged,
                validator: emptyValidator,
                hintText: LocaleData.accountNumber.convertString(),
              ),
              20.sp.sbH,
              AppTextField(
                controller: model.nameController,
                onChanged: model.onChanged,
                validator: emptyValidator,
                hintText: LocaleData.accountName.convertString(),
              ),
              20.sp.sbH,
              AppTextField(
                controller: model.bankNameController,
                onChanged: model.onChanged,
                validator: emptyValidator,
                hintText: LocaleData.bankName.convertString(),
              ),
              20.sp.sbH,
              AppButton.fullWidth(
                isLoading: model.isLoading,
                onTap: model.formKey.currentState?.validate() == true? model.submit: null,
                text: LocaleData.confirm.convertString(),
              )

            ],
          ),
        ),
      ),
    );
  }
}
