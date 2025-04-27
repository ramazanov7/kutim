// ignore_for_file: deprecated_member_use, use_build_context_synchronously

import 'dart:developer';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:kutim/src/core/constant/constants.dart';
import 'package:kutim/src/core/gen/assets.gen.dart';
import 'package:kutim/src/core/presentation/widgets/textfields/custom_textfield.dart';
import 'package:kutim/src/feature/app/bloc/app_bloc.dart';
import 'package:kutim/src/feature/auth/presentation/pages/register_page.dart';
import 'package:kutim/src/feature/profile/bloc/profile_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kutim/src/feature/profile/bloc/profile_edit_cubit.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:kutim/src/core/presentation/widgets/buttons/custom_button.dart';
import 'package:kutim/src/core/presentation/widgets/dialog/toaster.dart';
import 'package:kutim/src/core/presentation/widgets/other/custom_loading_overlay_widget.dart';
import 'package:kutim/src/core/presentation/widgets/textfields/custom_validator_textfield.dart';
import 'package:kutim/src/core/theme/resources.dart';
import 'package:kutim/src/core/utils/extensions/context_extension.dart';
import 'package:kutim/src/core/utils/input/validator_util.dart';
import 'package:kutim/src/feature/app/presentation/widgets/custom_appbar_widget.dart';
import 'package:kutim/src/feature/app/router/app_router.dart';
import 'package:kutim/src/feature/auth/models/user_dto.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

@RoutePage()
class EditProfilePage extends StatefulWidget implements AutoRouteWrapper {
  const EditProfilePage({super.key, this.user});
  final UserDTO? user;

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProfileEditCubit(repository: context.repository.profileRepository),
        ),
      ],
      child: this,
    );
  }
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController surnameController = TextEditingController(text: 'Mark');
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final ValueNotifier<String?> _surnameError = ValueNotifier(null);
  final ValueNotifier<String?> _phoneError = ValueNotifier(null);
  final ValueNotifier<String?> _passwordError = ValueNotifier(null);
  final ValueNotifier<String?> _emailError = ValueNotifier(null);
  final ValueNotifier<bool> _allowTapButton = ValueNotifier(false);
  final ValueNotifier<bool> _obscureText = ValueNotifier(true);

  String imageNetwork = '';
  XFile? image;

  final FocusNode passwordFocus = FocusNode();

  String? phoneNumber;
  MaskTextInputFormatter maskPhoneFormatter = MaskTextInputFormatter(
    mask: '+#(###) ###-##-##',
    filter: {"#": RegExp('[0-9]')},
  );

  @override
  void dispose() {
    surnameController.dispose();
    passwordController.dispose();
    emailController.dispose();
    _surnameError.dispose();
    _emailError.dispose();
    _passwordError.dispose();
    _allowTapButton.dispose();
    passwordFocus.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    surnameController.text = widget.user?.fullName ?? '';
    phoneController.text = widget.user?.email ?? '';
    imageNetwork = widget.user?.avatar ?? '';
    // parsePhoneNumber('${widget.user?.phone}');

    // phoneNumber = selectedCountry?.code + phoneController.text.replaceAll(RegExp(r'[^0-9]'), '');

    // phoneController.text = widget.user?.phone ?? '';
    // _nameController.text = widget.user.name ?? '';
    // checkAllowTapButton();
  }

  // void parsePhoneNumber(String phoneNumber) {
  //   if (phoneNumber.startsWith("+7")) {
  //     selectedCountry = countries.firstWhere((c) => c.code == "+7", orElse: () => selectedCountry!);
  //     phoneController.text = phoneNumber.substring(2); // Убираем "+7"
  //   } else if (phoneNumber.startsWith("+998")) {
  //     selectedCountry = countries.firstWhere((c) => c.code == "+998", orElse: () => selectedCountry!);
  //     phoneController.text = phoneNumber.substring(4); // Убираем "+998"
  //   } else {
  //     selectedCountry = null; // Если код неизвестен
  //     phoneController.text = phoneNumber; // Записываем весь номер
  //   }
  // }
  bool isValidEmail(String value) {
    const pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    final regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  bool checkAllowTapButton() {
    final isPasswordValid = passwordController.text.length >= 6 || passwordController.text == '';

    final isNameValid = surnameController.text != '';

    return isNameValid && emailController.text.isNotEmpty && isValidEmail(emailController.text);
  }

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      overlayWidgetBuilder: (progress) => const CustomLoadingOverlayWidget(),
      overlayColor: AppColors.barrierColor,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          // resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text(
              "Skin Profile",
              style: AppTextStyles.fs16w500,
            ),
            centerTitle: false,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: SvgPicture.asset(Assets.icons.concerns.path),
              )
            ],
          ),
          body: SafeArea(
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 28),
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        decoration: const BoxDecoration(
                            color: AppColors.backgroundColor2, borderRadius: BorderRadius.all(Radius.circular(16))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ///
                            /// <--`Аватар`-->
                            ///
                            const Gap(16),
                            Center(
                              child: GestureDetector(
                                onTap: () {
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
                                              'Camera',
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
                                child: SizedBox(
                                  height: 110,
                                  width: 110,
                                  child: Stack(
                                    alignment: Alignment.topCenter,
                                    children: [
                                      Container(
                                        height: 110,
                                        width: 110,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          // border: Border.all(color: AppColors.mainColor, width: 3),

                                          // boxShadow: [
                                          //   BoxShadow(
                                          //     color: Colors.black.withOpacity(0.1),
                                          //     blurRadius: 5.6,
                                          //   ),
                                          // ],
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(6.6),
                                          child: ClipRRect(
                                            borderRadius: const BorderRadius.all(Radius.circular(100)),
                                            child: image != null
                                                ? Image.file(
                                                    File(image?.path ?? ''),
                                                    fit: BoxFit.cover,
                                                  )
                                                : imageNetwork.isNotEmpty
                                                    ? Image.network(
                                                        imageNetwork,
                                                        fit: BoxFit.cover,
                                                      )
                                                    : Stack(
                                                        children: [
                                                          Container(
                                                            // color: Colors.white,
                                                            decoration: const BoxDecoration(
                                                              shape: BoxShape.circle,
                                                            ),
                                                            child: Image.network(
                                                              NOT_FOUND_IMAGE,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          Container(
                                                            // margin: const EdgeInsets.all(10),
                                                            decoration: BoxDecoration(
                                                              shape: BoxShape.circle,
                                                              color: Colors.black.withOpacity(0.3),
                                                            ),
                                                          ),
                                                          // Positioned(child: SvgPicture.asset(Assets.icons.camera.path)),
                                                        ],
                                                      ),
                                          ),
                                        ),
                                      ),
                                      // Padding(
                                      //   padding: const EdgeInsets.all(38.65),
                                      //   child: Container(
                                      //     decoration: const BoxDecoration(
                                      //       borderRadius: BorderRadius.all(Radius.circular(100)),
                                      //     ),
                                      //     child: Center(child: SvgPicture.asset(Assets.icons.icCamera.path)),
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const Gap(18),

                            Text(
                              'Full name',
                              style: AppTextStyles.fs14w500.copyWith(color: AppColors.text),
                            ),
                            const Gap(8),

                            ///
                            /// <--`edit surname`-->
                            ///
                            CustomValidatorTextfield(
                              controller: surnameController,
                              valueListenable: _surnameError,
                              hintText: 'Enter full name',
                              onChanged: (value) {
                                checkAllowTapButton();
                                setState(() {});
                              },
                              validator: (String? value) {
                                // if (value == null || value.isEmpty) {
                                //   return _surnameError.value = context.localized.required_to_fill;
                                // }

                                return _surnameError.value = null;
                              },
                            ),
                            const Gap(12),
                            Text(
                              'Email',
                              style: AppTextStyles.fs14w500.copyWith(color: AppColors.text),
                            ),
                            const Gap(8),

                            ///
                            /// <--`edit phone`-->
                            ///
                            CustomValidatorTextfield(
                              controller: phoneController,
                              valueListenable: _phoneError,
                              hintText: 'Enter your email',
                              keyboardType: TextInputType.emailAddress,
                              // inputFormatters: [maskPhoneFormatter],
                              onChanged: (value) {
                                checkAllowTapButton();
                                setState(() {});
                              },
                              validator: (String? value) {
                                return _phoneError.value = ValidatorUtil.emailValidator(
                                  phoneController.text,
                                  errorLabel: '',
                                );
                              },
                            ),
                            const Gap(12),

                            Text(
                              'Password (if want to change)',
                              style: AppTextStyles.fs14w500.copyWith(color: AppColors.text),
                            ),
                            const Gap(8),

                            ///
                            /// password
                            ///
                            ValueListenableBuilder(
                              valueListenable: _obscureText,
                              builder: (context, v, c) {
                                return CustomValidatorTextfield(
                                  focusNode: passwordFocus,
                                  obscureText: _obscureText,
                                  controller: passwordController,
                                  valueListenable: _passwordError,
                                  hintText: 'Enter password',
                                  onChanged: (value) {
                                    checkAllowTapButton();
                                    setState(() {});
                                  },
                                );
                              },
                            ),
                            const Gap(16),

                            // ///
                            // /// delete account
                            // ///
                            // BlocListener<ProfileBLoC, ProfileState>(
                            //   listener: (context, state) {
                            //     state.maybeWhen(
                            //       error: (message) {
                            //         context.loaderOverlay.hide();
                            //         Toaster.showErrorTopShortToast(context, message);
                            //       },
                            //       loading: () {
                            //         context.loaderOverlay.show();
                            //       },
                            //       orElse: () {
                            //         context.loaderOverlay.hide();
                            //       },
                            //       exited: (message) {
                            //         context.loaderOverlay.hide();
                            //         Toaster.showTopShortToast(context, message: 'Успешно');
                            //         context.router.popUntil((route) => route.settings.name == LauncherRoute.name);
                            //         BlocProvider.of<AppBloc>(context).add(const AppEvent.exiting());
                            //       },
                            //     );
                            //   },
                            //   child: GestureDetector(
                            //     onTap: () {
                            //       LogoutBottomSheet.show(
                            //         context,
                            //         isDeleteAccount: true,
                            //         onPressed: () {
                            //           BlocProvider.of<ProfileBLoC>(context).add(const ProfileEvent.deleteAccount());
                            //           Navigator.pop(context);
                            //         },
                            //       ).whenComplete(() {
                            //         FocusScope.of(context).unfocus();
                            //       });
                            //     },
                            //     child: Center(
                            //       child: Text(
                            //         context.localized.delete_an_account,
                            //         style: AppTextStyles.fs16w500.copyWith(color: Colors.red),
                            //         textAlign: TextAlign.center,
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            // const Gap(16),
                          ],
                        ),
                      ),
                      // const Spacer(),
                      const Gap(170),

                      ///
                      /// <--`save button`-->
                      ///
                      BlocListener<ProfileEditCubit, ProfileEditState>(
                        listener: (context, state) {
                          state.maybeWhen(
                            error: (message) {
                              context.loaderOverlay.hide();
                              Toaster.showErrorTopShortToast(context, message);
                              //
                            },
                            loading: () {
                              context.loaderOverlay.show();
                            },
                            loaded: () {
                              context.loaderOverlay.hide();
                              context.router.popUntil((route) => route.settings.name == LauncherRoute.name);
                              BlocProvider.of<ProfileBLoC>(context).add(const ProfileEvent.getProfile());
                            },
                            orElse: () {
                              context.loaderOverlay.hide();
                            },
                          );
                        },
                        child: CustomButton(
                          // allowTapButton: _allowTapButton,
                          onPressed: () {
                            // if (_formKey.currentState!.validate()) {
                            // if (checkAllowTapButton()) {
                            log(phoneController.text.length.toString());
                            log('$image', name: 'image');
                            log(surnameController.text, name: 'name');
                            log(maskPhoneFormatter.getUnmaskedText(), name: 'phone');
                            log(passwordController.text, name: 'password');
                            BlocProvider.of<ProfileEditCubit>(context).editAccount(
                                password: passwordController.text,
                                fullName: surnameController.text,
                                avatar: image,
                                email: phoneController.text);
                          },
                          style: CustomButtonStyles.mainButtonStyle(context),
                          child: Text('Save', style: AppTextStyles.fs16w600.copyWith(color: Colors.white)),
                          //const Color(0xff656464)
                        ),
                      ),
                      const Gap(16),
                      // GestureDetector(
                      //     onTap: () {},
                      //     child: Text('Удалить аккаунт', style: AppTextStyles.fs16w600.copyWith(color: Colors.black))),
                    ],
                  ),
                ),
              ),
            ),
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
