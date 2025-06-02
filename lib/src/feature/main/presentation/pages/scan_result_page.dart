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
class ScanResultPage extends StatefulWidget implements AutoRouteWrapper {
  const ScanResultPage({super.key, this.image, required this.scanDTO});

  final XFile? image;
  final ScanDTO scanDTO;

  @override
  State<ScanResultPage> createState() => _ScanResultPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ScanCubit(repository: context.repository.mainRepository),
        ),
      ],
      child: this,
    );
  }
}

class _ScanResultPageState extends State<ScanResultPage> {
  @override
  void initState() {
    log('${widget.scanDTO}');
    BlocProvider.of<ScanCubit>(context)
        .scan(skinType: widget.scanDTO.skinType ?? 'null', url: widget.scanDTO.imageUrl ?? 'null');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ScanCubit, ScanState>(
      listener: (context, state) {},
      builder: (context, state) {
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            context.router.push(DetailAvatarRoute(xFile: widget.image));
                          },
                          child: Container(
                            height: 200,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(8)),
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
                        ),
                        state.maybeWhen(
                          orElse: () => const CircularProgressIndicator.adaptive(
                            backgroundColor: AppColors.mainColor,
                          ),
                          loaded: (scanDTO) => GestureDetector(
                            onTap: () {
                              context.router.push(DetailAvatarRoute(image: scanDTO.imageUrl));
                            },
                            child: Container(
                              height: 200,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(Radius.circular(8)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 5.6,
                                  ),
                                ],
                              ),
                              child: Image.network(
                                scanDTO.imageUrl ?? NOT_FOUND_IMAGE,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Gap(30),
                    // state.maybeWhen(
                    //   orElse: () => Container(),
                    //   loaded: (scanDTO) => (scanDTO.scanResults ?? []).isNotEmpty
                    //       ? ListView.separated(
                    //           shrinkWrap: true,
                    //           physics: const NeverScrollableScrollPhysics(),
                    //           padding: EdgeInsets.zero,
                    //           itemBuilder: (context, index) {
                    //             return Row(
                    //               children: [
                    //                 Container(
                    //                   height: 8,
                    //                   width: 8,
                    //                   decoration: const BoxDecoration(
                    //                     shape: BoxShape.circle,
                    //                     color: AppColors.mainColor,
                    //                   ),
                    //                 ),
                    //                 const Gap(20),
                    //                 Text(
                    //                   scanDTO.scanResults?[index].name ?? '',
                    //                   style: AppTextStyles.fs16w400.copyWith(color: Colors.black, letterSpacing: -0.41),
                    //                 ),
                    //               ],
                    //             );
                    //           },
                    //           separatorBuilder: (context, index) => const Gap(12),
                    //           itemCount: (scanDTO.scanResults ?? []).length)
                    //       : const Text('dfg'),
                    // ),
                    state.maybeWhen(
                      orElse: () => Container(),
                      loaded: (scanDTO) => Text('Defect: ${widget.scanDTO.skinType}'),
                    ),
                    const Gap(30),
                    const Divider(
                      thickness: 1,
                      height: 1,
                    ),
                    state.maybeWhen(
                        orElse: () => const Text('dfgd'),
                        loaded: (scanDTO) => ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.only(top: 15),
                            itemBuilder: (context, index) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Step ${index + 1}',
                                    style: AppTextStyles.fs15w500.copyWith(color: Colors.black, letterSpacing: -0.41),
                                  ),
                                  Text(
                                    '${scanDTO.scanResults?[index].name}',
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
                                                '${scanDTO.scanResults?[index].description}',
                                                textAlign: TextAlign.start,
                                                style: AppTextStyles.fs13w400
                                                    .copyWith(letterSpacing: -0.41, fontWeight: FontWeight.w400),
                                              ),
                                              const Gap(5),
                                            ],
                                          ),
                                        ),
                                        const Gap(5),
                                        CachedNetworkImage(
                                          imageUrl: scanDTO.scanResults?[index].image ?? NOT_FOUND_IMAGE,
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
                            itemCount:
                                (scanDTO.scanResults ?? []).length > 4 ? 4 : (scanDTO.scanResults ?? []).length)),
                    const Gap(50),
                    state.maybeWhen(
                      orElse: () => CustomButton(
                          onPressed: () {
                            // context.router.replaceAll([LauncherRoute(), const BaseMainTab(), DailyRoutineRoute(scanDTO: )]);
                          },
                          style: CustomButtonStyles.mainButtonStyle(context),
                          child: const Text('Care plan')),
                      loaded: (scanDTO) => CustomButton(
                          onPressed: () {
                            context.router.push(DailyRoutineRoute(scanDTO: scanDTO));
                          },
                          style: CustomButtonStyles.mainButtonStyle(context),
                          child: const Text('Care plan')),
                    ),
                    const Gap(20)
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
