import 'package:flutter/material.dart';
import 'package:propstake/ui/base/base-ui.dart';
import 'package:propstake/widget/auth_appbar.dart';

import 'bottom_nav.vm.dart';

class BottomNavigationScreen extends StatelessWidget {
  final int initialIndex;
  const BottomNavigationScreen({super.key, this.initialIndex = 0});

  @override
  Widget build(BuildContext context) {
    return BaseView<BottomNavigationViewModel>(
      builder: (model, theme)=> Scaffold(
        appBar: AppAppBar(),
        body: Placeholder(),
      ),
    );
  }
}
