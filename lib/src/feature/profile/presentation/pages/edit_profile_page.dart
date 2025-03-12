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
class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key, this.user});
  final UserDTO? user;

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
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
    surnameController.text = widget.user?.name ?? '';
    emailController.text = widget.user?.email ?? '';
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

  // bool checkAllowTapButton() {
  //   final isEmailValid = ValidatorUtil.emailValidator(
  //         emailController.text,
  //         errorLabel: 'Неверный логин',
  //       ) ==
  //       null;
  //   final isPasswordValid = passwordController.text.length >= 6 || passwordController.text == '';
  //   String phoneUnmasked = phoneController.text.replaceAll(RegExp(r'[^0-9]'), '');
  //   bool isPhoneValid = phoneUnmasked.length == selectedCountry?.digitLength;

  //   return _allowTapButton.value = surnameController.text.isNotEmpty && isEmailValid && isPhoneValid && isPasswordValid;
  // }

  @override
  Widget build(BuildContext context) {
    final double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    return LoaderOverlay(
      overlayWidgetBuilder: (progress) => const CustomLoadingOverlayWidget(),
      overlayColor: AppColors.barrierColor,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: const Scaffold(
            // resizeToAvoidBottomInset: false,
            // appBar: CustomAppBar(
            //   title: context.localized.editProfile,
            //   actions: [
            //     Container(
            //       width: 40,
            //     )
            //   ],
            // ),
            // // appBar: CustomAppBar(
            // //   quarterTurns: 0,
            // //   title: context.localized.editProfile,
            // //   shape: const Border(),
            // // ),
            // body: SafeArea(
            //   child: Form(
            //     key: _formKey,
            //     // autovalidateMode: AutovalidateMode.onUserInteraction,
            //     child: SingleChildScrollView(
            //       child: Padding(
            //         padding: const EdgeInsets.symmetric(horizontal: 16),
            //         child: Column(
            //           children: [
            //             Container(
            //               padding: EdgeInsets.only(bottom: keyboardHeight),
            //               child: Column(
            //                 crossAxisAlignment: CrossAxisAlignment.start,
            //                 children: [
            //                   ///
            //                   /// edit avatar
            //                   ///
            //                   const Gap(17),
            //                   Center(
            //                     child: GestureDetector(
            //                       onTap: () {
            //                         showCupertinoModalPopup(
            //                           context: context,
            //                           builder: (context) {
            //                             return CupertinoActionSheet(
            //                               actions: [
            //                                 CupertinoActionSheetAction(
            //                                   onPressed: () => pickImageFromGallery(
            //                                     ImageSource.camera,
            //                                   ).whenComplete(() {
            //                                     if (context.mounted) {
            //                                       context.router.maybePop();
            //                                     }
            //                                     setState(() {});
            //                                   }),
            //                                   child: Text(
            //                                     context.localized.camera,
            //                                     style: AppTextStyles.fs16w400.copyWith(color: Colors.black),
            //                                   ),
            //                                 ),
            //                                 CupertinoActionSheetAction(
            //                                   onPressed: () => pickImageFromGallery(
            //                                     ImageSource.gallery,
            //                                   ).whenComplete(() {
            //                                     if (context.mounted) {
            //                                       context.router.maybePop();
            //                                     }
            //                                     setState(() {});
            //                                   }),
            //                                   child: Text(
            //                                     context.localized.gallery,
            //                                     style: AppTextStyles.fs16w400.copyWith(color: Colors.black),
            //                                   ),
            //                                 ),
            //                               ],
            //                               cancelButton: CupertinoActionSheetAction(
            //                                 onPressed: () {
            //                                   context.router.maybePop();
            //                                 },
            //                                 child: Text(
            //                                   context.localized.cancel,
            //                                   style: AppTextStyles.fs16w400.copyWith(color: Colors.red),
            //                                 ),
            //                               ),
            //                             );
            //                           },
            //                         );
            //                       },
            //                       child: SizedBox(
            //                         height: 110,
            //                         width: 110,
            //                         child: Stack(
            //                           alignment: Alignment.topCenter,
            //                           children: [
            //                             Container(
            //                               height: 110,
            //                               width: 110,
            //                               clipBehavior: Clip.antiAlias,
            //                               decoration: BoxDecoration(
            //                                 shape: BoxShape.circle,
            //                                 border: Border.all(color: AppColors.mainColor, width: 3),

            //                                 // boxShadow: [
            //                                 //   BoxShadow(
            //                                 //     color: Colors.black.withOpacity(0.1),
            //                                 //     blurRadius: 5.6,
            //                                 //   ),
            //                                 // ],
            //                               ),
            //                               child: Padding(
            //                                 padding: const EdgeInsets.all(6.6),
            //                                 child: ClipRRect(
            //                                   borderRadius: const BorderRadius.all(Radius.circular(100)),
            //                                   child: image != null
            //                                       ? Image.file(
            //                                           File(image?.path ?? ''),
            //                                           fit: BoxFit.cover,
            //                                         )
            //                                       : imageNetwork.isNotEmpty
            //                                           ? Image.network(
            //                                               imageNetwork,
            //                                               fit: BoxFit.cover,
            //                                             )
            //                                           : Stack(
            //                                               children: [
            //                                                 Container(
            //                                                   // color: Colors.white,
            //                                                   decoration: const BoxDecoration(
            //                                                     shape: BoxShape.circle,
            //                                                   ),
            //                                                   child: Image.network(
            //                                                     NOT_FOUND_IMAGE,
            //                                                     fit: BoxFit.cover,
            //                                                   ),
            //                                                 ),
            //                                                 Container(
            //                                                   // margin: const EdgeInsets.all(10),
            //                                                   decoration: BoxDecoration(
            //                                                     shape: BoxShape.circle,
            //                                                     color: Colors.black.withOpacity(0.4),
            //                                                   ),
            //                                                 ),
            //                                               ],
            //                                             ),
            //                                 ),
            //                               ),
            //                             ),
            //                             // Padding(
            //                             //   padding: const EdgeInsets.all(38.65),
            //                             //   child: Container(
            //                             //     decoration: const BoxDecoration(
            //                             //       borderRadius: BorderRadius.all(Radius.circular(100)),
            //                             //     ),
            //                             //     child: Center(child: SvgPicture.asset(Assets.icons.icCamera.path)),
            //                             //   ),
            //                             // ),
            //                           ],
            //                         ),
            //                       ),
            //                     ),
            //                   ),
            //                   const Gap(18),

            //                   Text(
            //                     context.localized.enterYourFullName,
            //                     style: AppTextStyles.fs14w400.copyWith(color: AppColors.text),
            //                   ),
            //                   const Gap(8),

            //                   ///
            //                   /// edit surname
            //                   ///
            //                   CustomValidatorTextfield(
            //                     controller: surnameController,
            //                     valueListenable: _surnameError,
            //                     hintText: context.localized.enterYourFullName,
            //                     onChanged: (value) {
            //                       checkAllowTapButton();
            //                     },
            //                     validator: (String? value) {
            //                       if (value == null || value.isEmpty) {
            //                         return _surnameError.value = context.localized.required_to_fill;
            //                       }

            //                       return _surnameError.value = null;
            //                     },
            //                   ),
            //                   const Gap(16),
            //                   Text(
            //                     context.localized.enterYourEmailAddress,
            //                     style: AppTextStyles.fs14w400.copyWith(color: AppColors.text),
            //                   ),
            //                   const Gap(8),

            //                   ///
            //                   /// edit email
            //                   ///
            //                   CustomValidatorTextfield(
            //                     controller: emailController,
            //                     valueListenable: _emailError,
            //                     hintText: context.localized.enterYourEmailAddress,
            //                     keyboardType: TextInputType.emailAddress,
            //                     onChanged: (value) {
            //                       checkAllowTapButton();
            //                     },
            //                     validator: (String? value) {
            //                       return _emailError.value = ValidatorUtil.emailValidator(
            //                         emailController.text,
            //                         errorLabel: '',
            //                       );
            //                     },
            //                   ),
            //                   const Gap(16),
            //                   Text(
            //                     context.localized.enterYourPhoneNumber,
            //                     style: AppTextStyles.fs14w400,
            //                   ),
            //                   const Gap(8),
            //                   Row(
            //                     children: [
            //                       Expanded(
            //                         child: CustomTextField(
            //                           height: 44,
            //                           obscureText: false,
            //                           focusedBorder: OutlineInputBorder(
            //                               borderSide: const BorderSide(
            //                                 width: 1,
            //                               ),
            //                               borderRadius: BorderRadius.circular(12)),
            //                           enabledBorder: OutlineInputBorder(
            //                               borderSide: const BorderSide(width: 1, color: AppColors.borderTextField),
            //                               borderRadius: BorderRadius.circular(12)),
            //                           prefixIconWidget: Padding(
            //                             padding: const EdgeInsets.only(left: 18.0),
            //                             child: DropdownButton<Country>(
            //                               value: selectedCountry,
            //                               borderRadius: BorderRadius.circular(12),
            //                               items: countries.map((country) {
            //                                 return DropdownMenuItem<Country>(
            //                                   value: country,
            //                                   child: Text('${country.name} ${country.code}'),
            //                                 );
            //                               }).toList(),
            //                               onChanged: (Country? newCountry) {
            //                                 if (newCountry != null) {
            //                                   setState(() {
            //                                     selectedCountry = newCountry;
            //                                     phoneController.clear();
            //                                   });
            //                                 }
            //                               },
            //                               dropdownColor: Colors.white,
            //                               underline: const SizedBox(),
            //                             ),
            //                           ),
            //                           controller: phoneController,
            //                           inputFormatters: [
            //                             MaskTextInputFormatter(
            //                               mask: selectedCountry?.mask,
            //                               filter: {"#": RegExp(r'[0-9]')},
            //                             ),
            //                           ],
            //                           keyboardType: TextInputType.phone,
            //                           hintText: selectedCountry?.mask.replaceAll('#', '_'),
            //                           onChanged: (value) {
            //                             checkAllowTapButton();
            //                           },
            //                           validator: (String? value) {
            //                             if (value == null || value.isEmpty) {
            //                               return _phoneError.value = context.localized.required_to_fill;
            //                             }
            //                             String unmasked = value.replaceAll(RegExp(r'[^0-9]'), '');
            //                             if (unmasked.length != selectedCountry!.digitLength) {
            //                               // return _phoneError.value =
            //                               //     context.localized.incorrectNumberFormat;
            //                             }
            //                             return _phoneError.value = null;
            //                           },
            //                         ),
            //                       ),
            //                     ],
            //                   ),

            //                   const Gap(16),

            //                   Text(
            //                     context.localized.enterThePassword,
            //                     style: AppTextStyles.fs14w400.copyWith(color: AppColors.text),
            //                   ),
            //                   const Gap(8),

            //                   ///
            //                   /// password
            //                   ///
            //                   ValueListenableBuilder(
            //                     valueListenable: _obscureText,
            //                     builder: (context, v, c) {
            //                       return CustomValidatorTextfield(
            //                         focusNode: passwordFocus,
            //                         obscureText: _obscureText,
            //                         controller: passwordController,
            //                         valueListenable: _passwordError,
            //                         hintText: context.localized.enterThePassword,
            //                         onChanged: (value) {
            //                           checkAllowTapButton();
            //                         },
            //                       );
            //                     },
            //                   ),
            //                   const Gap(100),

            //                   ///
            //                   /// save button
            //                   ///
            //                   // BlocListener<ProfileEditCubit, ProfileEditState>(
            //                   //   listener: (context, state) {
            //                   //     state.maybeWhen(
            //                   //       error: (message) {
            //                   //         context.loaderOverlay.hide();
            //                   //         Toaster.showErrorTopShortToast(context, message);
            //                   //         //
            //                   //       },
            //                   //       loading: () {
            //                   //         context.loaderOverlay.show();
            //                   //       },
            //                   //       loaded: () {
            //                   //         context.loaderOverlay.hide();
            //                   //         context.router.popUntil((route) => route.settings.name == LauncherRoute.name);
            //                   //         BlocProvider.of<ProfileBLoC>(context).add(const ProfileEvent.getProfile());
            //                   //       },
            //                   //       orElse: () {
            //                   //         context.loaderOverlay.hide();
            //                   //       },
            //                   //     );
            //                   //   },
            //                   //   child: CustomButton(
            //                   //     allowTapButton: _allowTapButton,
            //                   //     onPressed: () {
            //                   //       if (_formKey.currentState!.validate()) {
            //                   //         log('$image', name: 'image');
            //                   //         log(surnameController.text, name: 'name');
            //                   //         log(emailController.text, name: 'email');
            //                   //         log("${selectedCountry?.code ?? ''}${phoneController.text}", name: 'phone');
            //                   //         log(passwordController.text, name: 'password');

            //                   //         BlocProvider.of<ProfileEditCubit>(context).editAccount(
            //                   //           password: passwordController.text,
            //                   //           name: surnameController.text,
            //                   //           email: emailController.text,
            //                   //           avatar: image,
            //                   //           phone: "${selectedCountry?.code ?? ''}${phoneController.text}",
            //                   //           cityId: -1,
            //                   //           languageId: -1,
            //                   //         );
            //                   //       }
            //                   //     },
            //                   //     style: null,
            //                   //     text: context.localized.save,
            //                   //     child: null,
            //                   //   ),
            //                   // ),
            //                   // const Gap(12),

            //                   // ///
            //                   // /// delete account
            //                   // ///
            //                   // BlocListener<ProfileBLoC, ProfileState>(
            //                   //   listener: (context, state) {
            //                   //     state.maybeWhen(
            //                   //       error: (message) {
            //                   //         context.loaderOverlay.hide();
            //                   //         Toaster.showErrorTopShortToast(context, message);
            //                   //       },
            //                   //       loading: () {
            //                   //         context.loaderOverlay.show();
            //                   //       },
            //                   //       orElse: () {
            //                   //         context.loaderOverlay.hide();
            //                   //       },
            //                   //       exited: (message) {
            //                   //         context.loaderOverlay.hide();
            //                   //         Toaster.showTopShortToast(context, message: 'Успешно');
            //                   //         context.router.popUntil((route) => route.settings.name == LauncherRoute.name);
            //                   //         BlocProvider.of<AppBloc>(context).add(const AppEvent.exiting());
            //                   //       },
            //                   //     );
            //                   //   },
            //                   //   child: GestureDetector(
            //                   //     onTap: () {
            //                   //       LogoutBottomSheet.show(
            //                   //         context,
            //                   //         isDeleteAccount: true,
            //                   //         onPressed: () {
            //                   //           BlocProvider.of<ProfileBLoC>(context).add(const ProfileEvent.deleteAccount());
            //                   //           Navigator.pop(context);
            //                   //         },
            //                   //       ).whenComplete(() {
            //                   //         FocusScope.of(context).unfocus();
            //                   //       });
            //                   //     },
            //                   //     child: Center(
            //                   //       child: Text(
            //                   //         context.localized.delete_an_account,
            //                   //         style: AppTextStyles.fs16w500.copyWith(color: Colors.red),
            //                   //         textAlign: TextAlign.center,
            //                   //       ),
            //                   //     ),
            //                   //   ),
            //                   // ),
            //                   // const Gap(16),
            //                 ],
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            //     ),
            //   ),
            // ),

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
