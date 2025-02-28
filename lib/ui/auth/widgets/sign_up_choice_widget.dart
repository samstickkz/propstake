import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app_theme/palette.dart';
import '../../../utils/widget_extensions.dart';
import '../../../widget/apptexts.dart';

class SignUpChoiceWidget extends StatelessWidget {
  final List<String> tabs;
  final String activeScreen;
  final Function(String) changeScreen;
  const SignUpChoiceWidget({
    super.key,
    required this.tabs,
    required this.activeScreen, required this.changeScreen,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        height: 46.sp,
        padding: 4.sp.padA,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.sp),
            color: fadeBackground(isAppDark(context))
        ),
        child: Row(
          children: List.generate(
              tabs.length,
                  (index){
                return InkWell(
                  onTap: ()=> changeScreen(tabs[index]),
                  borderRadius: BorderRadius.circular(25.sp),
                  child: Container(
                    height: height(context),
                    alignment: Alignment.center,
                    padding: 14.sp.padH,
                    margin: index==0? 4.sp.padR: 4.sp.padL,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.sp),
                        color:tabs[index] == activeScreen? primaryColor: Colors.transparent
                    ),
                    child: Padding(
                      padding:4.sp.padV,
                      child: AppText(
                        tabs[index],
                        size: 13.33.sp,
                        color: tabs[index] == activeScreen? Colors.white:  black(isAppDark(context)),
                        weight: FontWeight.w500,
                      ),
                    ),
                  ),
                );
              }
          ),
        ),
      ),
    );
  }
}