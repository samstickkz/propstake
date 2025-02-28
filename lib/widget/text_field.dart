import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:propstake/localization/locales.dart';
import 'package:propstake/utils/string_extensions.dart';
import 'package:propstake/widget/svg_builder.dart';

import '../app_theme/palette.dart';
import '../gen/assets.gen.dart';
import '../utils/constants.dart';
import '/utils/widget_extensions.dart';
import 'apptexts.dart';

class AppTextField extends StatefulWidget {
  final String? hintText;
  final String? Function(String?)? validator;
  final String? hint;
  final String? labelText;
  final bool readonly;
  final double? percentage;
  final bool useBorder;
  final bool isPassword;
  final bool showError;
  final Widget? suffixIcon;
  final Widget? errorWidget;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? label;
  final Widget? prefix;
  final Widget? prefixIcon;
  final double? textSize;
  final double? borderRadius;
  final TextAlign textAlign ;
  final Color? hintColor;
  final Color? bodyTextColor;
  final Color? fillColor;
  final Color? textColor;
  final bool? enabled;
  final bool? overrideIconColor;
  final VoidCallback? onTap;
  final AutovalidateMode? autoValidateMode;
  final InputBorder? enabledBorder;
  final int? maxLength;
  final int? maxHeight;
  final bool? haveText;
  final Iterable<String>? autofillHints;
  final List<TextInputFormatter>? inputFormatters;
  final VoidCallback? onEditingComplete;
  final Function(String)? onFieldSubmitted;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;

  const AppTextField(
      {super.key,
        this.readonly = false,
        this.useBorder = true,
        this.isPassword = false,
        this.showError = true,
        this.percentage,
        this.hintText,
        this.hint,
        this.onChanged,
        this.controller,
        this.keyboardType = TextInputType.text,
        this.textAlign = TextAlign.start,
        this.onTap,
        this.onEditingComplete,
        this.onFieldSubmitted,
        this.validator,
        this.autofillHints,
        this.suffixIcon,
        this.textSize,
        this.haveText,
        this.maxLength,
        this.labelText,
        this.label,
        this.contentPadding,
        this.prefix,
        this.maxHeight = 1,
        this.hintColor,
        this.textColor,
        this.inputFormatters,
        this.errorWidget,
        this.enabled,
        this.fillColor,
        this.overrideIconColor,
        this.enabledBorder,
        this.autoValidateMode,
        this.borderRadius,
        this.bodyTextColor,
        this.textInputAction, this.prefixIcon
      });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  final FocusNode _focusNode = FocusNode();
  bool isVisible = false;


  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        isVisible = false;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    bool isDark = isAppDark(context);
    double percentage = widget.percentage ?? 0;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.hintText != null
            ? Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: AppText(
                    widget.hintText ?? "",
                    size: widget.textSize ?? 16.sp,
                    align: TextAlign.start,
                    weight: FontWeight.w500,
                    color: stateColor12(isAppDark(context)),
                  ),
                ),
                if(widget.percentage!=null)...[
                  ClipRRect(
                    borderRadius:BorderRadius.circular(4.r),
                    child: Container(
                      width: 80.sp,
                      height: 6.sp,
                      color: Theme.of(context).inputDecorationTheme.fillColor,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 6.sp,
                            width: 80.sp * (widget.percentage??0)/100,
                            color: widget.percentage == null || percentage < 50? Colors.red : percentage==50 || percentage < 75? amber7(isDark): green8(isDark),
                          ),
                        ],
                      ),
                    ),
                  )
                ]
              ],
            ),
            10.0.sbH,
          ],
        )
            : 0.0.sbH,
        Row(
          children: [
            Expanded(
              child: TextFormField(
                textAlign: widget.textAlign,
                validator: widget.validator,
                autofillHints: widget.autofillHints,
                onEditingComplete: widget.onEditingComplete,
                autovalidateMode: widget.autoValidateMode,
                onFieldSubmitted: widget.onFieldSubmitted,
                maxLines: widget.maxHeight,
                focusNode: _focusNode,
                maxLength: widget.maxLength,
                onChanged: (val) {
                  if (widget.onChanged != null) {
                    widget.onChanged!(val);
                  }
                },
                onTap: widget.onTap,
                readOnly: widget.readonly,
                enabled: widget.enabled,
                obscureText: widget.isPassword ? !isVisible : false,
                textInputAction: widget.textInputAction?? TextInputAction.next,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 16.sp, fontFamily: 'Inter', color: widget.bodyTextColor),
                controller: widget.controller,
                inputFormatters: widget.inputFormatters,
                decoration: InputDecoration(
                    errorMaxLines: 3,
                    counter: 0.0.sbH,
                    hintText: widget.hint,
                    fillColor: widget.fillColor,
                    enabled: widget.enabled ?? true,
                    error: widget.errorWidget,
                    prefixIconColor: widget.overrideIconColor ==true? null: const Color(0xFF2A2A2A),
                    suffixIconColor: widget.overrideIconColor ==true? null: const Color(0xFF2A2A2A),
                    prefixIcon: widget.prefixIcon?? (widget.prefix==null? null : SizedBox(height: 30.sp, width: 30.sp ,child: Align(alignment: Alignment.center, child: widget.prefix))),
                    suffixIcon: widget.suffixIcon ?? (widget.isPassword
                        ? IconButton(
                        onPressed: () {
                          setState(() {
                            isVisible = !isVisible;
                          });
                        },
                        icon: widget.suffixIcon ??
                            SvgBuilder(isVisible
                                ? Assets.svg.visibilityOff
                                : Assets.svg.visible, size: 20.sp,
                            ))
                        : widget.suffixIcon
                    ),
                    label: widget.label,
                    labelText: widget.labelText,
                    contentPadding: widget.contentPadding,
                  errorStyle: Theme.of(context).inputDecorationTheme.errorStyle?.copyWith(
                    fontSize: !widget.showError? 0.sp: null,

                  )
                ),
                keyboardType: widget.keyboardType,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class CustomPhoneNumberInput extends StatelessWidget {
  final Function? onSubmit;
  final double? textSize;
  final double? borderWidth;
  final double? radius;
  final Color? hintColor;
  final EdgeInsetsGeometry? contentPadding;
  final String? Function(String?)? validator;
  final Function(PhoneNumber)? onSaved;
  final Function(PhoneNumber)? onInputChanged;
  final String? isoCode;
  final String? hint;
  final String? hintText;
  final PhoneNumber? initialValue;
  final String? labelText;
  final bool enabled;
  final bool useBorder;
  final bool isError; // New property to indicate error
  final TextEditingController? controller;

  const CustomPhoneNumberInput({
    super.key,
    this.onSubmit,
    this.onSaved,
    this.isoCode,
    this.onInputChanged,
    this.controller,
    this.hint,
    this.textSize,
    this.hintColor,
    this.validator,
    this.enabled = true,
    this.useBorder = true,
    this.borderWidth,
    this.radius,
    this.contentPadding,
    this.labelText,
    this.hintText,
    this.isError = false, this.initialValue, // Default to no error
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        hintText != null
            ? Column(
          children: [
            AppText(
              hintText ?? "",
              size: textSize ?? 15.sp,
              color: hintColor ?? Theme.of(context).textTheme.bodyMedium?.color,
              align: TextAlign.start,
              weight: FontWeight.w500,
            ),
            5.0.sbH,
          ],
        )
            : 0.0.sbH,
        Container(
          padding: 16.sp.padH,
          decoration: BoxDecoration(
            color: Theme.of(context).inputDecorationTheme.fillColor,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(
              color: isError ? (Theme.of(context).inputDecorationTheme.errorStyle?.color?? Colors.transparent) : Colors.transparent, // Change border color based on isError
              width: borderWidth ?? (isError? 1.sp: 0.sp),
            ),
          ),
          child: InternationalPhoneNumberInput(
            textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 16.sp),
            onInputChanged: (PhoneNumber number) => onInputChanged!(number),
            keyboardType: const TextInputType.numberWithOptions(
              signed: true,
              decimal: false,
            ),
            spaceBetweenSelectorAndTextField: 0,
            // initialValue: PhoneNumber(isoCode: 'US'),
            isEnabled: enabled,
            selectorButtonOnErrorPadding: 0,
            initialValue: initialValue,
            inputDecoration: InputDecoration(
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
              hintText: hint ?? "Input Phone Number",
              errorStyle: TextStyle(fontSize: 0.sp),
              fillColor: Colors.transparent,
            ),
            textFieldController: controller,
            selectorConfig: const SelectorConfig(
              selectorType: PhoneInputSelectorType.DIALOG,
            ),
            ignoreBlank: true,
            selectorTextStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 16.sp,),
            autoValidateMode: AutovalidateMode.disabled,
            onSaved: (PhoneNumber number) => {onSaved!(number)},
            onSubmit: () => onSubmit!(),
            validator: validator,
          ),
        ),
        if(isError)...[
          5.sp.sbH,
          Padding(
            padding: 16.sp.padL,
            child: AppText(
              "Invalid Phone Number",
              style: TextStyle(
                color: Theme.of(context).inputDecorationTheme.errorStyle?.color,
                fontSize: 13.33.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        ]
      ],
    );
  }
}

class NewDropDownSelect extends StatelessWidget {
  final String? hintText;
  final String? hint;
  final double? height;
  final double? textSize;
  final Color? hintColor;
  final Color? fillColor;
  final bool useBorder;
  final Widget? prefix;
  final String? value;
  final EdgeInsetsGeometry? contentPadding;
  final List<String>? items;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String? value)? onChanged;
  const NewDropDownSelect({super.key,
    this.hintText,
    this.hint,
    this.value,
    this.items,
    this.onChanged, this.validator, this.inputFormatters, this.height,
    this.textSize, this.hintColor, this.prefix,
    this.contentPadding, this.fillColor, this.useBorder = true
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        hintText != null
            ? Column(
          children: [
            AppText(
              hintText ?? "",
              size: textSize ?? 15.sp,
              color :hintColor ?? Theme.of(context).textTheme.bodyMedium?.color,
              // isBold: true,
              align: TextAlign.start,
              weight: FontWeight.w500,
            ),
            5.0.sbH,
          ],
        )
            : 0.0.sbH,
        Container(
          alignment: Alignment.centerLeft,
          child: DropdownButtonFormField(
            borderRadius: BorderRadius.circular(12),
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 16.sp, fontFamily: 'Aileron'),
            icon: const Icon(Icons.keyboard_arrow_down),
            value: value,
            items: items
                ?.map((e) => DropdownMenuItem(
              value: e,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      e,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      softWrap: false,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 16.sp, fontFamily: 'Aileron'),
                    ),
                  ),
                ],
              ),
            ))
                .toList(),
            onChanged: onChanged,
            isExpanded: true,
            dropdownColor: Theme.of(context).cardColor,
            validator: validator,
            decoration: InputDecoration(
              errorMaxLines: 3,
              border: InputBorder.none,
              isDense: true,
              hintText: hint,
              prefix: prefix,
              filled: true,
              fillColor: fillColor,
              contentPadding: contentPadding,
            ),
          ),
        )
      ],
    );
  }
}


class LanguageDropDown extends StatelessWidget {
  final String? hint;
  final double? height;
  final double? textSize;
  final Color? hintColor;
  final Color? fillColor;
  final bool useBorder;
  final Widget? prefix;
  final String? value;
  final EdgeInsetsGeometry? contentPadding;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String? value)? onChanged;
  const LanguageDropDown({super.key,
    this.hint,
    this.value,
    this.onChanged, this.validator, this.inputFormatters, this.height,
    this.textSize, this.hintColor, this.prefix,
    this.contentPadding, this.fillColor, this.useBorder = true
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 37.h,
      child: DropdownButtonFormField<String>(
        borderRadius: BorderRadius.circular(8.r),
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 12.sp),
        icon: const Icon(Icons.keyboard_arrow_down),
        value: localeService.language,
        items: locales.map((e) => DropdownMenuItem(
          value: e.languageCode,
          child: Row(
            children: [
              Expanded(
                child: Text(
                  e.languageCode == "en"? LocaleData.english.convertString(): "",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  softWrap: false,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 12.sp, color: Colors.white, fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        ))
            .toList(),
        onChanged: onChanged,
        isExpanded: true,
        dropdownColor: Theme.of(context).cardColor,
        validator: validator,
        decoration: InputDecoration(
          errorMaxLines: 3,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 1.5.sp),
            borderRadius: BorderRadius.circular(8.r)
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 1.5.sp),
            borderRadius: BorderRadius.circular(8.r)
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 1.5.sp),
            borderRadius: BorderRadius.circular(8.r)
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 1.5.sp),
            borderRadius: BorderRadius.circular(8.r)
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 1.5.sp),
            borderRadius: BorderRadius.circular(8.r)
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 1.5.sp),
            borderRadius: BorderRadius.circular(8.r)
          ),
          // border: OutlineInputBorder(
          //   borderSide: BorderSide(color: Colors.white, width: 1.sp),
          //   borderRadius: BorderRadius.circular(8.r)
          // ),
          prefixIconConstraints: BoxConstraints.tight(Size(20.sp, 20.sp)),
          prefixIcon: Padding(
            padding: 5.sp.padL,
            child: SvgBuilder(
              Assets.svg.globe,
              size: 18.sp,
              color: Colors.white,
            ),
          ),
          isDense: true,
          hintText: hint,
          filled: true,
          fillColor: fillColor,
          contentPadding: contentPadding,
        ),
      ),
    );
  }
}

class TextArea extends StatelessWidget {
  final List<TextInputFormatter>? inputFormatters;
  final AutovalidateMode? autovalidateMode;
  final TextAlign? textAlign;
  final TextInputType? keyBoardType;
  final String? Function(String? val)? validationCallback;
  final void Function()? onEdittingComplete;
  final String? formError;
  final String? label;
  final String? hint;
  final String? hintText;
  final FocusNode? focusnode;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? obscureText;
  final Function()? clearForm;
  final String? Function(String?)? validator;
  final Function()? onTap;
  final Function(String)? onChanged;
  final int? maxLength;
  final bool? enabled;
  final InputBorder? border;
  final Color? fillColor;
  final Color? hintColor;
  final EdgeInsetsGeometry? contentPadding;
  final TextInputAction? textInputAction;
  final bool? showCursor;
  final bool readOnly;
  final Widget? labelRightItem;
  final TextStyle? labelStyle;
  final int? minLines;
  final int? maxLines;

  const TextArea({super.key,
    this.autovalidateMode,
    this.inputFormatters,
    this.textAlign,
    this.keyBoardType,
    this.validator,
    this.onEdittingComplete,
    this.validationCallback,
    this.hintText,
    this.label,
    this.hint,
    this.formError,
    this.focusnode,
    this.controller,
    this.clearForm,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText,
    this.onChanged,
    this.onTap,
    this.maxLength,
    this.minLines,
    this.maxLines,
    this.enabled = true,
    this.border,
    this.fillColor,
    this.hintColor,
    this.showCursor,
    this.readOnly = false,
    this.labelRightItem,
    this.labelStyle,
    this.contentPadding,
    this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        hintText == null ?0.0.sbH:AppText(
          hintText??"",
          size: 15.sp,
          align: TextAlign.start,
          weight: FontWeight.w500,
          color :hintColor ?? Theme.of(context).textTheme.bodyMedium?.color,
        ),
        hintText == null ? 0.0.sbH:8.0.sbH,
        TextFormField(
          showCursor: showCursor,
          readOnly: readOnly,
          maxLength: maxLength,
          enabled: enabled,
          onTap: onTap,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 16.sp, fontFamily: 'Aileron'),
          minLines: minLines,
          maxLines: maxLines,
          focusNode: focusnode,
          controller: controller,
          textInputAction: textInputAction?? TextInputAction.next,
          decoration: InputDecoration(
            counterText: null,
            hintText: hint,
            fillColor: fillColor,
            errorText: formError,
            labelText: label,
            suffixIcon: suffixIcon,
            prefix: prefixIcon,
            contentPadding: contentPadding,
            border: border,
            focusedBorder: border,
            focusedErrorBorder: border,
            enabledBorder: border,
            errorBorder: border,
            isDense: true
          ),
          textAlign: textAlign ?? TextAlign.start,
          inputFormatters: inputFormatters,
          keyboardType: keyBoardType,
          onChanged: onChanged,

          validator: validator,
          onEditingComplete: onEdittingComplete,
          obscureText: obscureText ?? false,
        ),
      ],
    );
  }
}