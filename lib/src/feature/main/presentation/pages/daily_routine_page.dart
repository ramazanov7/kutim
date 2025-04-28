import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:kutim/src/core/gen/assets.gen.dart';
import 'package:kutim/src/core/theme/resources.dart';
import 'package:kutim/src/core/utils/extensions/context_extension.dart';
import 'package:kutim/src/feature/app/router/app_router.dart';

@RoutePage()
class DailyRoutinePage extends StatefulWidget {
  const DailyRoutinePage({super.key});

  @override
  State<DailyRoutinePage> createState() => _DailyRoutinePageState();
}

class _DailyRoutinePageState extends State<DailyRoutinePage> {
  int selectedDay = 0;

  List<String> day = ['Fri', 'Sat', 'Sun', 'Mon'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///
            /// <--`top`-->
            ///
            Container(
              height: 280,
              decoration: const BoxDecoration(
                  color: AppColors.backgroundColor2,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(217, 217, 217, 1),
                      blurRadius: 4,
                      spreadRadius: 0,
                      offset: Offset(0, 4),
                    ),
                  ]),
              child: Column(
                children: [
                  const Gap(64),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Gap(10),
                          IconButton(
                            onPressed: () {
                              context.router.maybePop();
                            },
                            icon: const Icon(Icons.chevron_left),
                          ),
                          const Gap(4),
                          Text(
                            'Daily Routine',
                            style: AppTextStyles.fs16w500.copyWith(letterSpacing: -0.41),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: IconButton(
                            onPressed: () {
                              context.router
                                  .push(InformationRoute(skinType: context.repository.authRepository.skinType ?? ''));
                            },
                            icon: SvgPicture.asset(Assets.icons.calendar.path)),
                      ),
                    ],
                  ),
                  const Gap(30),

                  ///
                  /// <--`circles`-->
                  ///
                  SizedBox(
                    height: 86,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 300), // Длительность анимации
                            curve: Curves.easeInOut, // Плавная анимация
                            width: selectedDay == index ? 86 : 70,
                            decoration: BoxDecoration(
                              color: selectedDay == index ? Colors.white : AppColors.circle,
                              shape: BoxShape.circle,
                            ),
                            child: InkWell(
                              onTap: () {
                                selectedDay = index;
                                setState(() {});
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(top: 13, bottom: 13),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '${index + 3}',
                                      style: selectedDay == index
                                          ? AppTextStyles.fs18w600.copyWith(letterSpacing: -0.41)
                                          : AppTextStyles.fs16w500.copyWith(letterSpacing: -0.41),
                                    ),
                                    Text(
                                      day[index],
                                      style: selectedDay == index
                                          ? AppTextStyles.fs12w400.copyWith(letterSpacing: -0.41)
                                          : AppTextStyles.fs11w300
                                              .copyWith(letterSpacing: -0.41, color: AppColors.textFieldBorder),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const Gap(12);
                        },
                        itemCount: 4),
                  ),
                ],
              ),
            ),
            const Gap(20),

            ///
            /// <--`products`-->
            ///
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 19),
              child: Text(
                'Stages of skin cleansing',
                style: AppTextStyles.fs14w400.copyWith(letterSpacing: -0.41),
              ),
            ),
            const Gap(11),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${skincareSteps[0]['title']}',
                            style: AppTextStyles.fs12w300
                                .copyWith(letterSpacing: -0.41, height: 1.7, color: Colors.black.withOpacity(0.74)),
                          ),
                          const Gap(4),
                          Text(
                            '${skincareSteps[0]['step']}',
                            style: AppTextStyles.fs12w200.copyWith(letterSpacing: -0.41),
                          ),
                          const Gap(10),
                          Container(
                              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
                              decoration: BoxDecoration(
                                  border: Border.all(color: AppColors.textFieldBorder),
                                  borderRadius: BorderRadius.circular(30)),
                              child: Image.asset(Assets.images.products.path)),
                          const Gap(20),
                          Text(
                            '${skincareSteps[2]['title']}',
                            style: AppTextStyles.fs12w300
                                .copyWith(letterSpacing: -0.41, height: 1.7, color: Colors.black.withOpacity(0.74)),
                          ),
                          const Gap(4),
                          Text(
                            '${skincareSteps[2]['step']}',
                            style: AppTextStyles.fs12w200.copyWith(letterSpacing: -0.41),
                          ),
                          const Gap(10),
                          Container(
                              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
                              decoration: BoxDecoration(
                                  border: Border.all(color: AppColors.textFieldBorder),
                                  borderRadius: BorderRadius.circular(30)),
                              child: Image.asset(Assets.images.products.path))
                        ],
                      ),
                    ),
                    const Gap(20),
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
                              decoration: BoxDecoration(
                                  border: Border.all(color: AppColors.textFieldBorder),
                                  borderRadius: BorderRadius.circular(30)),
                              child: Image.asset(Assets.images.products.path)),
                          const Gap(10),
                          Text(
                            '${skincareSteps[1]['title']}',
                            style: AppTextStyles.fs12w300
                                .copyWith(letterSpacing: -0.41, height: 1.7, color: Colors.black.withOpacity(0.74)),
                          ),
                          const Gap(4),
                          Text(
                            '${skincareSteps[1]['step']}',
                            style: AppTextStyles.fs12w200.copyWith(letterSpacing: -0.41),
                          ),
                          const Gap(20),
                          Container(
                              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
                              decoration: BoxDecoration(
                                  border: Border.all(color: AppColors.textFieldBorder),
                                  borderRadius: BorderRadius.circular(30)),
                              child: Image.asset(Assets.images.products.path)),
                          const Gap(10),
                          Text(
                            '${skincareSteps[3]['title']}',
                            style: AppTextStyles.fs12w300
                                .copyWith(letterSpacing: -0.41, height: 1.7, color: Colors.black.withOpacity(0.74)),
                          ),
                          const Gap(4),
                          Text(
                            '${skincareSteps[3]['step']}',
                            style: AppTextStyles.fs12w200.copyWith(letterSpacing: -0.41),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
            const Gap(50)
          ],
        ),
      ),
    );
  }

  final List<Map<String, String>> skincareSteps = [
    {
      'title': 'Dr.Ceuracle Cleansing Hydrophilic Oil with Probiotics',
      'step': 'Step 1',
      'image': Assets.images.products.path,
    },
    {
      'title': 'La Roche-Posay (Effaclar Gel)',
      'step': 'Step 2',
      'image': Assets.images.products.path,
    },
    {
      'title': 'The Ordinary Niacinamide 10% + Zinc 1%',
      'step': 'Step 3',
      'image': Assets.images.products.path,
    },
    {
      'title': 'Anua - Heartleaf 77% Soothing Toner',
      'step': 'Step 4',
      'image': Assets.images.products.path,
    },
  ];
}

class SkincareStepCard extends StatelessWidget {
  final String title;
  final String step;
  final String imagePath;

  const SkincareStepCard({
    super.key,
    required this.title,
    required this.step,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            step,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
