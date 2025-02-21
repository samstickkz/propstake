import 'package:flutter/material.dart';

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
        body: Container(
          height: height(context),
          width: width(context),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor
          ),
          // child: Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //
          // ),
        ),
      ),
    );
  }
}
