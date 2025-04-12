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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SkinWidgetCard(
                    title: "Normal",
                    imagePath: Assets.images.skinImg1.path,
                    onTap: (){
                      setState(() {
                        selectedSecTitle = "Normal";
                      });
                      Navigator.of(context).pop(selectedSecTitle);
                    },
                  ),
                  SkinWidgetCard(
                    title: "Dry",
                    imagePath: Assets.images.skinImg2png.path,
                     onTap: () {
                      setState(() {
                        selectedSecTitle = "Dry";
                      });
                      Navigator.of(context).pop(selectedSecTitle);
                    },
                  ),
                ],
              ),
              const Gap(26),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SkinWidgetCard(
                    title: "Oily",
                    imagePath: Assets.images.skinImg3.path,
                     onTap: () {
                      setState(() {
                        selectedSecTitle = "Oily";
                      });
                      Navigator.of(context).pop(selectedSecTitle);
                    },
                  ),
                  SkinWidgetCard(
                    title: "Combi",
                    imagePath: Assets.images.skinImg4.path,
                     onTap: () {
                      setState(() {
                        selectedSecTitle = "Combi";
                      });
                      Navigator.of(context).pop(selectedSecTitle);
                    },
                  ),
                ],
              ),
              const Gap(26),
              SkinWidgetCard(
                title: "Sensitive",
                imagePath: Assets.images.skinImg5.path,
                onTap: () {
                  setState(() {
                    selectedSecTitle = "Sensitive";
                  });
                   Navigator.of(context).pop(selectedSecTitle);
                },
              ),
            ],
          ),
        ));
  }
}
