import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class Indicators extends StatelessWidget {
  final int total;
  final int current;
  final bool withFullWidth;
  final Function(int)? onChange;
  final Color? inactiveColor;
  final Color? activeColor;
  const Indicators({super.key, required this.total, required this.current, this.onChange, this.withFullWidth = false, this.inactiveColor, this.activeColor});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _indicatorContent(context, withFullWidth)
    );
  }

  List<Widget> _indicatorContent(BuildContext context, bool withFullWidth) {
    return List<Widget>.generate(total, (int index) {
        return withFullWidth?
        Expanded(
          child: GestureDetector(
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
                    ? (activeColor ?? Theme.of(context).primaryColor)
                    : (inactiveColor ?? Color(0x808F8F8F)),
              ),
            ),
          ),
        ):
        GestureDetector(
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
        )
        ;
      });
  }
}

class DotIndicators extends StatelessWidget {
  final int total;
  final double? size;
  final int current;
  final Function(int)? onChange;
  final Color? inactiveColor;
  final Color? activeColor;
  const DotIndicators({super.key, required this.total, required this.current, this.onChange, this.inactiveColor, this.activeColor, this.size});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _indicatorContent(context)
    );
  }

  List<Widget> _indicatorContent(BuildContext context) {
    return List<Widget>.generate(total, (int index) {
        return
        GestureDetector(
          onTap: (){
            if(onChange != null){
              onChange!(index);
            }
          },
          child: Container(
            width: size?? 6.sp,
            height: size?? 6.sp,
            margin: EdgeInsets.symmetric(horizontal: 3.sp, vertical: 0.sp),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(size == null? 7.5.sp: ((size??0)/2)),
              color: current == index
                  ? Theme.of(context).primaryColor
                  : Color(0x808F8F8F),
            ),
          ),
        )
        ;
      });
  }
}