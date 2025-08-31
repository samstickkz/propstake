import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:propstake/ui/home/profile/profile_home.vm.dart';
import 'package:propstake/utils/widget_extensions.dart';
import 'package:propstake/widget/appbar_widget.dart';
import 'package:propstake/widget/apptexts.dart';

class FaqDetailPage extends StatelessWidget {
  final FaqModel faq;
  const FaqDetailPage({super.key, required this.faq});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars(
        text: faq.title,
      ),
      body: ListView(
        padding: 16.sp.padA,
        children: [
          AppText(faq.body, weight: FontWeight.w500, family: "inter",)
        ],
      ),
    );
  }
}
