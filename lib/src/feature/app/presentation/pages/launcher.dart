import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:kutim/src/core/utils/extensions/context_extension.dart';
import 'package:kutim/src/feature/app/presentation/pages/base_tab.dart';
import 'package:kutim/src/feature/auth/bloc/login_cubit.dart';
import 'package:kutim/src/feature/auth/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kutim/src/core/presentation/widgets/other/custom_loading_widget.dart';
import 'package:kutim/src/feature/app/bloc/app_bloc.dart';
import 'package:kutim/src/feature/app/presentation/pages/force_update_page.dart';
import 'package:kutim/src/feature/auth/presentation/pages/onboarding_page.dart';

@RoutePage(name: 'LauncherRoute')
class Launcher extends StatefulWidget {
  const Launcher({super.key, this.initialTabIndex});
  final int? initialTabIndex;

  @override
  State<Launcher> createState() => _LauncherState();
}

class _LauncherState extends State<Launcher> with WidgetsBindingObserver {
  bool _isFirstLaunch = true;

  @override
  void initState() {
    FToast().init(context);
    // _isFirstLaunch = false;
    // WidgetsBinding.instance.addPostFrameCallback((time) {
    //   NotificationService().onMessageOpenedApp(context);
    // });
    // NotificationService().getDeviceToken(authDao: context.repository.authDao);
    super.initState();

    BlocProvider.of<AppBloc>(context).add(
      AppEvent.checkAuth(
        version: context.dependencies.packageInfo.version,
      ),
    );
    // initDeepLinks();

    // WidgetsBinding.instance.addObserver(this);

    // Delay for 2 seconds before hiding the onboarding screen

    // log('${context.appBloc.isAuthenticated}', name: 'launchers');
  }

  // Future<void> initDeepLinks() async {
  //   _appLinks = AppLinks();

  //   _linkSubscription = _appLinks.uriLinkStream.listen((uri) {
  //     DeepLinkHandler.handle(
  //       uri: uri,
  //       context: context,
  //     );
  //   });
  // }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    log('MyApp state = $state');
    if (state == AppLifecycleState.inactive) {
      // app transitioning to other state.
    } else if (state == AppLifecycleState.paused) {
      // app is on the background.
    } else if (state == AppLifecycleState.detached) {
      // flutter engine is running but detached from views
    } else if (state == AppLifecycleState.resumed) {
      // app is visible and running.
      // runApp(App()); // run your App class again
    }
  }

  @override
  void dispose() {
    // WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isFirstLaunch) {
      return OnboardingPage(
        onGoAuthPressed: () {
          setState(() {
            _isFirstLaunch = false;
          });
        },
      );
    }

    return BlocConsumer<AppBloc, AppState>(
      listener: (context, state) {
        state.whenOrNull(
          inApp: () {
            _isFirstLaunch = false;
            // BlocProvider.of<AppBloc>(context).add(const AppEvent.sendDeviceToken());
            // BlocProvider.of<ProfileBLoC>(context).add(const ProfileEvent.getProfile());
          },
        );
      },
      builder: (context, state) => state.when(
        notAvailableVersion: () => ForceUpdatePage.forceUpdate(
          onTap: () async {},
        ),
        error: (message) => ForceUpdatePage.noAvailable(
          onTap: () async {},
        ),
        onboardingState: () => const BaseTab(),
        inApp: () => const BaseTab(),
        notAuthorized: () => BlocProvider(
          create: (context) => LoginCubit(repository: context.repository.authRepository),
          child: const LoginPage(),
        ),
        loading: () => const _Scaffold(
          child: CustomLoadingWidget(),
        ),
      ),
    );
  }
}

class _Scaffold extends StatelessWidget {
  const _Scaffold({
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(child: child),
      );
}
