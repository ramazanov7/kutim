// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kutim/src/core/presentation/widgets/buttons/custom_button.dart';
import 'package:kutim/src/core/presentation/widgets/dialog/toaster.dart';
import 'package:kutim/src/core/presentation/widgets/textfields/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kutim/src/core/utils/extensions/context_extension.dart';
import 'package:kutim/src/core/utils/input/validator_util.dart';
import 'package:kutim/src/feature/app/bloc/app_bloc.dart';
import 'package:kutim/src/feature/app/router/app_router.dart';
import 'package:kutim/src/feature/auth/bloc/register_cubit.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:kutim/src/core/presentation/widgets/other/custom_loading_overlay_widget.dart';
import 'package:kutim/src/core/presentation/widgets/textfields/custom_validator_textfield.dart';
import 'package:kutim/src/core/theme/resources.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class RegisterPage extends StatefulWidget implements AutoRouteWrapper {
  const RegisterPage({
    super.key,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegisterCubit(repository: context.repository.authRepository),
          child: this,
        ),
      ],
      child: this,
    );
  }
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController surnameNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();

  final ValueNotifier<bool> _obscureText = ValueNotifier(true);
  final ValueNotifier<bool> _obscureText2 = ValueNotifier(true);
  final ValueNotifier<String?> _passwordError = ValueNotifier(null);
  final ValueNotifier<String?> _confirmPassError = ValueNotifier(null);
  final ValueNotifier<String?> _surnameNameError = ValueNotifier(null);
  final ValueNotifier<bool> _allowTapButton = ValueNotifier(false);
  final ValueNotifier<String?> _emailError = ValueNotifier(null);
  final FocusNode _focusNode = FocusNode();

  bool isChecked = false;

  @override
  void dispose() {
    surnameNameController.dispose();
    confirmPassController.dispose();
    emailController.dispose();
    _surnameNameError.dispose();
    _emailError.dispose();
    passwordController.dispose();
    _allowTapButton.dispose();
    _focusNode.dispose();
    _confirmPassError.dispose();
    super.dispose();
  }

  bool checkAllowTapButton() {
    final isEmailValid = ValidatorUtil.emailValidator(
          emailController.text,
          errorLabel: 'Неверная почта',
        ) ==
        null;
    final isPasswordValid = passwordController.text.length >= 6;
    return _allowTapButton.value = isPasswordValid && isEmailValid && surnameNameController.text != '' && isChecked;
  }

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
            body: SafeArea(
              child: Form(
                key: _formKey,
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Gap(77),
                            Text(
                              'Sign in to Kutim',
                              style: AppTextStyles.fs20w600.copyWith(color: AppColors.mainColor),
                            ),
                            const Gap(36),
                            SizedBox(
                              height: 46,
                              child: CustomTextField(
                                controller: surnameNameController,
                                label: const Text(
                                  'Full name',
                                  style: AppTextStyles.fs14w400,
                                ),
                                floatingLabelStyle: AppTextStyles.fs16w400,
                                fillColor: AppColors.white,
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: const BorderSide(color: AppColors.textFieldBorder)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: const BorderSide(color: AppColors.textFieldBorder)),
                                onChanged: (value) {
                                  // checkAllowTapButton();
                                  setState(() {});
                                },
                              ),
                            ),
                            const Gap(26),
                            SizedBox(
                              height: 46,
                              child: CustomTextField(
                                controller: emailController,
                                label: const Text(
                                  'Email',
                                  style: AppTextStyles.fs14w400,
                                ),
                                floatingLabelStyle: AppTextStyles.fs16w400,
                                keyboardType: TextInputType.emailAddress,
                                fillColor: AppColors.white,
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: const BorderSide(color: AppColors.textFieldBorder)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: const BorderSide(color: AppColors.textFieldBorder)),
                                onChanged: (value) {
                                  // checkAllowTapButton();
                                  setState(() {});
                                },
                              ),
                            ),
                            const Gap(26),
                            SizedBox(
                              height: 46,
                              child: ValueListenableBuilder(
                                valueListenable: _obscureText,
                                builder: (context, v, c) {
                                  return CustomValidatorTextfield(
                                    obscureText: _obscureText,
                                    controller: passwordController,
                                    valueListenable: _passwordError,
                                    label: const Text(
                                      'Password',
                                      style: AppTextStyles.fs14w400,
                                    ),
                                    floatingLabelStyle: AppTextStyles.fs16w400,
                                    onChanged: (value) {
                                      checkAllowTapButton();
                                    },
                                    validator: (String? value) {
                                      return null;
                                    },
                                  );
                                },
                              ),
                            ),
                            const Gap(26),
                            SizedBox(
                              height: 46,
                              child: ValueListenableBuilder(
                                valueListenable: _obscureText2,
                                builder: (context, v, c) {
                                  return CustomValidatorTextfield(
                                    obscureText: _obscureText2,
                                    controller: confirmPassController,
                                    valueListenable: _passwordError,
                                    label: const Text(
                                      'Confirm password',
                                      style: AppTextStyles.fs14w400,
                                    ),
                                    floatingLabelStyle: AppTextStyles.fs16w400,
                                    onChanged: (value) {
                                      checkAllowTapButton();
                                    },
                                    validator: (String? value) {
                                      return null;
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  checkColor: AppColors.white,
                                  fillColor: WidgetStateProperty.resolveWith((states) {
                                    if (states.contains(WidgetState.selected)) {
                                      return AppColors.mainColor;
                                    }
                                    return AppColors.mainColor;
                                  }),
                                  value: isChecked,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    side: const BorderSide(width: 1, color: Colors.black),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      isChecked = value!;
                                    });
                                  },
                                ),
                                Expanded(
                                  child: RichText(
                                    text: TextSpan(
                                      text: 'I have read and agree to the ',
                                      style: AppTextStyles.fs12w400.copyWith(
                                          fontFamily: 'Poppins',
                                          letterSpacing: -0.41,
                                          color: Colors.black,
                                          height: 1.7),
                                      children: <TextSpan>[
                                        TextSpan(
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              launch('https://youtu.be/tJbDzPo9wWE?si=bjepMWFkbHMICKpp');
                                            },
                                          text: 'Terms', // Bold text
                                          style: AppTextStyles.fs14w400.copyWith(
                                              fontFamily: 'Poppins',
                                              letterSpacing: -0.41,
                                              color: AppColors.mainColor,
                                              height: 1.5),
                                        ),
                                        TextSpan(
                                          text: ' & ', // Underlined and clickable text
                                          style: AppTextStyles.fs12w400.copyWith(
                                              fontFamily: 'Poppins', letterSpacing: -0.41, color: Colors.black),
                                        ),
                                        TextSpan(
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              launch('https://youtu.be/tJbDzPo9wWE?si=bjepMWFkbHMICKpp');
                                            },
                                          text: 'Conditions', // Underlined and clickable text
                                          style: AppTextStyles.fs14w400.copyWith(
                                              fontFamily: 'Poppins', letterSpacing: -0.41, color: AppColors.mainColor),
                                        ),
                                        TextSpan(
                                          text: ' and ', // Underlined and clickable text
                                          style: AppTextStyles.fs12w400.copyWith(
                                              fontFamily: 'Poppins',
                                              letterSpacing: -0.41,
                                              color: Colors.black,
                                              height: 1.7),
                                        ),
                                        TextSpan(
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              launch('https://youtu.be/tJbDzPo9wWE?si=bjepMWFkbHMICKpp');
                                            },
                                          text: 'Privacy Policy', // Underlined and clickable text
                                          style: AppTextStyles.fs14w400.copyWith(
                                              fontFamily: 'Poppins',
                                              letterSpacing: -0.41,
                                              color: AppColors.mainColor,
                                              height: 1.5),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                                // Expanded(
                                //   child: Text(
                                //     'I have read and agree to the Terms & Conditions and Privacy Policy',
                                //     style: AppTextStyles.fs12w400.copyWith(fontFamily: 'Poppins', letterSpacing: -0.41),
                                //   ),
                                // ),
                              ],
                            ),
                            const Gap(12),
                            BlocListener<RegisterCubit, RegisterState>(
                              listener: (context, state) {
                                state.maybeWhen(
                                  loading: () => context.loaderOverlay.show(),
                                  error: (message) {
                                    context.loaderOverlay.hide();
                                    Toaster.showErrorTopShortToast(context, message);
                                  },
                                  loaded: (user) {
                                    context.loaderOverlay.hide();
                                    BlocProvider.of<AppBloc>(context).add(AppEvent.logining(user: user));
                                    context.router.replaceAll([LauncherRoute()]);
                                    Toaster.showTopShortToast(context, message: 'Успешно');
                                  },
                                  orElse: () => context.loaderOverlay.hide(),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8, right: 8),
                                child: CustomButton(
                                    onPressed: () {
                                      if (checkAllowTapButton()) {
                                        BlocProvider.of<RegisterCubit>(context).register(
                                          password: passwordController.text,
                                          deviceType: Platform.isAndroid ? 'Android' : 'IOS',
                                          email: emailController.text,
                                          name: '',
                                          surname: surnameNameController.text,
                                        );
                                      }
                                    },
                                    style: checkAllowTapButton()
                                        ? CustomButtonStyles.mainButtonStyle(context, elevation: 5)
                                        : CustomButtonStyles.mainButtonStyle(context,
                                            elevation: 5, backgroundColor: AppColors.mainColor.withOpacity(0.5)),
                                    child: const Text(
                                      'Sign up',
                                      style: AppTextStyles.fs16w500,
                                    )),
                              ),
                            ),
                            const Gap(13),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Already have an Account?",
                                  style: AppTextStyles.fs16w500,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    context.router.push(const LoginRoute());
                                  },
                                  child: Text(
                                    '   Sign in',
                                    style: AppTextStyles.fs16w500.copyWith(color: AppColors.mainColor),
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    )),
              ),
            ),
          ),
        ));
  }
}
