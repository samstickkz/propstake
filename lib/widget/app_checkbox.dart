import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppCheckBox extends StatefulWidget {
  final double? size;
  final bool value;
  final bool useBorder;
  final Function(bool) onChanged;
  final Color? activeColor;
  final Color? borderColor;
  final Widget? checkWidget;
  const AppCheckBox({
    super.key,
    this.size,
    this.activeColor,
    this.borderColor,
    this.checkWidget,
    required this.value, required this.onChanged, this.useBorder = false
  });

  @override
  State<AppCheckBox> createState() => _AppCheckBoxState();
}

class _AppCheckBoxState extends State<AppCheckBox> {

  bool value = false;
  @override
  void initState() {
    value = widget.value;
    // TODO: implement initState
    super.initState();
  }

  onChange(){
    setState(() {
      value = !value;
    });
    widget.onChanged(value);
  }


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onChange,
      child: Container(
        height: widget.size ?? 16.sp,
        alignment: Alignment.center,
        width: widget.size ?? 16.sp,
        decoration: BoxDecoration(
          border: widget.useBorder? Border.all(width: 0.67.sp, color: Theme.of(context).disabledColor): null,
            borderRadius: BorderRadius.circular(5.sp),
            color: !value? Colors.white : widget.activeColor ?? Theme.of(context).primaryColor,
          boxShadow: widget.useBorder? null: const [
            BoxShadow(
              color: Color(0x33131314),
              blurRadius: 1,
              offset: Offset(0, 0.50),
              spreadRadius: 0,
            )
          ]
        ),
        child: !value? null: widget.checkWidget ?? Icon(
          Icons.check,
          color: Colors.white,
          size: widget.size == null? 10.h: ((widget.size??0) - 8.sp),
        ),
      ),
    );
  }
}


class StateLessCheck extends StatelessWidget {
  final bool value;
  final VoidCallback onTap;
  final Color? activeColor;
  final Color? borderColor;
  final Widget? checkWidget;
  final bool useBorder;
  final double? size;
  const StateLessCheck({super.key, required this.value, required this.onTap, this.activeColor, this.borderColor, this.checkWidget, this.size, this.useBorder = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: size ?? 16.sp,
        alignment: Alignment.center,
        width: size ?? 16.sp,
        decoration: BoxDecoration(
            border: useBorder? Border.all(width: 0.67.sp, color:Theme.of(context).disabledColor): null,
            borderRadius: BorderRadius.circular(5.sp),
            color: !value? Colors.white : activeColor ?? Theme.of(context).primaryColor,
            boxShadow: useBorder? null: const [
              BoxShadow(
                color: Color(0x33131314),
                blurRadius: 1,
                offset: Offset(0, 0.50),
                spreadRadius: 0,
              )
            ]
        ),
        child: !value? null: checkWidget ?? Icon(
          Icons.check,
          color: Colors.white,
          size: size == null? 10.h: ((size??0) - 8.sp),
        ),
      ),
    );
  }
}

class AppRadioButton extends StatelessWidget {
  final bool value;
  final bool isDark;
  final double? size;
  final VoidCallback onTap;
  const AppRadioButton({super.key, required this.value, required this.onTap, required this.isDark, this.size});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular((size ?? 24.sp)/2),
      child: Container(
        width: size ?? 24.sp,
        height: size ?? 24.sp,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: value? Theme.of(context).primaryColor : null,
          shape: BoxShape.circle,
          border: value? Border.all(width: 1.5.sp, color: Theme.of(context).disabledColor.withValues(alpha:0.3)):  Border.all(width: 1.sp, color: Theme.of(context).disabledColor),
          ),
        ),
    );
  }
}
