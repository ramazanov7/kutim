import 'package:auto_route/auto_route.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kutim/src/feature/main/model/scan_dto.dart';
import 'package:kutim/src/feature/main/presentation/pages/application_page.dart';
import 'package:kutim/src/feature/auth/presentation/pages/onboarding_page.dart';
import 'package:kutim/src/feature/auth/presentation/pages/successfull_page.dart';
import 'package:kutim/src/feature/auto/search_page.dart';
import 'package:flutter/material.dart';
import 'package:kutim/src/feature/app/presentation/pages/launcher.dart';
import 'package:kutim/src/feature/app/presentation/pages/temp_page.dart';
import 'package:kutim/src/feature/auth/models/user_dto.dart';
import 'package:kutim/src/feature/auth/presentation/auth.dart';
import 'package:kutim/src/feature/main/presentation/main.dart';
import 'package:kutim/src/feature/main/presentation/pages/daily_routine_page.dart';
import 'package:kutim/src/feature/main/presentation/pages/information_page.dart';
import 'package:kutim/src/feature/main/presentation/pages/scan_result_page.dart';
import 'package:kutim/src/feature/profile/presentation/pages/about_page.dart';
import 'package:kutim/src/feature/profile/presentation/pages/concerns_page.dart';
import 'package:kutim/src/feature/profile/presentation/pages/contact_support_page.dart';
import 'package:kutim/src/feature/profile/presentation/pages/faqs_page.dart';
import 'package:kutim/src/feature/profile/presentation/pages/help_page.dart';
import 'package:kutim/src/feature/profile/presentation/pages/privacy_settings_page.dart';
import 'package:kutim/src/feature/profile/presentation/pages/settings_page.dart';
import 'package:kutim/src/feature/profile/presentation/pages/skin_profile_page.dart';
import 'package:kutim/src/feature/profile/presentation/pages/skin_type_page.dart';
import 'package:kutim/src/feature/profile/presentation/profile.dart';
import 'package:kutim/src/feature/profile/presentation/widget/detail_avatar_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material(); //.cupertino, .adaptive ..etc

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: TempRoute.page),
        // AutoRoute(
        //   initial: true,
        //   page: OnboardingRoute.page,
        // ),

        /// Root
        AutoRoute(
          page: LauncherRoute.page,
          initial: true,
          children: [
            AutoRoute(
              page: BaseMainTab.page,
              children: [
                AutoRoute(
                  page: MainRoute.page,
                  initial: true,
                ),
              ],
            ),
            AutoRoute(
              page: BaseSearchTab.page,
              children: [
                AutoRoute(
                  page: SearchRoute.page,
                  initial: true,
                ),
              ],
            ),
            AutoRoute(
              page: BaseApplicationTab.page,
              children: [
                AutoRoute(
                  page: ApplicationRoute.page,
                  initial: true,
                  // children: const [],
                ),
              ],
            ),
            AutoRoute(
              page: BaseProfileTab.page,
              children: [
                AutoRoute(
                  page: ProfileRoute.page,
                  initial: true,
                  // children: const [],
                ),
              ],
            ),
          ],
        ),

        /// Auth
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: PasswordRecoveryRoute.page),
        AutoRoute(page: EnterSmsCodeRoute.page),
        AutoRoute(page: RegisterRoute.page),
        AutoRoute(page: NewPasswordRoute.page),
        AutoRoute(page: SuccessfullRoute.page),

        //

        AutoRoute(page: OnboardingRoute.page),

        /// Main
        ///

        /// Profile
        AutoRoute(page: ProfileRoute.page),
        AutoRoute(page: InformationRoute.page),
        AutoRoute(page: DailyRoutineRoute.page),
        AutoRoute(page: EditProfileRoute.page),
        AutoRoute(page: EditProfileRoute.page),
        AutoRoute(page: DetailAvatarRoute.page),
        AutoRoute(page: SkinProfileRoute.page),
        AutoRoute(page: SkinTypeRoute.page),
        AutoRoute(page: ScanResultRoute.page),
        AutoRoute(page: ConcernsRoute.page),
        AutoRoute(page: SettingsRoute.page),
        AutoRoute(page: PrivacySettingsRoute.page),
        AutoRoute(page: HelpRoute.page),
        AutoRoute(page: FaqsRoute.page),
        AutoRoute(page: ContactSupportRoute.page),
        AutoRoute(page: AboutRoute.page),
      ];
}

@RoutePage(name: 'BaseMainTab')
class BaseMainPage extends AutoRouter {
  const BaseMainPage({super.key});
}

@RoutePage(name: 'BaseSearchTab')
class BaseSearchPage extends AutoRouter {
  const BaseSearchPage({super.key});
}

@RoutePage(name: 'BaseApplicationTab')
class BaseApplicationPage extends AutoRouter {
  const BaseApplicationPage({super.key});
}

@RoutePage(name: 'BaseProfileTab')
class BaseProfilePage extends AutoRouter {
  const BaseProfilePage({super.key});
}
