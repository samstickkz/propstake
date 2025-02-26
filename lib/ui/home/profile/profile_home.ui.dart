import 'package:flutter/material.dart';

import '../../base/base-ui.dart';
import 'profile_home.vm.dart';

class ProfileHomeScreen extends StatelessWidget {
  const ProfileHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<ProfileHomeViewModel>(
      builder: (model, theme)=> Scaffold(

      ),
    );
  }
}
