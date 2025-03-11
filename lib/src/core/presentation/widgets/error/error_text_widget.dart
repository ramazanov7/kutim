import 'package:flutter/material.dart';
import 'package:kutim/src/core/theme/resources.dart';

class ErrorTextWidget extends StatelessWidget {
  const ErrorTextWidget({
    super.key,
    this.text,
  });
  final String? text;

  @override
  Widget build(BuildContext context) {
    if (text == null) return const SizedBox();

    return Text(
      text!,
      style: AppTextStyles.fs14w400.copyWith(
        color: AppColors.red,
      ),
    );
  }
}
