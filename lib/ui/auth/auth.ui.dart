import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:propstake/utils/widget_extensions.dart';
import 'package:propstake/widget/app_button.dart';
import 'package:propstake/widget/apptexts.dart';
import 'package:propstake/widget/auth_appbar.dart';
import 'package:propstake/widget/or_builder.dart';
import 'package:propstake/widget/svg_builder.dart';
import 'package:animate_do/animate_do.dart';

import '../../gen/assets.gen.dart';
import '../base/base-ui.dart';
import 'auth.vm.dart';
import 'widgets/sign_in_form.dart';
import 'widgets/sign_up_choice_widget.dart';
import 'widgets/sign_up_form.dart';

class AuthHomeScreen extends StatelessWidget {
  final bool? isSignIn;
  const AuthHomeScreen({super.key, this.isSignIn});

  @override
  Widget build(BuildContext context) {
    return BaseView<AuthViewModel>(
      onModelReady: (m)=> m.onInit(isSignIn),
      builder: (model, theme)=> Scaffold(
        appBar: AppAppBar(),
        body: Padding(
          padding: 16.sp.padA,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              20.sp.sbH,
              SignUpChoiceWidget(
                tabs: model.screens,
                activeScreen: model.screen,
                changeScreen: model.changeScreen,
              ),
              20.sp.sbH,
              Expanded(
                child: model.screens[0] == model.screen?
                SlideInDown(
                  child: SignUpForm(
                    model: model
                  )
                ):
                SlideInUp(child: SignInForm(model: model,))
              ),
            ],
          ),
        ),
      ),
    );
  }
}





