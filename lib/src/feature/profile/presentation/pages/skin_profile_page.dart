import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kutim/src/core/gen/assets.gen.dart';
import 'package:kutim/src/core/theme/resources.dart';
import 'package:kutim/src/feature/app/router/app_router.dart';
import 'package:kutim/src/feature/profile/presentation/profile.dart';
import 'package:kutim/src/feature/profile/presentation/widget/profile_item_widget.dart';

@RoutePage()
class SkinProfilePage extends StatefulWidget {
  const SkinProfilePage({super.key});

  @override
  State<SkinProfilePage> createState() => _SkinProfilePageState();
}

class _SkinProfilePageState extends State<SkinProfilePage> {
  List<String> selectedConcernsFromPage = [];
  String? selectedSecTitle = "Normal";

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
            child: SvgPicture.asset(Assets.icons.concerns.path),
          )
        ],
      ),
      body: Column(
        children: [
          ProfileItem(
            title: 'Skin Type',
            icon: Assets.icons.skinType.path,
            secTitle: selectedSecTitle,
            onTap: () async {
              final secTitle = await context.router.push(
                SkinTypeRoute(selectedSecTitle: selectedSecTitle ?? ""),
              );
              if (secTitle != null) {
                setState(() {
                  selectedSecTitle = secTitle as String?;
                });
              }
            },
            // onTap: () {
            //   context.router.push(const SkinTypeRoute());
            // },
          ),
          ProfileItem(
            title: 'Concerns',
            icon: Assets.icons.concerns.path,
            secTitle:
                selectedConcernsFromPage.isNotEmpty ? selectedConcernsFromPage.join(', ') : 'No concerns selected',
            onTap: () async {
              final result = await context.router.push(const ConcernsRoute());
              if (result != null && result is List<String>) {
                setState(() {
                  selectedConcernsFromPage = result;
                });
              }
            },
          ),
          ProfileItem(
            title: 'Photos',
            icon: Assets.icons.photos.path,
            onTap: () {},
          ),
          ProfileItem(
            title: 'Care Goals',
            icon: Assets.icons.careGoals.path,
            secTitle: "Reduce Breakouts",
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
