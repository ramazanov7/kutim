import 'package:flutter/material.dart';
import 'package:kutim/src/core/theme/resources.dart';

class SkinWidgetCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final bool selected;
  final void Function()? onTap;
  const SkinWidgetCard({super.key, required this.title, required this.imagePath, this.onTap, required this.selected});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: onTap,
      child: Container(
        width: 156,
        decoration: BoxDecoration(
          color: selected ? AppColors.mainColor : AppColors.mainColor.withOpacity(0.5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: AppTextStyles.fs16w400.copyWith(color: AppColors.white),
              ),
              Image.asset(
                imagePath,
                height: 40,
                width: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
