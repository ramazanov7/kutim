import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kutim/src/core/gen/assets.gen.dart';
import 'package:kutim/src/core/theme/resources.dart';
import 'package:kutim/src/feature/app/router/app_router.dart';
import 'package:kutim/src/feature/profile/presentation/widget/profile_item_widget.dart';

@RoutePage()
class SettingsPage extends StatefulWidget {
  SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String? selectedSecTitle = "English";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Skin Profile",
          style: AppTextStyles.fs16w500,
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: SvgPicture.asset(Assets.icons.settings.path),
          )
        ],
      ),
      body: Column(
        children: [
          ProfileItem(
            title: 'Notifications',
            icon: Assets.icons.icNotification.path,
          ),
          ProfileItem(
            title: 'Skin Analysis Frequency',
            icon: Assets.icons.icStar.path,
            onTap: () {},
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Divider(),
          ),
          ProfileItem(
            title: 'Reset All Settings',
            textStyle: AppTextStyles.fs16w400.copyWith(color: AppColors.red),
            icon: Assets.icons.icRestAllSettings.path,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
