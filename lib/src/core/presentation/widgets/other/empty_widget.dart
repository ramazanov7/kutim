import 'package:flutter/material.dart';

import 'package:kutim/src/core/theme/resources.dart';

class EmptyWidget extends StatelessWidget {
  final String title;
  final String image;
  const EmptyWidget({
    super.key,
    required this.title,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Image.asset(
            image,
            // fit: BoxFit.cover,
            height: 200,
          ),
          Text(
            title,
            style: AppTextStyles.fs20w500.copyWith(
              color: AppColors.text,
            ),
          ),
        ],
      ),
    );
  }
}
