import 'package:flutter/material.dart';
import 'package:kutim/src/core/theme/resources.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.onPressed,
    required this.style,
    required this.child,
    super.key,
    this.width,
    this.height,
    this.text = '',
    this.isExpanded = true,
    this.onLongPress,
    this.allowTapButton,
    this.allowStyle,
  });
  final Widget? child;
  final VoidCallback? onPressed;
  final ButtonStyle? style;
  final ButtonStyle? allowStyle;
  final double? width;
  final double? height;
  final String text;
  final bool isExpanded;
  final VoidCallback? onLongPress;
  final ValueNotifier<bool>? allowTapButton;

  @override
  Widget build(BuildContext context) {
    Widget getWidget(bool allowTap) => SizedBox(
          width: width ?? (isExpanded ? double.infinity : null),
          height: height,
          child: ElevatedButton(
            onPressed: allowTap ? onPressed : null,
            onLongPress: onLongPress,
            style: style,
            child: child ??
                Text(
                  text,
                  style: allowTap ? AppTextStyles.fs16w600 : AppTextStyles.fs16w500.copyWith(color: Colors.black),
                  textAlign: TextAlign.center,
                ),
          ),
        );

    if (allowTapButton != null) {
      return ValueListenableBuilder(
        valueListenable: allowTapButton!,
        builder: (context, v, c) => getWidget(v),
      );
    }

    return getWidget(true);
  }
}

class CustomButtonStyles {
  const CustomButtonStyles._();

  static ButtonStyle mainButtonStyle(
    BuildContext context, {
    double elevation = 0,
    double radius = 16,
    double height = 51,
    Color? backgroundColor = AppColors.mainColor,
    Color? foregroundColor = Colors.white,
    Color? disabledForegroundColor = Colors.white,
    Color? disabledBackgroundColor,
    Color? shadowColor,
    EdgeInsetsGeometry? padding,
    BorderSide side = BorderSide.none,
  }) =>
      ElevatedButton.styleFrom(
        fixedSize: Size.fromHeight(height),
        foregroundColor: foregroundColor,
        backgroundColor: backgroundColor,
        disabledForegroundColor: disabledForegroundColor,
        // disabledBackgroundColor: disabledBackgroundColor ?? context.theme.mainColor.withOpacity(0.4),
        elevation: elevation,
        // shadowColor: shadowColor ?? context.theme.background50,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          side: side,
        ),
        padding: padding,
      );

  static ButtonStyle primaryButtonStyle(
    BuildContext context, {
    double elevation = 0,
    double radius = 16,
    double height = 51,
    Color? backgroundColor = AppColors.white,
    Color? foregroundColor = AppColors.black,
    Color? disabledForegroundColor = Colors.white,
    Color? disabledBackgroundColor,
    Color? shadowColor,
    EdgeInsetsGeometry? padding,
    BorderSide side = const BorderSide(color: AppColors.mainColor),
  }) =>
      ElevatedButton.styleFrom(
        fixedSize: Size.fromHeight(height),
        foregroundColor: foregroundColor,
        backgroundColor: backgroundColor,
        // backgroundColor ?? AppColors.mainColor,
        disabledForegroundColor: disabledForegroundColor,
        // disabledBackgroundColor: disabledBackgroundColor ?? context.theme.mainColor.withOpacity(0.4),
        // elevation: elevation,
        shadowColor: Colors.transparent,
        // shadowColor: shadowColor ?? context.theme.background50,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          side: side,
        ),
        padding: padding,
      );

  static ButtonStyle greyButtonStyle(
    BuildContext context, {
    double elevation = 0,
    double radius = 16,
    double height = 51,
    Color? backgroundColor = AppColors.mainMuteColor,
    Color? foregroundColor = Colors.white,
    Color? disabledForegroundColor = Colors.white,
    Color? disabledBackgroundColor,
    Color? shadowColor,
    EdgeInsetsGeometry? padding,
    BorderSide side = BorderSide.none,
  }) =>
      ElevatedButton.styleFrom(
        fixedSize: Size.fromHeight(height),
        foregroundColor: foregroundColor,
        backgroundColor: backgroundColor,
        disabledForegroundColor: disabledForegroundColor,
        // disabledBackgroundColor: disabledBackgroundColor ?? context.theme.mainColor.withOpacity(0.4),
        elevation: elevation,
        // shadowColor: shadowColor ?? context.theme.background50,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          side: side,
        ),
        padding: padding,
      );
}
