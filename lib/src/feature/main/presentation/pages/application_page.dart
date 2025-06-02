import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kutim/src/core/gen/assets.gen.dart';
import 'package:kutim/src/core/presentation/widgets/buttons/custom_button.dart';
import 'package:kutim/src/core/presentation/widgets/dialog/toaster.dart';
import 'package:kutim/src/core/theme/resources.dart';
import 'package:kutim/src/core/utils/extensions/context_extension.dart';
import 'package:kutim/src/feature/app/router/app_router.dart';
import 'package:kutim/src/feature/main/bloc/image_python_cubit.dart';
import 'package:kutim/src/feature/main/bloc/scan_cubit.dart';
import 'package:kutim/src/feature/main/model/scan_dto.dart';
import 'package:loader_overlay/loader_overlay.dart';

@RoutePage()
class ApplicationPage extends StatefulWidget implements AutoRouteWrapper {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ImagePythonCubit(repository: context.repository.mainRepository),
        ),
      ],
      child: this,
    );
  }
}

class _ApplicationPageState extends State<ApplicationPage> {
  XFile? image;

  ScanDTO? scanDTO;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ImagePythonCubit, ImagePythonState>(
      listener: (context, state) {
        state.maybeWhen(
          error: (message) {
            context.loaderOverlay.hide();
            Toaster.showErrorTopShortToast(context, 'No defects detected');
            //
          },
          loading: () {
            context.loaderOverlay.show();
          },
          loaded: (scanDTO) {
            scanDTO = scanDTO;
            context.router.replaceAll([LauncherRoute(), ScanResultRoute(image: image, scanDTO: scanDTO)]);

            context.loaderOverlay.hide();
          },
          orElse: () {
            context.loaderOverlay.hide();
          },
        );
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 27),
              child: image == null
                  ? Column(
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
                          'Prepare for the skin scan',
                          style: AppTextStyles.fs24w700.copyWith(color: AppColors.mainColor, letterSpacing: -0.41),
                        ),
                        const Gap(20),
                        Image.asset(Assets.images.scan.path),
                        const Gap(10),
                        Text(
                          'We use artificial intelligence to analyze your skin and choose the right care.',
                          style: AppTextStyles.fs16w500.copyWith(color: Colors.black, letterSpacing: -0.41),
                        ),
                        const Gap(15),
                        Text(
                          'For a better result, please:',
                          style: AppTextStyles.fs16w500.copyWith(color: Colors.black, letterSpacing: -0.41),
                        ),
                        const Gap(13),
                        Row(
                          children: [
                            SvgPicture.asset(Assets.icons.vector.path),
                            const Gap(20),
                            Text(
                              'Make sure you are in a well-lit room.',
                              style: AppTextStyles.fs16w500.copyWith(color: Colors.black, letterSpacing: -0.41),
                            ),
                          ],
                        ),
                        const Gap(13),
                        Row(
                          children: [
                            SvgPicture.asset(Assets.icons.vector.path),
                            const Gap(20),
                            Expanded(
                              child: Text(
                                'Take off your glasses and remove your hair from your face.',
                                style: AppTextStyles.fs16w500.copyWith(color: Colors.black, letterSpacing: -0.41),
                              ),
                            ),
                          ],
                        ),
                        const Gap(13),
                        Row(
                          children: [
                            SvgPicture.asset(Assets.icons.vector.path),
                            const Gap(20),
                            Text(
                              'Look directly into the camera.',
                              style: AppTextStyles.fs16w500.copyWith(color: Colors.black, letterSpacing: -0.41),
                            ),
                          ],
                        ),
                        const Spacer(),
                        CustomButton(
                            onPressed: () {
                              // context.router.push(OnboardingRoute(
                              //   onGoAuthPressed: () {
                              //     context.router.push(const LoginRoute());
                              //   },
                              // ));
                              showCupertinoModalPopup(
                                context: context,
                                builder: (context) {
                                  return CupertinoActionSheet(
                                    actions: [
                                      CupertinoActionSheetAction(
                                        onPressed: () => pickImageFromGallery(
                                          ImageSource.camera,
                                        ).whenComplete(() {
                                          if (context.mounted) {
                                            context.router.maybePop();
                                          }
                                          setState(() {});
                                        }),
                                        child: Text(
                                          'Take a photo',
                                          style: AppTextStyles.fs16w400.copyWith(color: Colors.black),
                                        ),
                                      ),
                                      CupertinoActionSheetAction(
                                        onPressed: () => pickImageFromGallery(
                                          ImageSource.gallery,
                                        ).whenComplete(() {
                                          if (context.mounted) {
                                            context.router.maybePop();
                                          }
                                          setState(() {});
                                        }),
                                        child: Text(
                                          'Gallery',
                                          style: AppTextStyles.fs16w400.copyWith(color: Colors.black),
                                        ),
                                      ),
                                    ],
                                    cancelButton: CupertinoActionSheetAction(
                                      onPressed: () {
                                        context.router.maybePop();
                                      },
                                      child: Text(
                                        'Cancel',
                                        style: AppTextStyles.fs16w400.copyWith(color: Colors.red),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            style: CustomButtonStyles.mainButtonStyle(context),
                            child: const Text('Start scanning')),
                        const Gap(20)
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                        Stack(
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
                                File(image?.path ?? ''),
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 0,
                              right: 0,
                              child: GestureDetector(
                                onTap: () {
                                  // _removeImage(index);
                                  // log('$_images');
                                  image = null;
                                  setState(() {});
                                },
                                child: const CircleAvatar(
                                  radius: 12,
                                  backgroundColor: Colors.white,
                                  child: Icon(Icons.close, size: 16),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Gap(20),
                        CustomButton(
                            onPressed: () {
                              BlocProvider.of<ImagePythonCubit>(context).imagePython(image: image);
                            },
                            style: CustomButtonStyles.mainButtonStyle(context),
                            child: const Text('Start scanning')),
                        const Gap(20)
                      ],
                    ),
            ),
          ),
        );
      },
    );
  }

  Future pickImageFromGallery(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imageTemporary = XFile(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      debugPrint('Failed to pick image: $e');
    }
  }
}
