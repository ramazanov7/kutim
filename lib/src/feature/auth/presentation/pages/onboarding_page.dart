import 'package:auto_route/auto_route.dart';
import 'package:kutim/src/core/gen/assets.gen.dart';
import 'package:kutim/src/core/presentation/widgets/buttons/custom_button.dart';
import 'package:kutim/src/core/theme/resources.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

@RoutePage()
class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key, required this.onGoAuthPressed});

  final VoidCallback onGoAuthPressed;

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int imageIndex = 0;

  final PageController _pageController = PageController();

  List<String> images = [
    Assets.images.onboardingFirstImage.path,
    Assets.images.onboardingSecondImage.path,
    Assets.images.onboardingThirdImage.path,
  ];

  List<String> title = [
    'Analyze the condition of your skin',
    'Get personalized recommendations',
    'Track improvements every day'
  ];

  List<String> description = [
    'We will conduct a detailed analysis of your skin: type, moisture level and problem areas.',
    'Find out how to properly care for your skin and which products are perfect for you.',
    'Compare the results and watch your skin get better step by step.'
  ];

  @override
  void initState() {
    super.initState();

    // Future.delayed(const Duration(seconds: 2), () {
    //   context.replaceRoute(LauncherRoute());
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Padding(
        padding: const EdgeInsets.only(left: 23, right: 23, bottom: 34),
        child: CustomButton(
            onPressed: widget.onGoAuthPressed,
            style: CustomButtonStyles.mainButtonStyle(context, elevation: 5),
            child: const Text(
              'Get started',
              style: AppTextStyles.fs16w500,
            )),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 416,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  imageIndex = index;
                });
              },
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Image.asset(images[index]),
                  ],
                );
              },
            ),
          ),
          const Gap(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (index) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: 9,
                height: 9,
                decoration: BoxDecoration(
                  color: imageIndex == index ? AppColors.mainColor : AppColors.white,
                  border: Border.all(color: AppColors.mainColor),
                  borderRadius: BorderRadius.circular(4),
                ),
              );
            }),
          ),
          const Gap(30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              title[imageIndex],
              style: AppTextStyles.fs16w700.copyWith(color: AppColors.mainColor),
            ),
          ),
          const Gap(30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              description[imageIndex],
              style: AppTextStyles.fs16w500,
            ),
          )
        ],
      ),
    );
  }
}
