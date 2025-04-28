import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:kutim/src/core/constant/constants.dart';
import 'package:kutim/src/core/gen/assets.gen.dart';
import 'package:kutim/src/core/presentation/widgets/buttons/custom_button.dart';
import 'package:kutim/src/core/presentation/widgets/dialog/toaster.dart';
import 'package:kutim/src/core/presentation/widgets/other/custom_loading_overlay_widget.dart';
import 'package:kutim/src/core/theme/resources.dart';
import 'package:flutter/material.dart';
import 'package:kutim/src/core/utils/extensions/context_extension.dart';
import 'package:kutim/src/feature/app/bloc/app_bloc.dart';
import 'package:kutim/src/feature/app/router/app_router.dart';
import 'package:kutim/src/feature/profile/bloc/profile_bloc.dart';
import 'package:kutim/src/feature/profile/presentation/widget/logout_bottom_sheet.dart';
import 'package:kutim/src/feature/profile/presentation/widget/profile_avatar.dart';
import 'package:kutim/src/feature/profile/presentation/widget/profile_item_widget.dart';
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
  void initState() {
    BlocProvider.of<ProfileBLoC>(context).add(const ProfileEvent.getProfile());
    super.initState();
  }

  String? selectedSecTitle = "Normal";

  @override
  Widget build(BuildContext context) {
    // log('${context.appBloc.isAuthenticated}', name: 'profile page');
    return LoaderOverlay(
      overlayColor: AppColors.barrierColor,
      overlayWidgetBuilder: (progress) => const CustomLoadingOverlayWidget(),
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.white,
        body: BlocConsumer<ProfileBLoC, ProfileState>(
          listener: (context, state) {
            state.maybeWhen(
              error: (message) {
                context.loaderOverlay.hide();
                Toaster.showErrorTopShortToast(context, message);
              },
              loading: () {
                context.loaderOverlay.show();
                Future<void>.delayed(
                  const Duration(milliseconds: 300),
                );
              },
              exited: (message) {
                Toaster.showTopShortToast(context, message: message);
                context.router.popUntil((route) => route.settings.name == LauncherRoute.name);
                BlocProvider.of<AppBloc>(context).add(const AppEvent.exiting());
              },
              orElse: () {
                context.loaderOverlay.hide();
              },
            );
          },
          builder: (context, state) {
            return state.maybeWhen(
                orElse: () => Container(),
                loaded: (user) => Column(
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
                          height: context.repository.authRepository.user?.fullName == 'admin' ? 130 : 180,
                          margin: const EdgeInsets.symmetric(horizontal: 23),
                          padding: const EdgeInsets.only(top: 15, left: 16, right: 16),
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
                                    child: ProfileAvatarWithRating(
                                      imageAva: user.avatar ?? NOT_FOUND_IMAGE,
                                    ),
                                  ),
                                  const Gap(12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${user.fullName}',
                                          style: AppTextStyles.fs18w500.copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.text,
                                            height: 1.2,
                                          ),
                                        ),
                                        const Gap(8),
                                        Text(
                                          '${user.email}',
                                          style: AppTextStyles.fs14w400.copyWith(
                                            color: AppColors.text,
                                            height: 1.2,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const Gap(20),
                              if (context.repository.authRepository.user?.fullName != 'admin')
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 40),
                                  child: CustomButton(
                                      height: 30,
                                      onPressed: () {
                                        context.router.push(EditProfileRoute(user: user));
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
                          title: 'Skin type',
                          icon: Assets.icons.person.path,
                          onTap: () async {
                            // context.router.push(const SkinProfileRoute());
                            final secTitle = await context.router.push(
                                // SkinTypeRoute(selectedSecTitle: selectedSecTitle ?? ""),
                                InformationRoute(skinType: context.repository.authRepository.skinType ?? ''));
                            if (secTitle != null) {
                              setState(() {
                                selectedSecTitle = secTitle as String?;
                              });
                            }
                            // SkinTypeRoute(selectedSecTitle: selectedSecTitle ?? "");
                          },
                        ),
                        // ProfileItem(
                        //   title: 'Settings',
                        //   icon: Assets.icons.settings.path,
                        //   onTap: () {
                        //     context.router.push(SettingsRoute());
                        //   },
                        // ),
                        // ProfileItem(
                        //   title: 'Privacy Settings',
                        //   icon: Assets.icons.privacySettings.path,
                        //   onTap: () {
                        //     context.router.push(const PrivacySettingsRoute());
                        //   },
                        // ),
                        ProfileItem(
                          title: 'FAQs',
                          icon: Assets.icons.icFaqs.path,
                          onTap: () {
                            context.router.push(const FaqsRoute());
                          },
                        ),
                        ProfileItem(
                          title: 'About',
                          icon: Assets.icons.icAbout.path,
                          onTap: () {
                            context.router.push(const AboutRoute());
                          },
                        ),
                        // ProfileItem(
                        //   title: 'Help',
                        //   icon: Assets.icons.help.path,
                        //   onTap: () {
                        //     context.router.push(const HelpRoute());
                        //   },
                        // ),
                        ProfileItem(
                          title: 'Logout',
                          icon: Assets.icons.icExportData.path,
                          onTap: () {
                            BlocProvider.of<AppBloc>(context).add(const AppEvent.exiting());
                            setState(() {});
                          },
                        ),
                        ProfileItem(
                          title: 'Delete account',
                          icon: Assets.icons.delete.path,
                          onTap: () {
                            LogoutBottomSheet.show(
                              context,
                              isDeleteAccount: true,
                              onPressed: () {
                                BlocProvider.of<ProfileBLoC>(context).add(
                                  const ProfileEvent.deleteAccount(),
                                );
                                context.router.maybePop();
                              },
                            );
                          },
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
                    ));
          },
        ),
      ),
    );
  }
}
