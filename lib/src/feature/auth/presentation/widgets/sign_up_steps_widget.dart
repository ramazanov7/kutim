import 'package:flutter/material.dart';
import 'package:kutim/src/core/theme/resources.dart';
import 'package:kutim/src/core/utils/extensions/context_extension.dart';

class SignUpStepsWidget extends StatelessWidget {
  const SignUpStepsWidget({
    super.key,
    required this.activeIndex,
    this.length = 3,
  });
  final int activeIndex;
  final int length;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        length,
        (index) => Expanded(
          child: Container(
            margin: index == length - 1 ? EdgeInsets.zero : const EdgeInsets.only(right: 2),
            height: 4.3,
            width: (context.screenSize.width - 32 - (length * 2)) / length,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(35)),
              color: index <= activeIndex - 1 ? AppColors.mainColor : AppColors.line2,
            ),
          ),
        ),
      ),
    );
  }
}
