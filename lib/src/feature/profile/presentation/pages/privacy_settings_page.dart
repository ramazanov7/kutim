import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:kutim/src/core/gen/assets.gen.dart';
import 'package:kutim/src/core/theme/resources.dart';
import 'package:kutim/src/feature/profile/presentation/widget/profile_item_widget.dart';

@RoutePage()
class PrivacySettingsPage extends StatefulWidget {
  const PrivacySettingsPage({super.key});

  @override
  State<PrivacySettingsPage> createState() => _PrivacySettingsPageState();
}

class _PrivacySettingsPageState extends State<PrivacySettingsPage> {
   bool isSwitched = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Privacy Settings",
          style: AppTextStyles.fs16w500,
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: SvgPicture.asset(Assets.icons.privacySettings.path),
          )
        ],
      ),
      body: Column(
        children: [
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.only(left: 26, right: 26, top: 12, bottom: 12),
              child: Row(
                children: [
                  SvgPicture.asset(
                    Assets.icons.icCameraa.path,
                  ),
                  const Gap(16),
                  Text(
                    'Camera Access',
                    style: AppTextStyles.fs14w400.copyWith(
                      color: AppColors.text,
                      height: 1.2,
                    ),
                  ),
                  Spacer(),
                    Container(
                      height: 18,
                      width: 30,
                      child: Switch(
                        
                      value: isSwitched,
                      onChanged: (value) {
                        setState(() {
                          isSwitched = value;
                        });
                      },
                      activeColor: AppColors.white,
                      activeTrackColor: AppColors.mainColor,
                      inactiveThumbColor: AppColors.white,
                      inactiveTrackColor: AppColors.grey969696,
                                        ),
                    ),
                ],
              ),
            ),
          ),
          ProfileItem(
            title: 'Data Collection',
            icon: Assets.icons.icDataCollection.path,
            onTap: () {},
          ),
          ProfileItem(
            title: 'Export Data',
            icon: Assets.icons.icExportData.path,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
