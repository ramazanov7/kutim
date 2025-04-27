// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:kutim/src/core/theme/resources.dart';

class ProfileItem extends StatelessWidget {
  ProfileItem({
    super.key,
    this.secTitle,
    required this.title,
    required this.icon,
    this.onTap,
    this.textStyle,
  });

  final String title;
  String? secTitle;
  final String icon;
  final void Function()? onTap;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 26, right: 26, top: 12, bottom: 12),
        child: Row(
          children: [
            title == 'Logout'
                ? Transform.rotate(
                    angle: -90 * 3.1415927 / 180,
                    child: SvgPicture.asset(icon),
                  )
                : SvgPicture.asset(icon),
            const Gap(16),
            Text(
              title,
              style: textStyle ??
                  AppTextStyles.fs14w400.copyWith(color: AppColors.text, height: 1.2, letterSpacing: -0.41),
            ),
            const Spacer(),
            if (secTitle != "")
              Text(
                secTitle ?? "",
                style: AppTextStyles.fs13w400.copyWith(color: AppColors.greyTextColor),
              ),
            const Icon(Icons.chevron_right),
          ],
        ),
      ),
    );
  }
}
