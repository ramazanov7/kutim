import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kutim/src/core/theme/resources.dart';

class ProfileAvatarWithRating extends StatelessWidget {
  final String imageAva;

  const ProfileAvatarWithRating({
    super.key,
    required this.imageAva,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Profile avatar
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            height: 90,
            width: 90,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.mainColor, width: 3),
              // boxShadow: [
              //   BoxShadow(
              //     color: Colors.black.withOpacity(0.1),
              //     blurRadius: 6,
              //   ),
              // ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(3),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(100)),
                child: Image.network(
                  imageAva,
                  fit: BoxFit.cover,
                  // loadingBuilder: ImageUtil.loadingBuilder,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
