import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:kutim/src/core/presentation/widgets/dialog/toaster.dart';
import 'package:kutim/src/core/presentation/widgets/textfields/custom_textfield.dart';
import 'package:kutim/src/core/utils/extensions/context_extension.dart';
import 'package:kutim/src/core/utils/input/validator_util.dart';
import 'package:kutim/src/feature/app/bloc/app_bloc.dart';
import 'package:kutim/src/feature/auth/bloc/login_cubit.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:kutim/src/core/presentation/widgets/buttons/custom_button.dart';
import 'package:kutim/src/core/presentation/widgets/other/custom_loading_overlay_widget.dart';
import 'package:kutim/src/core/presentation/widgets/textfields/custom_validator_textfield.dart';
import 'package:kutim/src/core/theme/resources.dart';
import 'package:kutim/src/feature/app/router/app_router.dart';

@RoutePage()
class LoginPage extends StatefulWidget implements AutoRouteWrapper {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(repository: context.repository.authRepository),
        ),
      ],
      child: this,
    );
  }
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ValueNotifier<bool> _obscureText = ValueNotifier(true);
  final ValueNotifier<String?> _passwordError = ValueNotifier(null);
  final ValueNotifier<bool> _allowTapButton = ValueNotifier(false);

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    _obscureText.dispose();
    _allowTapButton.dispose();
    _passwordError.dispose();
    super.dispose();
  }

  bool checkAllowTapButton() {
    final isPasswordValid = passwordController.text.isNotEmpty;
    final isEmailValid = ValidatorUtil.emailValidator(
          emailController.text,
          errorLabel: 'Неверный логин',
        ) ==
        null;

    return _allowTapButton.value = isPasswordValid && isEmailValid;
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
        onPanDown: (details) {
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
                        const Gap(120),
                        Text(
                          'Sign in to Kutim',
                          style: AppTextStyles.fs20w600.copyWith(color: AppColors.mainColor),
                        ),
                        const Gap(56),
                        const Text(
                          'Your Email',
                          style: AppTextStyles.fs15w500,
                        ),
                        const Gap(10),
                        SizedBox(
                          height: 46,
                          child: CustomTextField(
                            controller: emailController,
                            hintText: 'Enter your email',
                            hintStyle: AppTextStyles.fs14w400.copyWith(height: 1.7),
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
                              setState(() {});
                            },
                          ),
                        ),
                        const Gap(20),
                        const Text(
                          'Password',
                          style: AppTextStyles.fs15w500,
                        ),
                        const Gap(10),
                        SizedBox(
                          height: 46,
                          child: ValueListenableBuilder(
                            valueListenable: _obscureText,
                            builder: (context, v, c) {
                              return CustomValidatorTextfield(
                                obscureText: _obscureText,
                                controller: passwordController,
                                valueListenable: _passwordError,
                                hintText: 'Enter your password',
                                // hintStyle: AppTextStyles.fs14w400.copyWith(height: 1.7),
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
                        const Gap(12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                context.router.push(const PasswordRecoveryRoute());
                              },
                              child: Text(
                                'Forgot Password?',
                                style: AppTextStyles.fs14w300.copyWith(color: AppColors.textFieldBorder),
                              ),
                            ),
                          ],
                        ),
                        // const Gap(34),
                      ],
                    ),
                    Column(
                      children: [
                        BlocListener<LoginCubit, LoginState>(
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
                                context.repository.authRepository.setSkinType(skinType: user.skinType ?? '');
                                context.router.replaceAll([LauncherRoute()]);
                                Toaster.showTopShortToast(context, message: 'Успешно');
                                // log('loaded', name: 'login page loaded');
                              },
                              orElse: () => context.loaderOverlay.hide(),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: CustomButton(
                                onPressed: () {
                                  // context.router.push(const MainRoute());
                                  BlocProvider.of<LoginCubit>(context).login(
                                    password: passwordController.text,
                                    deviceType: Platform.isAndroid ? 'Android' : 'IOS',
                                    email: emailController.text,
                                  );
                                },
                                style: CustomButtonStyles.mainButtonStyle(context, elevation: 5),
                                child: const Text(
                                  'Sign in',
                                  style: AppTextStyles.fs16w500,
                                )),
                          ),
                        ),
                        const Gap(13),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Don't have an Account?",
                              style: AppTextStyles.fs16w500,
                            ),
                            GestureDetector(
                              onTap: () {
                                context.router.push(const RegisterRoute());
                              },
                              child: Text(
                                '   Sign up',
                                style: AppTextStyles.fs16w500.copyWith(color: AppColors.mainColor),
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
