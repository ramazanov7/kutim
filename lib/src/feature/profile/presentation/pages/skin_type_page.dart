import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:kutim/src/core/gen/assets.gen.dart';
import 'package:kutim/src/core/theme/resources.dart';
import 'package:kutim/src/feature/profile/presentation/widget/skin_widget_card.dart';

@RoutePage()
class SkinTypePage extends StatefulWidget {
  final String selectedSecTitle;
  const SkinTypePage({super.key, required this.selectedSecTitle});

  @override
  State<SkinTypePage> createState() => _SkinTypePageState();
}

class _SkinTypePageState extends State<SkinTypePage> {
  String? selectedSecTitle;
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
              child: SvgPicture.asset(Assets.icons.skinType.path),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const Gap(54),
              Row(
                children: [
                  const Gap(10),
                  SvgPicture.asset(Assets.icons.skinType.path),
                  const Gap(20),
                  const Text(
                    "Skin Type",
                    style: AppTextStyles.fs16w400,
                  )
                ],
              ),
              const Gap(20),
            ],
          ),
        ));
  }
}
