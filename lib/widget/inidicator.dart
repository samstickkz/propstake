import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_theme/palette.dart';
import '../utils/widget_extensions.dart';

class Indicators extends StatelessWidget {
  final int total;
  final int current;
  final Function(int)? onChange;
  const Indicators({super.key, required this.total, required this.current, this.onChange});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _indicatorContent(context)
    );
  }

  List<Widget> _indicatorContent(BuildContext context) {
    return List<Widget>.generate(total, (int index) {
        return GestureDetector(
          onTap: (){
            if(onChange != null){
              onChange!(index);
            }
          },
          child: Container(
            width: 28.sp,
            height: 4.sp,
            margin: EdgeInsets.symmetric(horizontal: 3.sp, vertical: 0.sp),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.5.sp),
              color: current == index
                  ? Theme.of(context).primaryColor
                  : Color(0x808F8F8F),
            ),
          ),
        );
      });
  }
}