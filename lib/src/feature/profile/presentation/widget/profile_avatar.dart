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
            height: 80,
            width: 80,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(100)),
              child: Image.network(
                imageAva,
                fit: BoxFit.cover,
                // loadingBuilder: ImageUtil.loadingBuilder,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
