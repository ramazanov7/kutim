import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:kutim/src/core/constant/constants.dart';
import 'package:kutim/src/core/gen/assets.gen.dart';
import 'package:kutim/src/core/theme/resources.dart';
import 'package:kutim/src/core/utils/image_util.dart';
import 'package:kutim/src/feature/app/router/app_router.dart';

@RoutePage()
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int imageIndex = 0;

  List<String> bannerImages = [
    NOT_FOUND_IMAGE,
    'https://blogs.bcm.edu/wp-content/uploads/2022/02/skincare-101.png',
    NO_IMAGE_AVAILABLE
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// <--`logo, icon`-->
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
              const Gap(16),

              /// <--`text`-->
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 27),
                child: Text(
                  'Hello User,',
                  style: AppTextStyles.fs24w400.copyWith(color: AppColors.mainColor, letterSpacing: -0.41),
                ),
              ),
              const Gap(16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 27),
                child: Text(
                  'Let’s take care of your skin !',
                  style: AppTextStyles.fs14w700
                      .copyWith(color: AppColors.textFieldBorder.withOpacity(0.7), letterSpacing: -0.41),
                ),
              ),
              const Gap(16),

              Container(
                margin: const EdgeInsets.only(left: 21, right: 21),
                decoration: const BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(217, 217, 217, 1),
                    blurRadius: 4,
                    spreadRadius: 0,
                    offset: Offset(0, 4),
                  ),
                ], color: AppColors.backgroundColor2, borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Material(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  child: InkWell(
                    onTap: () {
                      context.router.push(const DailyRoutineRoute());
                    },
                    borderRadius: BorderRadius.circular(10),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 13, left: 13, bottom: 11, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                                    border: Border.all(
                                      color: AppColors.backContainer,
                                    )),
                                padding: const EdgeInsets.only(left: 8, top: 8, right: 8, bottom: 7),
                                child: Image.asset(
                                  Assets.icons.dailyIcon.path,
                                  height: 31,
                                ),
                              ),
                              const Gap(22),
                              Text(
                                'Daily Routine',
                                style: AppTextStyles.fs16w600.copyWith(letterSpacing: -0.41),
                              )
                            ],
                          ),
                          Container(
                            width: 69,
                            height: 21,
                            padding: const EdgeInsets.only(left: 7, right: 5),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: AppColors.percent),
                            child: const Row(
                              children: [
                                Text('60%'),
                                Gap(8),
                                Expanded(
                                    child: LinearProgressIndicator(
                                  minHeight: 3,
                                  value: 60 / 100,
                                  backgroundColor: AppColors.backContainer,
                                  color: AppColors.mainColor,
                                  borderRadius: BorderRadius.all(Radius.circular(5)),
                                )),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const Gap(30),

              ///
              /// <--`products`-->
              ///
              SizedBox(
                height: 400,
                width: double.infinity,
                child: CarouselSlider(
                  options: CarouselOptions(
                    aspectRatio: 16 / 12,
                    autoPlay: true,
                    viewportFraction: 0.7,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,
                    onPageChanged: (index, reason) {
                      imageIndex = index;
                      setState(() {});
                    },
                  ),
                  items: bannerImages.map((item) {
                    return GestureDetector(
                      onTap: bannerImages.length <= 1
                          ? () {}
                          : () {
                              // Navigate to detail screen
                              // context.router.push(DetailImageRoute(image: widget.image, type: true));
                            },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.network(item,
                              fit: BoxFit.cover, height: 400, width: 250, loadingBuilder: ImageUtil.loadingBuilder),
                          // child: CachedNetworkImage(
                          //   imageUrl: item,
                          //   fit: BoxFit.cover,
                          //   height: 300,
                          //   width: 211,
                          //   progressIndicatorBuilder: ImageUtil.cachedLoadingBuilder,
                          // ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
