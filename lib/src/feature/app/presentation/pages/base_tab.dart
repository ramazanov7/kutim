import 'package:animations/animations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:kutim/src/core/gen/assets.gen.dart';
import 'package:kutim/src/core/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:kutim/src/core/presentation/widgets/other/custom_loading_overlay_widget.dart';
import 'package:kutim/src/core/theme/resources.dart';
import 'package:kutim/src/feature/app/presentation/widgets/base_tabs.dart';
import 'package:kutim/src/feature/app/router/app_router.dart';

class BaseTab extends StatefulWidget {
  final int? count;
  const BaseTab({super.key, this.count});

  @override
  State<BaseTab> createState() => _BaseTabState();
}

class _BaseTabState extends State<BaseTab> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(
      length: 4,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      overlayColor: AppColors.barrierColor,
      overlayWidgetBuilder: (progress) => const CustomLoadingOverlayWidget(),
      child: AutoTabsScaffold(
        routes: const [
          BaseMainTab(),
          BaseAutoTab(),
          BaseApplicationTab(),
          BaseProfileTab(),
        ],
        appBarBuilder: (context, tabsRouter) => switch (tabsRouter.activeIndex) {
          _ => PreferredSize(
              preferredSize: Size.fromHeight(MediaQuery.paddingOf(context).top),
              child: SizedBox(
                height: MediaQuery.paddingOf(context).top,
              ),
            ),
        },
        transitionBuilder: (context, child, animation) {
          return PageTransitionSwitcher(
            duration: const Duration(seconds: 2),
            reverse: true,
            transitionBuilder: (
              Widget child,
              Animation<double> animation1,
              Animation<double> secondaryAnimation,
            ) {
              return FadeThroughTransition(
                fillColor: Colors.transparent,
                animation: animation,
                secondaryAnimation: secondaryAnimation,
                child: child,
              );
            },
            child: child,
          );
        },
        bottomNavigationBuilder: (context, tabsRouter) => BaseTabBottomNavbar(
          tabController: _tabController,
          tabsRouter: tabsRouter,
          count: widget.count,
        ),
      ),
    );
  }
}

class BaseTabBottomNavbar extends StatefulWidget {
  final int? count;
  const BaseTabBottomNavbar({
    super.key,
    required this.tabsRouter,
    required this.tabController,
    this.count,
  });
  final TabsRouter tabsRouter;
  final TabController tabController;

  @override
  State<BaseTabBottomNavbar> createState() => _BaseTabBottomNavbarState();
}

class _BaseTabBottomNavbarState extends State<BaseTabBottomNavbar> {
  int lastTab = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 2,
        bottom: MediaQuery.viewPaddingOf(context).bottom,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        // borderRadius: BorderRadius.only(
        //   topLeft: Radius.circular(16),
        //   topRight: Radius.circular(16),
        // ),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(16, 5, 5, 0.078),
            blurRadius: 80,
          ),
        ],
      ),
      child: TabBar(
        dividerColor: Colors.transparent,
        controller: widget.tabController,
        enableFeedback: false,
        // dividerHeight: 0,
        unselectedLabelStyle: AppTextStyles.fs12w400,
        labelStyle: AppTextStyles.fs12w400,
        // indicatorSize: TabBarIndicatorSize.tab,
        indicator: TabDotIndicator(),
        onTap: (value) {
          HapticFeedback.mediumImpact();
          if (widget.tabsRouter.activeIndex == value) {
            widget.tabsRouter.maybePopTop();
            lastTab = value;
          } else {
            widget.tabsRouter.setActiveIndex(value);
            lastTab = value;
          }
          // if (value == 2 && !context.appBloc.isAuthenticated) {
          //   context.router.push(
          //     const RegisterRoute(),
          //   );
          //   widget.tabController.index = lastTab;
          // } else if (widget.tabsRouter.activeIndex == value) {
          //   widget.tabsRouter.maybePopTop();
          //   lastTab = value;
          // } else {
          //   widget.tabsRouter.setActiveIndex(value);
          //   lastTab = value;
          // }
        },
        tabs: [
          CustomTabWidget(
            icon: Assets.icons.mainInactive.path,
            activeIcon: Assets.icons.mainActive.path,
            title: context.localized.main,
            currentIndex: widget.tabController.index,
            tabIndex: 0,
          ),
          CustomTabWidget(
            icon: Assets.icons.carInactive.path,
            activeIcon: Assets.icons.carActive.path,
            title: context.localized.catalog,
            // title: 'Каталог',
            currentIndex: widget.tabController.index,
            tabIndex: 1,
          ),
          CustomTabWidget(
            icon: Assets.icons.applicationInactive.path,
            activeIcon: Assets.icons.applicationActive.path,
            title: context.localized.profile,
            currentIndex: widget.tabController.index,
            tabIndex: 2,
          ),
          CustomTabWidget(
            icon: Assets.icons.profileInactive.path,
            activeIcon: Assets.icons.profileActive.path,
            title: context.localized.profile,
            currentIndex: widget.tabController.index,
            tabIndex: 3,
          ),
        ],
      ),
    );
  }
}
