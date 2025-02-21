import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:propstake/ui/base/base-ui.dart';
import 'package:propstake/utils/constants.dart';

import '../../../gen/assets.gen.dart';
import '../../../utils/widget_extensions.dart';
import '../../../widget/auth_appbar.dart';
import '../../../widget/svg_builder.dart';
import 'verify.vm.dart';

class VerifyUserScreen extends StatelessWidget {
  const VerifyUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<VerifyUserViewModel>(
      builder: (model, theme)=> Scaffold(
        appBar: AppAppBar(
          leading: InkWell(
            onTap: navigationService.canPop() ? navigationService.goBack: null,
            child: SvgBuilder(
              isAppDark(context)? Assets.svg.tempLogo: Assets.svg.tempLogoLight,
              width: 81.w, height: 27.h,
            ),
          ),
        ),
      ),
    );
  }
}
