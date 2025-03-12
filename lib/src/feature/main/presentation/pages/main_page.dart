import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kutim/src/core/gen/assets.gen.dart';
import 'package:kutim/src/feature/app/router/app_router.dart';

@RoutePage()
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.red,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 23, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      Assets.images.splashLogo.path,
                      height: 56,
                    ),
                    IconButton(
                        onPressed: () {
                          context.router.push(const InformationRoute());
                        },
                        icon: SvgPicture.asset(Assets.icons.calendar.path))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
