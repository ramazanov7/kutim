import 'package:kutim/src/core/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextfieldClearIcon extends StatelessWidget {
  final void Function()? onTap;
  const CustomTextfieldClearIcon({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: SizedBox.square(
        dimension: 20,
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(100),
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(100),
            // child: Center(child: SvgPicture.asset(Assets.icons.closeSearched.path)),
          ),
        ),
      ),
    );
  }
}
