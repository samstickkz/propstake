import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:propstake/app_theme/palette.dart';
import 'package:propstake/utils/extension_functions.dart';
import 'package:propstake/utils/widget_extensions.dart';

import '../app_theme/app_theme.dart';
import 'apptexts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final String? titleText;
  final List<Widget> actions;
  final Widget? leading;
  final double elevation;
  final PreferredSizeWidget? bottom;
  final bool centerTitle;
  final bool showProgressIndicator;
  final double? value;
  final Color? backgroundColor;
  final SystemUiOverlayStyle? systemUiOverlayStyle;
  final double? titleTextFontSize;
  final double? leadingWidth;
  final Function()? popBack;
  final VoidCallback? onBackPressed;

  CustomAppBar({
    super.key,
    this.title,
    this.actions = const [],
    this.leading,
    this.elevation = 0.0,
    this.bottom,
    this.centerTitle = false,
    this.showProgressIndicator = false,
    this.value,
    this.titleText,
    this.backgroundColor,
    this.systemUiOverlayStyle,
    this.titleTextFontSize,
    this.leadingWidth,
    this.onBackPressed,
    this.popBack,
  }) {
    if (showProgressIndicator) {
      assert(value != null);
    }
  }

  Widget _buildAppBar(BuildContext context) {
    final AppBarTheme appBarTheme = Theme.of(context).appBarTheme;
    return AppBar(
      title: title ??
          AppText(
              titleText ?? "",
              style: appBarTheme.titleTextStyle?.copyWith(
            fontSize: titleTextFontSize,
          ),
          ),
      centerTitle: centerTitle,
      forceMaterialTransparency: true,
      elevation: elevation,
      bottom: bottom,
      backgroundColor: backgroundColor ?? appBarTheme.backgroundColor,
      leading: leading ??
          IconButton(
            icon: Navigator.canPop(context) ? Icon(Icons.arrow_back_ios_rounded, color: stateColor12(isDark: isAppDark()),) : const SizedBox.shrink(),
            onPressed: () {
              if (Navigator.canPop(context)) {
                if (onBackPressed != null) {
                  onBackPressed!.call();
                } else {
                  context.pop();
                }
              }
            },
          ),
      leadingWidth: leadingWidth,
      actions: actions,
      systemOverlayStyle: systemUiOverlayStyle,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 18.0, left: 4),
      child: showProgressIndicator
          ? Column(
              children: [
                _buildAppBar(context),
                if (showProgressIndicator)
                  LinearProgressIndicator(
                    minHeight: 5,
                    value: value,
                  )
              ],
            )
          : _buildAppBar(context),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(showProgressIndicator ? 80.0 : 48.0);
}
