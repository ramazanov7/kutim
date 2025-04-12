import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kutim/src/core/gen/assets.gen.dart';
import 'package:kutim/src/core/presentation/widgets/buttons/custom_button.dart';
import 'package:kutim/src/core/theme/resources.dart';
import 'package:kutim/src/feature/app/router/app_router.dart';

@RoutePage()
class InformationPage extends StatefulWidget {
  const InformationPage({super.key});

  @override
  State<InformationPage> createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  final ScrollController _scrollImageController = ScrollController();
  final int itemCount = 6;
  int currentIndex = 0;

  final ScrollController _scrollSecondController = ScrollController();
  final int itemSecondCount = 3;
  int currentSecondIndex = 0;
  final double cardWidth = 241 + 16;

  @override
  void initState() {
    _scrollImageController.addListener(_updateButtonState);
    _scrollSecondController.addListener(_updateSecondButtonState);
    super.initState();
  }

  void _updateButtonState() {
    int newIndex = (_scrollImageController.offset / cardWidth).round();
    if (newIndex != currentIndex) {
      setState(() {
        currentIndex = newIndex;
      });
    }
  }

  void _scrollImageToNextCard() {
    if (currentIndex < itemCount - 1) {
      _scrollImageController.animateTo(
        _scrollImageController.offset + cardWidth,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _scrollImageToPreviousCard() {
    if (currentIndex > 0) {
      _scrollImageController.animateTo(
        _scrollImageController.offset - cardWidth,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _updateSecondButtonState() {
    int newIndex = (_scrollSecondController.offset / cardWidth).round();
    if (newIndex != currentSecondIndex) {
      setState(() {
        currentSecondIndex = newIndex;
      });
    }
  }

  void _scrollToNextCard() {
    if (currentSecondIndex < itemSecondCount - 1) {
      _scrollSecondController.animateTo(
        _scrollSecondController.offset + cardWidth,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _scrollToPreviousCard() {
    if (currentSecondIndex > 0) {
      _scrollSecondController.animateTo(
        _scrollSecondController.offset - cardWidth,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _scrollImageController.removeListener(_updateButtonState);
    _scrollImageController.dispose();
    _scrollSecondController.removeListener(_updateSecondButtonState);
    _scrollSecondController.dispose();
    super.dispose();
  }

  int stepsIndex = 0;

  bool isChoosing = false;

  List<String> descriptionImages = [
    "Lack of moisture in the skin can lead to flaking, irritation, and a rough texture. Dry skin may feel tight and uncomfortable, especially in cold weather or after washing. Proper hydration and barrier protection are essential for maintaining smooth and healthy skin.",
    "Excess sebum production can cause shine, enlarged pores, and increased likelihood of acne breakouts. Oily skin is often influenced by genetics, hormones, and environmental factors. A balanced skincare routine can help regulate oil levels.",
    "Breakouts occur due to clogged pores, excess oil, and bacteria. Acne can range from blackheads and whiteheads to deep cystic pimples. Managing acne requires gentle cleansing, proper hydration, and targeted treatments.",
    "Dark spots and uneven skin tone result from sun exposure, inflammation, or hormonal changes. Hyperpigmentation can be treated with brightening ingredients, exfoliation, and sun protection.",
    "The skin around the eyes is unique—it's thinner than the rest of the face and lacks sebaceous glands. This makes it more prone to dehydration, reduced elasticity, and a loss of suppleness over time.",
    "Sensitive skin reacts easily to environmental factors, skincare products, and temperature changes. It can lead to redness, irritation, and discomfort. Strengthening the skin barrier with soothing ingredients helps maintain balance.",
 ];
  List<String> titleImages = [
    'Dryness',
    'Oily Skin',
    "Acne & Blemishes",
    "Hyperpigmentation",
    "Eye Wrinkles",
    "Sensitivity & Redness",
  ];
    List<String> imagesPath = [
    Assets.images.infoImg1.path,
    Assets.images.infoImg2.path,
    Assets.images.infoImg3.path,
    Assets.images.infoImg4.path,
    Assets.images.infoImg5.path,
    Assets.images.infoImg6.path,
    
  ];
  List<String> step = [
    'First, before opening the camera, select the skin type that is on the bottom. Then are you ready to shoot? Take off your glasses, there should be no makeup and remove your hair from your face.',
    'Align your face with the frame on the screen. Hold the phone steady and make sure that the face is centered. Then a chat will open where you specify your age, sensitivity level, and so on.',
    'After that, we will select the care for you and give recommendations on facial care. We do not store your selfie — it is deleted after skin analysis.',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 23, right: 16),
                child: Image.asset(
                  Assets.images.splashLogo.path,
                  height: 56,
                ),
              ),
              const Gap(16),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  'Let us know about your skin',
                  style: AppTextStyles.fs16w700.copyWith(color: AppColors.mainColor, letterSpacing: -0.41),
                ),
              ),
              const Gap(16),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Text(
                  'Wash your face with a gentle cleanser and wait 15 - 30 minutes, then choose the icon that matches how your skin looks and feels.',
                  style: AppTextStyles.fs14w100.copyWith(color: Colors.black, letterSpacing: -0.41),
                ),
              ),
              const Gap(30),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Text(
                  """
THE SYSTEM 
ANALYZES ESSENTIAL 
ATTRIBUTIES OF YOUR SKIN""",
                  style: AppTextStyles.fs15w500.copyWith(color: Colors.black, letterSpacing: -0.41),
                ),
              ),
              const Gap(10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Divider(
                  thickness: 1,
                  color: AppColors.textFieldBorder.withOpacity(0.7),
                ),
              ),
              const Gap(24),
              SizedBox(
                height: 435,
                child: ListView.builder(
                  itemCount: imagesPath.length,
                  controller: _scrollImageController,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 16, right: 120),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: SizedBox(
                        width: 240,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              imagesPath[index],
                              height: 277,
                            ),
                            const Gap(22),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        titleImages[index],
                                        style: AppTextStyles.fs15w500
                                            .copyWith(color: AppColors.mainColor, letterSpacing: -0.41),

                                      ),
                                      const Gap(2),
                                      Text(descriptionImages[index],
                                          style: AppTextStyles.fs12w200.copyWith(
                                              // fontFamily: 'Poppins',
                                              letterSpacing: -0.11)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Row(
                  children: [
                    InkWell(
                      borderRadius: BorderRadius.circular(50),
                      onTap: currentIndex > 0 ? _scrollImageToPreviousCard : null,
                      child: Icon(
                        Icons.chevron_left,
                        size: 30,
                        color: currentIndex > 0 ? Colors.black : Colors.grey,
                      ),
                    ),
                    const Gap(10),
                    InkWell(
                      onTap: currentIndex < itemCount - 1 ? _scrollImageToNextCard : null,
                      borderRadius: BorderRadius.circular(50),
                      child: Icon(
                        Icons.chevron_right,
                        size: 30,
                        color: currentIndex < itemCount - 1 ? Colors.black : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(30),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Text(
                  """
HOW TO USE KUTIM 
STEP-BY-STEP
""",
                  style: AppTextStyles.fs15w500.copyWith(color: Colors.black, letterSpacing: -0.41),
                ),
              ),
              // const Gap(6),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Divider(
                  thickness: 1,
                  height: 1,
                  color: AppColors.textFieldBorder.withOpacity(0.7),
                ),
              ),
              const Gap(24),
              SizedBox(
                height: 320,
                child: ListView.builder(
                  itemCount: 3,
                  controller: _scrollSecondController,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 16, right: 120),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: SizedBox(
                        width: 241,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              Assets.images.instruction.path,
                              height: 190,
                            ),
                            const Gap(22),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Step ${index + 1}',
                                        style: AppTextStyles.fs15w500
                                            .copyWith(color: AppColors.mainColor, letterSpacing: -0.41),
                                      ),
                                      const Gap(2),
                                      Text(step[index],
                                          style: AppTextStyles.fs12w200.copyWith(
                                              // fontFamily: 'Poppins',
                                              letterSpacing: -0.11)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Row(
                  children: [
                    InkWell(
                      borderRadius: BorderRadius.circular(50),
                      onTap: currentSecondIndex > 0 ? _scrollToPreviousCard : null,
                      child: Icon(
                        Icons.chevron_left,
                        size: 30,
                        color: currentSecondIndex > 0 ? Colors.black : Colors.grey,
                      ),
                    ),
                    const Gap(10),
                    InkWell(
                      onTap: currentSecondIndex < itemSecondCount - 1 ? _scrollToNextCard : null,
                      borderRadius: BorderRadius.circular(50),
                      child: Icon(
                        Icons.chevron_right,
                        size: 30,
                        color: currentSecondIndex < itemSecondCount - 1 ? Colors.black : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(40),

              /// `chosing skin type`
              if (!isChoosing)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 23),
                  child: CustomButton(
                      onPressed: () {
                        isChoosing = true;
                        setState(() {});
                      },
                      style: CustomButtonStyles.mainButtonStyle(context),
                      child: const Text(
                        'Choose your skin type',
                        style: AppTextStyles.fs16w500,
                      )),
                )
              else
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Choose your type',
                        style: AppTextStyles.fs16w700.copyWith(color: AppColors.mainColor),
                      ),
                      const Gap(40),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    context.router.popUntil((route) => route.settings.name == LauncherRoute.name);
                                  },
                                  child: Image.asset(
                                    Assets.images.faceType1.path,
                                    height: 159,
                                  ),
                                ),
                                const Text(
                                  'Dry skin',
                                  style: AppTextStyles.fs15w400,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    context.router.popUntil((route) => route.settings.name == LauncherRoute.name);
                                  },
                                  child: Image.asset(
                                    Assets.images.faceType2.path,
                                    height: 159,
                                  ),
                                ),
                                const Text(
                                  'Oily skin',
                                  style: AppTextStyles.fs15w400,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Gap(40),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    context.router.popUntil((route) => route.settings.name == LauncherRoute.name);
                                  },
                                  child: Image.asset(
                                    Assets.images.faceType3.path,
                                    height: 159,
                                  ),
                                ),
                                const Text(
                                  'Normal skin',
                                  style: AppTextStyles.fs15w400,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    context.router.popUntil((route) => route.settings.name == LauncherRoute.name);
                                  },
                                  child: Image.asset(
                                    Assets.images.faceType4.path,
                                    height: 159,
                                  ),
                                ),
                                const Text(
                                  'Combination skin',
                                  style: AppTextStyles.fs15w400,
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),

              const Gap(30)
            ],
          ),
        ),
      ),
    );
  }
}
