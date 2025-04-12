// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [ApplicationPage]
class ApplicationRoute extends PageRouteInfo<void> {
  const ApplicationRoute({List<PageRouteInfo>? children})
    : super(ApplicationRoute.name, initialChildren: children);

  static const String name = 'ApplicationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ApplicationPage();
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
      return EditProfilePage(key: args.key, user: args.user);
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
/// [InformationPage]
class InformationRoute extends PageRouteInfo<void> {
  const InformationRoute({List<PageRouteInfo>? children})
    : super(InformationRoute.name, initialChildren: children);

  static const String name = 'InformationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const InformationPage();
    },
  );
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
/// [SearchPage]
class SearchRoute extends PageRouteInfo<void> {
  const SearchRoute({List<PageRouteInfo>? children})
    : super(SearchRoute.name, initialChildren: children);

  static const String name = 'SearchRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SearchPage();
    },
  );
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
