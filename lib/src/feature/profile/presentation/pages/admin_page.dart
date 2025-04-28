import 'dart:developer';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kutim/src/core/gen/assets.gen.dart';
import 'package:kutim/src/core/presentation/widgets/buttons/custom_button.dart';
import 'package:kutim/src/core/presentation/widgets/dialog/toaster.dart';
import 'package:kutim/src/core/presentation/widgets/other/custom_loading_overlay_widget.dart';
import 'package:kutim/src/core/presentation/widgets/textfields/custom_textfield.dart';
import 'package:kutim/src/core/theme/resources.dart';
import 'package:kutim/src/core/utils/extensions/context_extension.dart';
import 'package:kutim/src/feature/app/router/app_router.dart';
import 'package:kutim/src/feature/main/bloc/product_cubit.dart';
import 'package:loader_overlay/loader_overlay.dart';

@RoutePage()
class AdminPage extends StatefulWidget implements AutoRouteWrapper {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductCubit(repository: context.repository.mainRepository),
        ),
      ],
      child: this,
    );
  }
}

class _AdminPageState extends State<AdminPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  List<XFile> images = [];
  final ImagePicker _imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      overlayColor: AppColors.barrierColor,
      overlayWidgetBuilder: (progress) => const CustomLoadingOverlayWidget(),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: const Text(
              "Admin",
              style: AppTextStyles.fs16w500,
            ),
            centerTitle: false,
            leading: const BackButton(),
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Create product',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.fs16w500.copyWith(letterSpacing: -0.41),
                ),
                const Gap(30),
                Text(
                  'Name of product',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.fs14w300.copyWith(letterSpacing: -0.41),
                ),
                const Gap(10),
                SizedBox(
                  height: 46,
                  child: CustomTextField(
                    controller: nameController,
                    hintText: 'Enter name',
                    hintStyle: AppTextStyles.fs14w400.copyWith(height: 1.7),
                    floatingLabelStyle: AppTextStyles.fs16w400,
                    fillColor: AppColors.white,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: AppColors.textFieldBorder)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: AppColors.textFieldBorder)),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                ),
                const Gap(20),
                Text(
                  'Description of product',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.fs14w300.copyWith(letterSpacing: -0.41),
                ),
                const Gap(10),
                SizedBox(
                  height: 100,
                  child: CustomTextField(
                    controller: descriptionController,
                    hintText: 'Enter description',
                    hintStyle: AppTextStyles.fs14w400.copyWith(height: 1.7),
                    floatingLabelStyle: AppTextStyles.fs16w400,
                    fillColor: AppColors.white,
                    maxLines: 3,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: AppColors.textFieldBorder)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: AppColors.textFieldBorder)),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                ),
                const Gap(20),
                if (images.isEmpty)
                  SizedBox(
                    height: 120,
                    width: 170,
                    child: GestureDetector(
                      onTap: () {
                        showCupertinoModalPopup(
                          context: context,
                          builder: (context) {
                            return chooseCarImages(images);
                          },
                        );
                      },
                      child: Container(
                        // height: 102,
                        // padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 15),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: AppColors.mainColor.withOpacity(0.2), borderRadius: BorderRadius.circular(12)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // SvgPicture.asset(Assets.icons.addImage.path),
                            const Gap(8),
                            Text(
                              'Add photo',
                              textAlign: TextAlign.center,
                              style: AppTextStyles.fs13w400.copyWith(color: AppColors.mainColor, letterSpacing: -0.41),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                SizedBox(
                  height: 120,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      SizedBox(
                        height: 120,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: images.length == 5 ? images.length : images.length,
                          scrollDirection: Axis.horizontal,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.only(left: index == 0 ? 0 : 10.0),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(Radius.circular(12)),
                                child: Stack(
                                  children: [
                                    Image.file(
                                      File(images[index].path),
                                      height: 120,
                                      width: 170,
                                      fit: BoxFit.cover,
                                    ),
                                    Positioned(
                                      top: 2,
                                      right: 2,
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            images.removeAt(index);
                                          });
                                        },
                                        child: Container(
                                          decoration: const BoxDecoration(
                                              color: AppColors.backgroundInput, shape: BoxShape.circle),
                                          child: SvgPicture.asset(
                                            Assets.icons.close.path,
                                            height: 20,
                                            width: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const Gap(10),
                    ],
                  ),
                ),
                const Spacer(),
                BlocListener<ProductCubit, ProductState>(
                  listener: (context, state) {
                    state.maybeWhen(
                      loading: () => context.loaderOverlay.show(),
                      error: (message) {
                        context.loaderOverlay.hide();
                        Toaster.showErrorTopShortToast(context, message);
                      },
                      loadedAfterCreate: () {
                        context.router.replaceAll([LauncherRoute()]);
                        Toaster.showTopShortToast(context, message: 'Успешно');
                        context.loaderOverlay.hide();
                      },
                      orElse: () => context.loaderOverlay.hide(),
                    );
                  },
                  child: CustomButton(
                      onPressed: () {
                        log(nameController.text);
                        log(descriptionController.text);
                        log('$images');
                        BlocProvider.of<ProductCubit>(context).createProduct(
                            name: nameController.text, description: descriptionController.text, image: images.first);
                      },
                      style: null,
                      child: const Text('Create')),
                ),
                const Gap(30)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget chooseCarImages(List<XFile> images) {
    return CupertinoActionSheet(
      actions: [
        CupertinoActionSheetAction(
          onPressed: () async {
            if (images.length >= 10) {
              Toaster.showErrorTopShortToast(context, 'Можно выбрать не более 30 фото');
              return;
            }

            try {
              final imgCamera = await _imagePicker.pickImage(source: ImageSource.camera);
              if (imgCamera != null) {
                final XFile croppedFile = XFile(imgCamera.path);
                setState(() {
                  images.add(croppedFile);
                });
              }
            } catch (e) {
              debugPrint('Failed to pick image: $e');
              if (!context.mounted) {
                Toaster.showErrorTopShortToast(context, 'Ошибка при выборе фото: $e');
              }
            } finally {
              if (context.mounted) {
                context.router.maybePop();
              }
            }
          },
          child: Text(
            'Camera',
            style: AppTextStyles.fs16w400.copyWith(color: Colors.black),
          ),
        ),
        CupertinoActionSheetAction(
          onPressed: () async {
            if (images.length >= 10) {
              Toaster.showErrorTopShortToast(context, 'Можно выбрать не более 30 фото');
              return;
            }

            try {
              final pickedFile = await _imagePicker.pickImage(source: ImageSource.gallery);
              if (pickedFile != null) {
                final XFile croppedFile = XFile(pickedFile.path);
                setState(() {
                  images.add(croppedFile);
                });
              }
            } catch (e) {
              debugPrint('Failed to pick image: $e');
              if (!context.mounted) return;
              Toaster.showErrorTopShortToast(context, 'Ошибка при выборе фото: $e');
            } finally {
              if (context.mounted) {
                context.router.maybePop();
              }
            }
          },
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
  }
}
