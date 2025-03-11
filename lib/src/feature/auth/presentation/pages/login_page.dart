import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:kutim/src/core/presentation/widgets/buttons/custom_button.dart';
import 'package:kutim/src/core/presentation/widgets/other/custom_loading_overlay_widget.dart';
import 'package:kutim/src/core/presentation/widgets/textfields/custom_validator_textfield.dart';
import 'package:kutim/src/core/theme/resources.dart';
import 'package:kutim/src/core/utils/extensions/context_extension.dart';
import 'package:kutim/src/feature/app/router/app_router.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ValueNotifier<String?> _phoneError = ValueNotifier(null);
  final ValueNotifier<String?> _passwordError = ValueNotifier(null);
  final ValueNotifier<bool> _obscureText = ValueNotifier(true);
  final ValueNotifier<bool> _allowTapButton = ValueNotifier(false);
  final ValueNotifier<String?> _emailError = ValueNotifier(null);
  final String _prefix = "+7(7";
  final FocusNode _focusNode = FocusNode();
  final FocusNode _focusNode2 = FocusNode();

  bool suffixIconVisible = false;

  MaskTextInputFormatter maskPhoneFormatter = MaskTextInputFormatter(
    mask: '+7(7##) ###-##-##',
    filter: {"#": RegExp('[0-9]')},
  );

  @override
  void initState() {
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        // Когда поле получает фокус, вставляем "+7(7"
        if (phoneController.text.isEmpty) {
          phoneController.text = _prefix;
        }
        // Ставим курсор после "+7(7"
        phoneController.selection = TextSelection.fromPosition(
          TextPosition(offset: phoneController.text.length),
        );
      } else {
        // Если поле теряет фокус и введено только "+7(7", очищаем его
        if (phoneController.text == _prefix) {
          phoneController.clear();
        }
      }
      setState(() {}); // Обновляем UI
    });
    // _focusNode2.addListener(() {
    //   if (_focusNode2.hasFocus) {
    //     suffixIconVisible = true;
    //   } else {
    //     suffixIconVisible = false;
    //   }
    //   setState(() {}); // Обновляем UI
    // });
    super.initState();
  }

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    _obscureText.dispose();
    _passwordError.dispose();
    _phoneError.dispose();
    _emailError.dispose();
    _allowTapButton.dispose();
    _focusNode.dispose();
    _focusNode2.dispose();
    super.dispose();
  }

  bool checkAllowTapButton() {
    // Validate email and password fields
    final isPasswordValid = passwordController.text.isNotEmpty;
    final isPhoneValid = phoneController.text.length == 17;

    // Enable the button only if both fields are valid
    return _allowTapButton.value = isPasswordValid && isPhoneValid;
  }

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      overlayColor: AppColors.barrierColor,
      overlayWidgetBuilder: (progress) => const CustomLoadingOverlayWidget(),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          suffixIconVisible = false;
        },
        onPanDown: (details) {
          FocusScope.of(context).unfocus();
          suffixIconVisible = false;
        },
        child: Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomButton(
                  // allowTapButton: _allowTapButton,
                  onPressed: () {
                    // if (!_formKey.currentState!.validate()) return;
                    if (checkAllowTapButton() == true) {
                      log('message');
                    }
                    // BlocProvider.of<LoginCubit>(context).login(
                    //   email: phoneController.text,
                    //   password: passwordController.text,
                    //   deviceType: Platform.isAndroid ? 'Android' : 'IOS',
                    // );
                  },
                  style: checkAllowTapButton()
                      ? CustomButtonStyles.mainButtonStyle(context)
                      : CustomButtonStyles.greyButtonStyle(context),
                  text: 'Войти',
                  child: null,
                ),
                const Gap(12),
                Text(
                  'Зарегистрироваться',
                  style: AppTextStyles.fs16w600.copyWith(color: AppColors.mainColor),
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: SafeArea(
              bottom: true,
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Gap(16),
                      Text(
                        'Вход',
                        style: AppTextStyles.fs24w700.copyWith(height: 1.25),
                      ),
                      const Gap(24),
                      Text(
                        'Номер телефона',
                        style: AppTextStyles.fs14w500.copyWith(height: 1.3),
                      ),
                      const Gap(4),
                      SizedBox(
                        height: 48,
                        child: CustomValidatorTextfield(
                          controller: phoneController,
                          valueListenable: _emailError,
                          inputFormatters: [maskPhoneFormatter],
                          hintText: 'Введите номер телефона',
                          keyboardType: TextInputType.phone,
                          focusNode: _focusNode,
                          onChanged: (value) {
                            checkAllowTapButton();
                            setState(() {});
                          },
                          validator: (String? value) {
                            return null;
                          },
                        ),
                      ),
                      const Gap(12),
                      Text(
                        'Пароль',
                        style: AppTextStyles.fs14w500.copyWith(height: 1.3),
                      ),
                      const Gap(4),
                      ValueListenableBuilder(
                        valueListenable: _obscureText,
                        builder: (context, v, c) {
                          return CustomValidatorTextfield(
                            // obscureText: _obscureText,
                            controller: passwordController,
                            // suffixIcon: !suffixIconVisible
                            //     ? Padding(
                            //         padding: const EdgeInsets.only(top: 14, bottom: 14),
                            //         child: GestureDetector(
                            //             onTap: () {
                            //               log('message');
                            //               passwordController.clear();
                            //               suffixIconVisible = true;
                            //               setState(() {});
                            //             },
                            //             child: SvgPicture.asset(Assets.icons.clear.path)),
                            //       )
                            //     : const SizedBox(
                            //         height: 22,
                            //         width: 22,
                            //       ),
                            valueListenable: _passwordError,
                            focusNode: _focusNode2,
                            hintText: 'Введите пароль',
                            // onTap: () {
                            //   if (passwordController.text.isNotEmpty) {
                            //     suffixIconVisible = true;
                            //   }
                            //   setState(() {});
                            // },
                            // onChanged: (value) {
                            //   // if (passwordController.text.isNotEmpty) {
                            //   suffixIconVisible = true;
                            //   // }

                            //   checkAllowTapButton();
                            //   setState(() {});
                            // },
                            validator: (String? value) {
                              return null;
                            },
                          );
                        },
                      ),

                      const Gap(4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              context.router.push(const PasswordRecoveryRoute());
                            },
                            child: Text(
                              context.localized.forgotYourPassword,
                              style: AppTextStyles.fs14w500.copyWith(height: 1.3, color: AppColors.mainColor),
                            ),
                          ),
                        ],
                      ),
                      // const Gap(34),
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
}
