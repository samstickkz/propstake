import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:propstake/app_theme/palette.dart';
import 'package:propstake/gen/assets.gen.dart';
import 'package:propstake/widget/svg_builder.dart';

import '../../../utils/widget_extensions.dart';
import '../../base/base-ui.dart';
import 'splash.vm.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return BaseView<SplashScreenViewModel>(
      onModelReady: (m)=> m.init(this),
      builder: (model ,theme)=> Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
        ),
        body: Container(
          height: height(context),
          width: width(context),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: 70.sp.padA,
                child: ImageBuilder(
                  Assets.png.logoName.path
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
