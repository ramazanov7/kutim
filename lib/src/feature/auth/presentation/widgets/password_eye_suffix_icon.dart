import 'package:kutim/src/core/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kutim/src/core/theme/resources.dart';

class PasswordEyeSuffixIcon extends StatelessWidget {
  const PasswordEyeSuffixIcon({
    super.key,
    required this.valueListenable,
    this.hasError = true,
  });
  final ValueNotifier<bool> valueListenable;
  final bool hasError;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        valueListenable.value = !valueListenable.value;
      },
      child: Padding(
          padding: const EdgeInsets.only(right: 16, left: 10),
          child: SvgPicture.asset(
            height: 18,
            Assets.icons.clear.path,
            colorFilter: hasError ? const ColorFilter.mode(AppColors.red, BlendMode.srcIn) : null,
          )),
    );
  }
}
