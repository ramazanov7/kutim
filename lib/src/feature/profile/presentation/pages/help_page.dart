import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kutim/src/core/gen/assets.gen.dart';
import 'package:kutim/src/core/theme/resources.dart';
import 'package:kutim/src/feature/app/router/app_router.dart';
import 'package:kutim/src/feature/profile/presentation/widget/profile_item_widget.dart';

@RoutePage()
class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Help",
          style: AppTextStyles.fs16w500,
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: SvgPicture.asset(Assets.icons.help.path),
          )
        ],
      ),
      body: Column(
        children: [
          ProfileItem(
            title: 'Contact Support',
            icon: Assets.icons.icContactSup.path,
            onTap: () {
              context.router.push(const ContactSupportRoute());
            },
          ),
          ProfileItem(
            title: 'About',
            icon: Assets.icons.icAbout.path,
            onTap: () {
              context.router.push(const AboutRoute());
            },
          ),
        ],
      ),
    );
  }
}
