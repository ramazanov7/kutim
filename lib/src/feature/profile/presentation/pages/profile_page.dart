import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:kutim/src/core/constant/constants.dart';
import 'package:kutim/src/core/gen/assets.gen.dart';
import 'package:kutim/src/core/presentation/widgets/buttons/custom_button.dart';
import 'package:kutim/src/core/theme/resources.dart';
import 'package:kutim/src/core/utils/extensions/context_extension.dart';
import 'package:kutim/src/feature/app/bloc/app_bloc.dart';
import 'package:kutim/src/feature/app/presentation/widgets/custom_appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:kutim/src/feature/app/router/app_router.dart';
import 'package:kutim/src/feature/profile/presentation/widget/profile_avatar.dart';
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
        // resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Gap(70),
            const Padding(
              padding: EdgeInsets.only(left: 27),
              child: Text(
                'Profile',
                style: AppTextStyles.fs20w500,
              ),
            ),
            const Gap(40),

            ///
            /// <-- `profile avatar, name, email` -->
            ///
            ///
            Container(
              height: 180,
              margin: const EdgeInsets.symmetric(horizontal: 43),
              padding: const EdgeInsets.only(top: 15, left: 23, right: 23),
              decoration: const BoxDecoration(
                color: AppColors.backgroundColor2,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(217, 217, 217, 1),
                    blurRadius: 4,
                    spreadRadius: 0,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.router.push(DetailAvatarRoute(image: NOT_FOUND_IMAGE));
                        },
                        child: const ProfileAvatarWithRating(
                          imageAva: NOT_FOUND_IMAGE,
                        ),
                      ),
                      const Gap(22),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Amir Temir',
                            style: AppTextStyles.fs18w500.copyWith(
                              fontWeight: FontWeight.w600,
                              color: AppColors.text,
                              height: 1.2,
                            ),
                          ),
                          const Gap(8),
                          Text(
                            'amir@gmail.com',
                            style: AppTextStyles.fs14w400.copyWith(
                              color: AppColors.text,
                              height: 1.2,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Gap(20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: CustomButton(
                        height: 30,
                        onPressed: () {
                          context.router.push(OnboardingRoute(
                            onGoAuthPressed: () {
                              context.router.push(const LoginRoute());
                            },
                          ));
                        },
                        style: CustomButtonStyles.mainButtonStyle(context, padding: EdgeInsets.zero),
                        child: Text(
                          'Edit Account',
                          style: AppTextStyles.fs14w400.copyWith(color: Colors.white),
                        )),
                  ),
                ],
              ),
            ),
            const Gap(40),
            ProfileItem(
              title: 'Skin Type',
              icon: Assets.icons.person.path,
              onTap: () {},
            ),
            ProfileItem(
              title: 'Help',
              icon: Assets.icons.help.path,
              onTap: () {},
            ),
            ProfileItem(
              title: 'Logout',
              icon: Assets.icons.help.path,
              onTap: () {},
            ),
            ProfileItem(
              title: 'Delete account',
              icon: Assets.icons.delete.path,
              onTap: () {},
            ),
            // ProfileItem(
            //   title: 'Help',
            //   icon: '',
            //   onTap: () {},
            // ),
            // ProfileItem(
            //   title: 'Delete account',
            //   icon: '',
            //   onTap: () {},
            // ),
            // ProfileItem(
            //   title: 'Logout',
            //   icon: '',
            //   onTap: () {
            //     BlocProvider.of<AppBloc>(context).add(const AppEvent.exiting());
            //     setState(() {});
            //   },
            // ),

            // const Spacer(),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 27),
            //   child: CustomButton(
            //       onPressed: () {
            //         context.router.push(OnboardingRoute(
            //           onGoAuthPressed: () {
            //             context.router.push(const LoginRoute());
            //           },
            //         ));
            //       },
            //       style: CustomButtonStyles.mainButtonStyle(context),
            //       child: const Text('Show Authorization')),
            // )
          ],
        ),
      ),
    );
  }
}

class ProfileItem extends StatelessWidget {
  const ProfileItem({super.key, required this.title, required this.icon, this.onTap});

  final String title;
  final String icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 26, right: 26, top: 12, bottom: 12),
        child: Row(
          children: [
            SvgPicture.asset(icon),
            const Gap(16),
            Text(
              title,
              style: AppTextStyles.fs14w400.copyWith(
                color: AppColors.text,
                height: 1.2,
              ),
            ),
            const Spacer(),
            const Icon(Icons.chevron_right),
          ],
        ),
      ),
    );
  }
}
