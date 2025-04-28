import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:kutim/src/feature/app/presentation/widgets/custom_appbar_widget.dart';
import 'package:kutim/src/feature/auth/models/user_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:kutim/src/core/presentation/widgets/buttons/custom_button.dart';
import 'package:kutim/src/core/presentation/widgets/dialog/toaster.dart';
import 'package:kutim/src/core/presentation/widgets/other/custom_loading_overlay_widget.dart';
import 'package:kutim/src/core/presentation/widgets/textfields/custom_validator_textfield.dart';
import 'package:kutim/src/core/theme/resources.dart';
import 'package:kutim/src/core/utils/extensions/context_extension.dart';
import 'package:kutim/src/feature/app/bloc/app_bloc.dart';
import 'package:kutim/src/feature/app/router/app_router.dart';
import 'package:kutim/src/feature/auth/bloc/new_password_cubit.dart';

@RoutePage()
class NewPasswordPage extends StatefulWidget implements AutoRouteWrapper {
  const NewPasswordPage({
    super.key,
    required this.token,
  });
  final String token;

  @override
  State<NewPasswordPage> createState() => _NewPasswordPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => NewPasswordCubit(repository: context.repository.authRepository),
      child: this,
    );
  }
}

class _NewPasswordPageState extends State<NewPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordRepeatController = TextEditingController();
  final ValueNotifier<String?> _passwordError = ValueNotifier(null);
  final ValueNotifier<String?> _passwordRepeatError = ValueNotifier(null);
  final ValueNotifier<bool> _obscureText = ValueNotifier(true);
  final ValueNotifier<bool> _obscureText2 = ValueNotifier(true);
  final ValueNotifier<bool> _allowTapButton = ValueNotifier(false);

  bool isFirstPage = true;

  @override
  void initState() {
    log(widget.token);
    super.initState();
  }

  @override
  void dispose() {
    passwordController.dispose();
    passwordRepeatController.dispose();
    _obscureText.dispose();
    _obscureText2.dispose();
    _passwordError.dispose();
    _passwordRepeatError.dispose();
    _allowTapButton.dispose();
    super.dispose();
  }

  void checkAllowTapButton() {
    _allowTapButton.value = passwordController.text.isNotEmpty &&
        passwordRepeatController.text.isNotEmpty &&
        passwordController.text == passwordRepeatController.text;
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
        child: BlocConsumer<NewPasswordCubit, NewPasswordState>(
          listener: (context, state) {
            state.maybeWhen(
              error: (message) {
                context.loaderOverlay.hide();
                Toaster.showErrorTopShortToast(context, message);
              },
              loading: () {
                context.loaderOverlay.show();
              },
              loaded: (user) {
                context.loaderOverlay.hide();
                BlocProvider.of<AppBloc>(context).add(AppEvent.logining(user: user));
                context.repository.authRepository.setSkinType(skinType: user.skinType ?? '');
                context.router.replaceAll([LauncherRoute()]);
                // Toaster.showTopShortToast(context, message: context.localized.successfully);
              },
              orElse: () {
                context.loaderOverlay.hide();
              },
            );
          },
          builder: (context, state) {
            return Scaffold(
              appBar: const CustomAppBar(),
              body: SafeArea(
                child: Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Gap(30),
                          Text(isFirstPage ? 'Password reset' : 'Set a new password',
                              style: AppTextStyles.fs20w500.copyWith(letterSpacing: -0.41)),
                          const Gap(16),
                          Text(
                            isFirstPage
                                ? 'Your password has been successfully reset click confirm to set a new password'
                                : 'Create a new password. Ensure it differs from previous ones for security',
                            textAlign: TextAlign.start,
                            style: AppTextStyles.fs14w500.copyWith(color: AppColors.textFieldBorder),
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
                                  hintText: 'Enter your new password',
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
                          const Gap(20),
                          const Text(
                            'Confirm Password',
                            style: AppTextStyles.fs15w500,
                          ),
                          const Gap(10),
                          SizedBox(
                            height: 46,
                            child: ValueListenableBuilder(
                              valueListenable: _obscureText2,
                              builder: (context, v, c) {
                                return CustomValidatorTextfield(
                                  obscureText: _obscureText2,
                                  controller: passwordRepeatController,
                                  valueListenable: _passwordRepeatError,
                                  hintText: 'Re-enter password',
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
                          const Gap(20),
                          CustomButton(
                            // allowTapButton: _allowTapButton,
                            onPressed: () {
                              if (isFirstPage &&
                                  passwordController.text.isNotEmpty &&
                                  passwordRepeatController.text.isNotEmpty) {
                                if (passwordController.text == passwordRepeatController.text) {
                                  BlocProvider.of<NewPasswordCubit>(context).newPassword(
                                    password: passwordController.text,
                                    email: widget.token,
                                  );
                                } else {
                                  Toaster.showErrorTopShortToast(context, "Passwords does not the same");
                                }
                              }
                              // context.router.replaceAll([const LauncherRoute()]);
                              // if (_formKey.currentState!.validate()) {}
                              // context.router.push(const SuccessfullRoute());
                              // isFirstPage = !isFirstPage;
                              setState(() {});
                            },
                            style: CustomButtonStyles.mainButtonStyle(context, elevation: 5),
                            text: isFirstPage ? 'Confirm' : 'Update Password',
                            child: null,
                          ),
                          const Gap(16),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
