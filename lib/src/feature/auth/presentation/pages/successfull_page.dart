import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:kutim/src/core/gen/assets.gen.dart';
import 'package:kutim/src/core/presentation/widgets/buttons/custom_button.dart';
import 'package:kutim/src/core/theme/resources.dart';
import 'package:kutim/src/feature/app/router/app_router.dart';

@RoutePage()
class SuccessfullPage extends StatelessWidget {
  const SuccessfullPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Gap(97),
            Container(
              height: 110,
              width: 110,
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 37),
              decoration: BoxDecoration(
                  color: AppColors.mainColor.withOpacity(0.46),
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.mainColor)),
              child: SvgPicture.asset(Assets.icons.right.path),
            ),
            const Gap(18),
            Text(
              'Successful',
              style: AppTextStyles.fs20w500.copyWith(letterSpacing: -0.41),
            ),
            const Gap(17),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 33),
              child: Text(
                'Congratulations! Your password has been changed. Click continue to login. ',
                textAlign: TextAlign.center,
                style: AppTextStyles.fs14w500.copyWith(color: AppColors.textFieldBorder, letterSpacing: -0.41),
              ),
            ),
            const Gap(40),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: CustomButton(
                  onPressed: () {
                    context.router.push(const MainRoute());
                  },
                  style: CustomButtonStyles.mainButtonStyle(context, elevation: 5),
                  child: const Text(
                    'Continue',
                    style: AppTextStyles.fs16w500,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
