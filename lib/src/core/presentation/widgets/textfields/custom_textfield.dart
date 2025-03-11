import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kutim/src/core/theme/resources.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.controller,
    this.onChanged,
    this.hintText,
    this.height,
    this.width,
    this.keyboardType,
    this.maxLines = 1,
    this.inputFormatters,
    this.validator,
    this.obscureText,
    this.suffixIcon,
    this.prefixIcon,
    this.onFieldSubmitted,
    this.maxLength,
    this.onEditingComplete,
    this.suffixIconConstraints,
    this.textAlign = TextAlign.start,
    this.suffixText,
    this.textStyle,
    this.hintStyle,
    this.borderR,
    this.label,
    this.autofocus = false,
    this.focusNode,
    this.prefix,
    this.prefixIconConstraints,
    this.contentPadding,
    this.textInputAction,
    this.obscuringCharacter = '●',
    this.errorMaxLines,
    this.errorStyle,
    this.minLines,
    this.counterText,
    this.onTap,
    this.readOnly = false,
    this.enabled,
    this.scrollPadding = const EdgeInsets.all(20),
    this.showMaxLengthLabel = false,
    this.focusedBorder,
    this.enabledBorder,
    this.fillColor,
    this.onTapPrefixIcon,
    this.onTapSuffixIcon,
    this.prefixIconWidget,
    this.isEmptyImage = true,
  });
  final bool? obscureText;
  final Widget? suffixIcon;
  final String? prefixIcon;
  final Widget? prefix;
  final Widget? prefixIconWidget;
  final TextStyle? textStyle;
  final TextEditingController? controller;
  final String? Function(String? text)? validator;
  final void Function(String text)? onChanged;
  final String? hintText;
  final TextStyle? hintStyle;
  final double? height;
  final double? width;
  final int? maxLines;
  final int? minLines;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final void Function(String text)? onFieldSubmitted;
  final int? maxLength;
  final TextAlign textAlign;
  final BoxConstraints? suffixIconConstraints;
  final BoxConstraints? prefixIconConstraints;
  final String? suffixText;
  final VoidCallback? onEditingComplete;
  final BorderRadius? borderR;
  final Widget? label;
  final bool autofocus;
  final FocusNode? focusNode;
  final EdgeInsetsGeometry? contentPadding;
  final TextInputAction? textInputAction;
  final String obscuringCharacter;
  final int? errorMaxLines;
  final TextStyle? errorStyle;
  final String? counterText;
  final VoidCallback? onTap;
  final bool readOnly;
  final bool? enabled;
  final EdgeInsets scrollPadding;
  final bool showMaxLengthLabel;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final Color? fillColor;
  final void Function()? onTapPrefixIcon;
  final void Function()? onTapSuffixIcon;
  final bool? isEmptyImage;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: height,
        width: width,
        child: Column(
          children: [
            Flexible(
              child: TextFormField(
                scrollPadding: scrollPadding,
                enabled: enabled,
                readOnly: readOnly,
                onTap: onTap,
                textInputAction: textInputAction,
                autofocus: autofocus,
                onEditingComplete: onEditingComplete,
                autocorrect: false,
                focusNode: focusNode,
                obscureText: obscureText ?? false,
                obscuringCharacter: obscuringCharacter,
                style: textStyle ?? AppTextStyles.fs16w400h1_6,
                inputFormatters: inputFormatters,
                textAlignVertical: TextAlignVertical.center,
                maxLines: maxLines,
                minLines: minLines,
                keyboardType: keyboardType,
                controller: controller,
                onChanged: onChanged,
                onFieldSubmitted: onFieldSubmitted,
                cursorHeight: 18,
                validator: validator,
                textAlign: textAlign,
                maxLength: maxLength,
                decoration: InputDecoration(
                  fillColor: fillColor,
                  border: OutlineInputBorder(
                    borderRadius: borderR ?? const BorderRadius.all(Radius.circular(16)),
                  ),
                  enabledBorder: enabledBorder,
                  focusedBorder: focusedBorder,
                  prefixIcon: prefixIconWidget,
                  // Container(
                  //   margin: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
                  //   child: GestureDetector(onTap: onTapPrefixIcon, child: SvgPicture.asset('$prefixIcon')),
                  // ),
                  prefix: prefix,
                  prefixIconConstraints: prefixIconConstraints,
                  suffixIcon: suffixIcon,
                  suffixText: suffixText,
                  counterText: showMaxLengthLabel ? counterText : '',
                  suffixIconConstraints: suffixIconConstraints,
                  label: label,
                  hintStyle: hintStyle,
                  contentPadding: contentPadding,
                  hintText: hintText,
                  errorMaxLines: errorMaxLines,
                  errorStyle: errorStyle,
                ),
              ),
            ),
            // if (isEmptyImage == false)
            //   Container(
            //     height: 40,
            //     width: 40,
            //     decoration: const BoxDecoration(
            //       color: Colors.black,
            //     ),
            //   )
          ],
        ),
      );
}
