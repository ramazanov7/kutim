import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kutim/src/core/gen/assets.gen.dart';
import 'package:kutim/src/core/presentation/widgets/buttons/custom_button.dart';
import 'package:kutim/src/core/theme/resources.dart';

@RoutePage()
class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  XFile? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 27),
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
          ),
        ),
      ),
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
