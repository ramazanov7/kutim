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
              loaded: () {
                context.loaderOverlay.hide();
                BlocProvider.of<AppBloc>(context).add(const AppEvent.logining(user: UserDTO()));
                context.router.replaceAll([LauncherRoute()]);
                Toaster.showTopShortToast(context, message: context.localized.successfully);
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
                          const Gap(70),
                          Text(
                            context.localized.passwordRecovery,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 30,
                              height: 35.8 / 30,
                              color: AppColors.text,
                            ),
                          ),
                          const Gap(8),
                          Text(
                            'Придумайте новый пароль чтобы восстановить ее', //passwordRecoveryText
                            textAlign: TextAlign.start,
                            style: AppTextStyles.fs14w500.copyWith(color: const Color(0xff555555)),
                          ),
                          const Gap(20),
                          Text(
                            context.localized.password,
                            style: AppTextStyles.fs14w500,
                          ),
                          const Gap(12),
                          ValueListenableBuilder(
                            valueListenable: _obscureText,
                            builder: (context, v, c) {
                              return CustomValidatorTextfield(
                                obscureText: _obscureText,
                                controller: passwordController,
                                valueListenable: _passwordError,
                                hintText: context.localized.enterNewPassword,
                                onChanged: (value) {
                                  checkAllowTapButton();
                                },
                                validator: (String? value) {
                                  return null;

                                  // if (value == null || value.isEmpty) {
                                  //   return _passwordError.value = 'Обязательно к заполнению';
                                  // }

                                  // if (value.length < 6) {
                                  //   return _passwordError.value = 'Минимальная длина пароля - 6';
                                  // }

                                  // return _passwordError.value = null;
                                },
                              );
                            },
                          ),
                          const Gap(16),
                          Text(
                            context.localized.repeatPassword,
                            style: AppTextStyles.fs14w500,
                          ),
                          const Gap(12),
                          ValueListenableBuilder(
                            valueListenable: _obscureText2,
                            builder: (context, v, c) {
                              return CustomValidatorTextfield(
                                obscureText: _obscureText2,
                                controller: passwordRepeatController,
                                valueListenable: _passwordRepeatError,
                                hintText: context.localized.repeatPassword,
                                onChanged: (value) {
                                  checkAllowTapButton();
                                },
                                validator: (String? value) {
                                  return null;

                                  // if (value == null || value.isEmpty) {
                                  //   return _passwordRepeatError.value = 'Обязательно к заполнению';
                                  // }

                                  // if (value.length < 6) {
                                  //   return _passwordRepeatError.value = 'Минимальная длина пароля - 6';
                                  // }

                                  // if (value != passwordController.text) {
                                  //   return _passwordRepeatError.value = 'Пароли не совпадают';
                                  // }
                                  // return _passwordRepeatError.value = null;
                                },
                              );
                            },
                          ),
                          const Gap(34),
                          CustomButton(
                            allowTapButton: _allowTapButton,
                            onPressed: () {
                              // context.router.replaceAll([const LauncherRoute()]);
                              if (_formKey.currentState!.validate()) {}
                              BlocProvider.of<NewPasswordCubit>(context).newPassword(
                                  password: passwordController.text,
                                  passwordConfirmation: passwordRepeatController.text,
                                  token: widget.token);
                            },
                            style: null,
                            text: context.localized.change,
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
