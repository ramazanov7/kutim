import 'package:auto_route/auto_route.dart';
import 'package:gap/gap.dart';
import 'package:kutim/src/core/presentation/widgets/buttons/custom_button.dart';
import 'package:kutim/src/core/theme/resources.dart';
import 'package:kutim/src/core/utils/extensions/context_extension.dart';
import 'package:kutim/src/feature/app/presentation/widgets/custom_appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:kutim/src/feature/app/router/app_router.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

@RoutePage()
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final RefreshController _refreshController = RefreshController();

  int? selectedLanguageId;

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // log('${context.appBloc.isAuthenticated}', name: 'profile page');
    return LoaderOverlay(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // const Gap(23),
            // const Padding(
            //   padding: EdgeInsets.only(left: 27),
            //   child: Text(
            //     'Profile',
            //     style: AppTextStyles.fs16w500,
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 27),
              child: CustomButton(
                  onPressed: () {
                    context.router.push(OnboardingRoute(
                      onGoAuthPressed: () {
                        context.router.push(const LoginRoute());
                      },
                    ));
                  },
                  style: CustomButtonStyles.mainButtonStyle(context),
                  child: const Text('Show Authorization')),
            )
          ],
        ),
      ),
    );
  }
}
