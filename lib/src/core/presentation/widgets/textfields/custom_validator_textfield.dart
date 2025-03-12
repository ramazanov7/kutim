import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kutim/src/core/presentation/widgets/error/error_text_widget.dart';
import 'package:kutim/src/core/theme/resources.dart';
import 'package:kutim/src/feature/auth/presentation/widgets/password_eye_suffix_icon.dart';

class CustomValidatorTextfield extends StatelessWidget {
  const CustomValidatorTextfield({
    super.key,
    required this.controller,
    this.validator,
    required this.valueListenable,
    this.onChanged,
    this.hintText,
    this.obscureText,
    this.inputFormatters,
    this.suffixIcon,
    this.onTap,
    this.autofocus = false,
    this.readOnly = false,
    this.keyboardType,
    this.focusNode,
    this.style = AppTextStyles.fs16w400,
    this.label,
    this.floatingLabelStyle,
  });

  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final ValueNotifier<String?> valueListenable;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final String? hintText;
  final ValueNotifier<bool>? obscureText;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffixIcon;
  final bool autofocus;
  final bool readOnly;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final TextStyle? style;
  final Widget? label;
  final TextStyle? floatingLabelStyle;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: valueListenable,
      builder: (context, v, c) {
        return SizedBox(
          height: 48,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: TextFormField(
                  readOnly: readOnly,
                  onTap: onTap,
                  autofocus: autofocus,
                  autocorrect: false,
                  focusNode: focusNode,
                  obscureText: obscureText?.value ?? false,
                  obscuringCharacter: '●',
                  style: style,
                  inputFormatters: inputFormatters,
                  textAlignVertical: TextAlignVertical.center,
                  keyboardType: keyboardType,
                  controller: controller,
                  onChanged: onChanged,
                  cursorHeight: 20,
                  cursorColor: AppColors.barrierColor,
                  validator: validator,
                  decoration: InputDecoration(
                    errorBorder:
                        OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(12)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: AppColors.textFieldBorder)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: AppColors.textFieldBorder)),
                    fillColor: AppColors.white,
                    suffixIcon: obscureText != null
                        ? PasswordEyeSuffixIcon(
                            valueListenable: obscureText!,
                            hasError: valueListenable.value != null,
                          )
                        : suffixIcon,
                    hintText: hintText,
                    filled: true,
                    label: label,
                    floatingLabelStyle: floatingLabelStyle,
                    hintStyle: AppTextStyles.fs16w400.copyWith(color: AppColors.base500),
                    errorStyle: const TextStyle(
                      height: 0,
                      fontSize: 0,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: ErrorTextWidget(
                  text: valueListenable.value,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
