import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.router.maybePop();
      },
      child: const Icon(Icons.arrow_back),
      // child: SvgPicture.asset(
      //   Assets.icons.backButton.path,
      //   height: 24,
      //   width: 24,
      // ),
    );
  }
}
