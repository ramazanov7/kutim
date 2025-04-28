// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [AboutPage]
class AboutRoute extends PageRouteInfo<void> {
  const AboutRoute({List<PageRouteInfo>? children})
    : super(AboutRoute.name, initialChildren: children);

  static const String name = 'AboutRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AboutPage();
    },
  );
}

/// generated route for
/// [ApplicationPage]
class ApplicationRoute extends PageRouteInfo<void> {
  const ApplicationRoute({List<PageRouteInfo>? children})
    : super(ApplicationRoute.name, initialChildren: children);

  static const String name = 'ApplicationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const ApplicationPage());
    },
  );
}

/// generated route for
/// [BaseApplicationPage]
class BaseApplicationTab extends PageRouteInfo<void> {
  const BaseApplicationTab({List<PageRouteInfo>? children})
    : super(BaseApplicationTab.name, initialChildren: children);

  static const String name = 'BaseApplicationTab';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const BaseApplicationPage();
    },
  );
}

/// generated route for
/// [BaseMainPage]
class BaseMainTab extends PageRouteInfo<void> {
  const BaseMainTab({List<PageRouteInfo>? children})
    : super(BaseMainTab.name, initialChildren: children);

  static const String name = 'BaseMainTab';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const BaseMainPage();
    },
  );
}

/// generated route for
/// [BaseProfilePage]
class BaseProfileTab extends PageRouteInfo<void> {
  const BaseProfileTab({List<PageRouteInfo>? children})
    : super(BaseProfileTab.name, initialChildren: children);

  static const String name = 'BaseProfileTab';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const BaseProfilePage();
    },
  );
}

/// generated route for
/// [BaseSearchPage]
class BaseSearchTab extends PageRouteInfo<void> {
  const BaseSearchTab({List<PageRouteInfo>? children})
    : super(BaseSearchTab.name, initialChildren: children);

  static const String name = 'BaseSearchTab';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const BaseSearchPage();
    },
  );
}

/// generated route for
/// [ConcernsPage]
class ConcernsRoute extends PageRouteInfo<void> {
  const ConcernsRoute({List<PageRouteInfo>? children})
    : super(ConcernsRoute.name, initialChildren: children);

  static const String name = 'ConcernsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ConcernsPage();
    },
  );
}

/// generated route for
/// [ContactSupportPage]
class ContactSupportRoute extends PageRouteInfo<void> {
  const ContactSupportRoute({List<PageRouteInfo>? children})
    : super(ContactSupportRoute.name, initialChildren: children);

  static const String name = 'ContactSupportRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ContactSupportPage();
    },
  );
}

/// generated route for
/// [DailyRoutinePage]
class DailyRoutineRoute extends PageRouteInfo<void> {
  const DailyRoutineRoute({List<PageRouteInfo>? children})
    : super(DailyRoutineRoute.name, initialChildren: children);

  static const String name = 'DailyRoutineRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const DailyRoutinePage();
    },
  );
}

/// generated route for
/// [DetailAvatarPage]
class DetailAvatarRoute extends PageRouteInfo<DetailAvatarRouteArgs> {
  DetailAvatarRoute({Key? key, String? image, List<PageRouteInfo>? children})
    : super(
        DetailAvatarRoute.name,
        args: DetailAvatarRouteArgs(key: key, image: image),
        initialChildren: children,
      );

  static const String name = 'DetailAvatarRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DetailAvatarRouteArgs>(
        orElse: () => const DetailAvatarRouteArgs(),
      );
      return DetailAvatarPage(key: args.key, image: args.image);
    },
  );
}

class DetailAvatarRouteArgs {
  const DetailAvatarRouteArgs({this.key, this.image});

  final Key? key;

  final String? image;

  @override
  String toString() {
    return 'DetailAvatarRouteArgs{key: $key, image: $image}';
  }
}

/// generated route for
/// [EditProfilePage]
class EditProfileRoute extends PageRouteInfo<EditProfileRouteArgs> {
  EditProfileRoute({Key? key, UserDTO? user, List<PageRouteInfo>? children})
    : super(
        EditProfileRoute.name,
        args: EditProfileRouteArgs(key: key, user: user),
        initialChildren: children,
      );

  static const String name = 'EditProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EditProfileRouteArgs>(
        orElse: () => const EditProfileRouteArgs(),
      );
      return WrappedRoute(
        child: EditProfilePage(key: args.key, user: args.user),
      );
    },
  );
}

class EditProfileRouteArgs {
  const EditProfileRouteArgs({this.key, this.user});

  final Key? key;

  final UserDTO? user;

  @override
  String toString() {
    return 'EditProfileRouteArgs{key: $key, user: $user}';
  }
}

/// generated route for
/// [EnterSmsCodePage]
class EnterSmsCodeRoute extends PageRouteInfo<EnterSmsCodeRouteArgs> {
  EnterSmsCodeRoute({
    Key? key,
    required String email,
    List<PageRouteInfo>? children,
  }) : super(
         EnterSmsCodeRoute.name,
         args: EnterSmsCodeRouteArgs(key: key, email: email),
         initialChildren: children,
       );

  static const String name = 'EnterSmsCodeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EnterSmsCodeRouteArgs>();
      return WrappedRoute(
        child: EnterSmsCodePage(key: args.key, email: args.email),
      );
    },
  );
}

class EnterSmsCodeRouteArgs {
  const EnterSmsCodeRouteArgs({this.key, required this.email});

  final Key? key;

  final String email;

  @override
  String toString() {
    return 'EnterSmsCodeRouteArgs{key: $key, email: $email}';
  }
}

/// generated route for
/// [FaqsPage]
class FaqsRoute extends PageRouteInfo<void> {
  const FaqsRoute({List<PageRouteInfo>? children})
    : super(FaqsRoute.name, initialChildren: children);

  static const String name = 'FaqsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const FaqsPage();
    },
  );
}

/// generated route for
/// [HelpPage]
class HelpRoute extends PageRouteInfo<void> {
  const HelpRoute({List<PageRouteInfo>? children})
    : super(HelpRoute.name, initialChildren: children);

  static const String name = 'HelpRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HelpPage();
    },
  );
}

/// generated route for
/// [InformationPage]
class InformationRoute extends PageRouteInfo<InformationRouteArgs> {
  InformationRoute({
    Key? key,
    required String skinType,
    List<PageRouteInfo>? children,
  }) : super(
         InformationRoute.name,
         args: InformationRouteArgs(key: key, skinType: skinType),
         initialChildren: children,
       );

  static const String name = 'InformationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<InformationRouteArgs>();
      return WrappedRoute(
        child: InformationPage(key: args.key, skinType: args.skinType),
      );
    },
  );
}

class InformationRouteArgs {
  const InformationRouteArgs({this.key, required this.skinType});

  final Key? key;

  final String skinType;

  @override
  String toString() {
    return 'InformationRouteArgs{key: $key, skinType: $skinType}';
  }
}

/// generated route for
/// [Launcher]
class LauncherRoute extends PageRouteInfo<LauncherRouteArgs> {
  LauncherRoute({Key? key, int? initialTabIndex, List<PageRouteInfo>? children})
    : super(
        LauncherRoute.name,
        args: LauncherRouteArgs(key: key, initialTabIndex: initialTabIndex),
        initialChildren: children,
      );

  static const String name = 'LauncherRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LauncherRouteArgs>(
        orElse: () => const LauncherRouteArgs(),
      );
      return Launcher(key: args.key, initialTabIndex: args.initialTabIndex);
    },
  );
}

class LauncherRouteArgs {
  const LauncherRouteArgs({this.key, this.initialTabIndex});

  final Key? key;

  final int? initialTabIndex;

  @override
  String toString() {
    return 'LauncherRouteArgs{key: $key, initialTabIndex: $initialTabIndex}';
  }
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const LoginPage());
    },
  );
}

/// generated route for
/// [MainPage]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
    : super(MainRoute.name, initialChildren: children);

  static const String name = 'MainRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MainPage();
    },
  );
}

/// generated route for
/// [NewPasswordPage]
class NewPasswordRoute extends PageRouteInfo<NewPasswordRouteArgs> {
  NewPasswordRoute({
    Key? key,
    required String token,
    List<PageRouteInfo>? children,
  }) : super(
         NewPasswordRoute.name,
         args: NewPasswordRouteArgs(key: key, token: token),
         initialChildren: children,
       );

  static const String name = 'NewPasswordRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<NewPasswordRouteArgs>();
      return WrappedRoute(
        child: NewPasswordPage(key: args.key, token: args.token),
      );
    },
  );
}

class NewPasswordRouteArgs {
  const NewPasswordRouteArgs({this.key, required this.token});

  final Key? key;

  final String token;

  @override
  String toString() {
    return 'NewPasswordRouteArgs{key: $key, token: $token}';
  }
}

/// generated route for
/// [OnboardingPage]
class OnboardingRoute extends PageRouteInfo<OnboardingRouteArgs> {
  OnboardingRoute({
    Key? key,
    required VoidCallback onGoAuthPressed,
    List<PageRouteInfo>? children,
  }) : super(
         OnboardingRoute.name,
         args: OnboardingRouteArgs(key: key, onGoAuthPressed: onGoAuthPressed),
         initialChildren: children,
       );

  static const String name = 'OnboardingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OnboardingRouteArgs>();
      return OnboardingPage(
        key: args.key,
        onGoAuthPressed: args.onGoAuthPressed,
      );
    },
  );
}

class OnboardingRouteArgs {
  const OnboardingRouteArgs({this.key, required this.onGoAuthPressed});

  final Key? key;

  final VoidCallback onGoAuthPressed;

  @override
  String toString() {
    return 'OnboardingRouteArgs{key: $key, onGoAuthPressed: $onGoAuthPressed}';
  }
}

/// generated route for
/// [PasswordRecoveryPage]
class PasswordRecoveryRoute extends PageRouteInfo<void> {
  const PasswordRecoveryRoute({List<PageRouteInfo>? children})
    : super(PasswordRecoveryRoute.name, initialChildren: children);

  static const String name = 'PasswordRecoveryRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const PasswordRecoveryPage());
    },
  );
}

/// generated route for
/// [PrivacySettingsPage]
class PrivacySettingsRoute extends PageRouteInfo<void> {
  const PrivacySettingsRoute({List<PageRouteInfo>? children})
    : super(PrivacySettingsRoute.name, initialChildren: children);

  static const String name = 'PrivacySettingsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const PrivacySettingsPage();
    },
  );
}

/// generated route for
/// [ProfilePage]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProfilePage();
    },
  );
}

/// generated route for
/// [RegisterPage]
class RegisterRoute extends PageRouteInfo<void> {
  const RegisterRoute({List<PageRouteInfo>? children})
    : super(RegisterRoute.name, initialChildren: children);

  static const String name = 'RegisterRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const RegisterPage());
    },
  );
}

/// generated route for
/// [ScanResultPage]
class ScanResultRoute extends PageRouteInfo<ScanResultRouteArgs> {
  ScanResultRoute({
    Key? key,
    XFile? image,
    required ScanDTO scanDTO,
    List<PageRouteInfo>? children,
  }) : super(
         ScanResultRoute.name,
         args: ScanResultRouteArgs(key: key, image: image, scanDTO: scanDTO),
         initialChildren: children,
       );

  static const String name = 'ScanResultRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ScanResultRouteArgs>();
      return ScanResultPage(
        key: args.key,
        image: args.image,
        scanDTO: args.scanDTO,
      );
    },
  );
}

class ScanResultRouteArgs {
  const ScanResultRouteArgs({this.key, this.image, required this.scanDTO});

  final Key? key;

  final XFile? image;

  final ScanDTO scanDTO;

  @override
  String toString() {
    return 'ScanResultRouteArgs{key: $key, image: $image, scanDTO: $scanDTO}';
  }
}

/// generated route for
/// [SearchPage]
class SearchRoute extends PageRouteInfo<void> {
  const SearchRoute({List<PageRouteInfo>? children})
    : super(SearchRoute.name, initialChildren: children);

  static const String name = 'SearchRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const SearchPage());
    },
  );
}

/// generated route for
/// [SettingsPage]
class SettingsRoute extends PageRouteInfo<SettingsRouteArgs> {
  SettingsRoute({Key? key, List<PageRouteInfo>? children})
    : super(
        SettingsRoute.name,
        args: SettingsRouteArgs(key: key),
        initialChildren: children,
      );

  static const String name = 'SettingsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SettingsRouteArgs>(
        orElse: () => const SettingsRouteArgs(),
      );
      return SettingsPage(key: args.key);
    },
  );
}

class SettingsRouteArgs {
  const SettingsRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'SettingsRouteArgs{key: $key}';
  }
}

/// generated route for
/// [SkinProfilePage]
class SkinProfileRoute extends PageRouteInfo<void> {
  const SkinProfileRoute({List<PageRouteInfo>? children})
    : super(SkinProfileRoute.name, initialChildren: children);

  static const String name = 'SkinProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SkinProfilePage();
    },
  );
}

/// generated route for
/// [SkinTypePage]
class SkinTypeRoute extends PageRouteInfo<SkinTypeRouteArgs> {
  SkinTypeRoute({
    Key? key,
    required String selectedSecTitle,
    List<PageRouteInfo>? children,
  }) : super(
         SkinTypeRoute.name,
         args: SkinTypeRouteArgs(key: key, selectedSecTitle: selectedSecTitle),
         initialChildren: children,
       );

  static const String name = 'SkinTypeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SkinTypeRouteArgs>();
      return SkinTypePage(
        key: args.key,
        selectedSecTitle: args.selectedSecTitle,
      );
    },
  );
}

class SkinTypeRouteArgs {
  const SkinTypeRouteArgs({this.key, required this.selectedSecTitle});

  final Key? key;

  final String selectedSecTitle;

  @override
  String toString() {
    return 'SkinTypeRouteArgs{key: $key, selectedSecTitle: $selectedSecTitle}';
  }
}

/// generated route for
/// [SuccessfullPage]
class SuccessfullRoute extends PageRouteInfo<void> {
  const SuccessfullRoute({List<PageRouteInfo>? children})
    : super(SuccessfullRoute.name, initialChildren: children);

  static const String name = 'SuccessfullRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SuccessfullPage();
    },
  );
}

/// generated route for
/// [TempPage]
class TempRoute extends PageRouteInfo<TempRouteArgs> {
  TempRoute({required String title, Key? key, List<PageRouteInfo>? children})
    : super(
        TempRoute.name,
        args: TempRouteArgs(title: title, key: key),
        initialChildren: children,
      );

  static const String name = 'TempRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TempRouteArgs>();
      return TempPage(title: args.title, key: args.key);
    },
  );
}

class TempRouteArgs {
  const TempRouteArgs({required this.title, this.key});

  final String title;

  final Key? key;

  @override
  String toString() {
    return 'TempRouteArgs{title: $title, key: $key}';
  }
}
