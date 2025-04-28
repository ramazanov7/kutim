// ignore_for_file: deprecated_member_use

import 'dart:developer';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kutim/src/core/constant/constants.dart';
import 'package:kutim/src/core/gen/assets.gen.dart';
import 'package:kutim/src/core/presentation/widgets/buttons/custom_button.dart';
import 'package:kutim/src/core/theme/resources.dart';
import 'package:kutim/src/core/utils/extensions/context_extension.dart';
import 'package:kutim/src/core/utils/image_util.dart';
import 'package:kutim/src/feature/app/router/app_router.dart';
import 'package:kutim/src/feature/main/bloc/scan_cubit.dart';
import 'package:kutim/src/feature/main/model/scan_dto.dart';

@RoutePage()
class ScanResultPage extends StatefulWidget {
  const ScanResultPage({super.key, this.image, required this.scanDTO});

  final XFile? image;
  final ScanDTO scanDTO;

  @override
  State<ScanResultPage> createState() => _ScanResultPageState();
}

class _ScanResultPageState extends State<ScanResultPage> {
  @override
  void initState() {
    log('${widget.scanDTO}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 27),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      Assets.images.splashLogo.path,
                      height: 56,
                    ),
                  ],
                ),
                Text(
                  'Scan results',
                  style: AppTextStyles.fs24w700.copyWith(color: AppColors.mainColor, letterSpacing: -0.41),
                ),
                const Gap(10),
                Text(
                  'Your current skin condition',
                  style: AppTextStyles.fs16w700.copyWith(color: AppColors.base400, letterSpacing: -0.41),
                ),
                const Gap(33),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 200,
                      // width: 150,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        // shape: BoxShape.circle,
                        borderRadius: const BorderRadius.all(Radius.circular(8)),
                        // border: Border.all(color: Colors.green, width: 2),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 5.6,
                          ),
                        ],
                      ),
                      child: Image.file(
                        File(widget.image?.path ?? ''),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                const Gap(30),
                ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Container(
                            height: 8,
                            width: 8,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.mainColor,
                            ),
                          ),
                          const Gap(20),
                          Text(
                            widget.scanDTO.conditions?[index] ?? '',
                            style: AppTextStyles.fs16w400.copyWith(color: Colors.black, letterSpacing: -0.41),
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) => const Gap(12),
                    itemCount: (widget.scanDTO.conditions ?? []).length),
                const Gap(30),
                const Divider(
                  thickness: 1,
                  height: 1,
                ),
                ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.only(top: 15),
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Step ${widget.scanDTO.steps?[index].step}',
                            style: AppTextStyles.fs15w500.copyWith(color: Colors.black, letterSpacing: -0.41),
                          ),
                          Text(
                            '${widget.scanDTO.steps?[index].title}',
                            style: AppTextStyles.fs15w400.copyWith(color: Colors.black, letterSpacing: -0.41),
                          ),
                          const Gap(18),
                          Container(
                            clipBehavior: Clip.antiAlias,
                            margin: const EdgeInsets.all(5),
                            padding: const EdgeInsets.only(top: 17, left: 20, bottom: 15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: AppColors.mainColor.withOpacity(0.46),
                                    blurRadius: 4,
                                    offset: const Offset(0, 4)),
                              ],
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Gap(8),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${widget.scanDTO.steps?[index].product?.name}',
                                        textAlign: TextAlign.start,
                                        style: AppTextStyles.fs14w500.copyWith(letterSpacing: -0.41),
                                      ),
                                      const Gap(5),
                                      Text(
                                        '${widget.scanDTO.steps?[index].product?.volume}',
                                        textAlign: TextAlign.start,
                                        style: AppTextStyles.fs13w400
                                            .copyWith(letterSpacing: -0.41, fontWeight: FontWeight.w200),
                                      ),
                                      const Gap(5),
                                      Text(
                                        '${widget.scanDTO.steps?[index].product?.description}',
                                        textAlign: TextAlign.start,
                                        style: AppTextStyles.fs13w400
                                            .copyWith(letterSpacing: -0.41, fontWeight: FontWeight.w400),
                                      ),
                                      const Gap(5),
                                      Text(
                                        'For: ${widget.scanDTO.steps?[index].product?.skinType}',
                                        textAlign: TextAlign.start,
                                        style: AppTextStyles.fs13w400
                                            .copyWith(letterSpacing: -0.41, fontWeight: FontWeight.w200),
                                      ),
                                      const Gap(5),
                                      Text(
                                        'Use: ${widget.scanDTO.steps?[index].product?.usage}',
                                        textAlign: TextAlign.start,
                                        style: AppTextStyles.fs13w400
                                            .copyWith(letterSpacing: -0.41, fontWeight: FontWeight.w200),
                                      ),
                                    ],
                                  ),
                                ),
                                const Gap(5),
                                CachedNetworkImage(
                                  imageUrl: widget.scanDTO.steps?[index].product?.image ?? NOT_FOUND_IMAGE,
                                  height: 120,
                                  fit: BoxFit.cover,
                                  progressIndicatorBuilder: ImageUtil.cachedLoadingBuilder,
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) => const Gap(15),
                    itemCount: (widget.scanDTO.steps ?? []).length),
                const Gap(50),
                CustomButton(
                    onPressed: () {
                      context.router.replaceAll([LauncherRoute(), const BaseMainTab(), const DailyRoutineRoute()]);
                    },
                    style: CustomButtonStyles.mainButtonStyle(context),
                    child: const Text('Care plan')),
                const Gap(20)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
