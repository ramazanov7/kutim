import 'package:auto_route/auto_route.dart';
import 'package:kutim/src/core/presentation/widgets/textfields/custom_textfield.dart';
import 'package:kutim/src/feature/app/presentation/widgets/custom_appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:kutim/src/core/presentation/widgets/buttons/custom_button.dart';
import 'package:kutim/src/core/presentation/widgets/dialog/toaster.dart';
import 'package:kutim/src/core/presentation/widgets/other/custom_loading_overlay_widget.dart';
import 'package:kutim/src/core/theme/resources.dart';
import 'package:kutim/src/core/utils/extensions/context_extension.dart';
import 'package:kutim/src/feature/app/router/app_router.dart';
import 'package:kutim/src/feature/auth/bloc/password_recovery_cubit.dart';

@RoutePage()
class PasswordRecoveryPage extends StatefulWidget implements AutoRouteWrapper {
  const PasswordRecoveryPage({super.key});

  @override
  State<PasswordRecoveryPage> createState() => _PasswordRecoveryPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => PasswordRecoveryCubit(repository: context.repository.authRepository),
      child: this,
    );
  }
}

class _PasswordRecoveryPageState extends State<PasswordRecoveryPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final ValueNotifier<String?> _emailError = ValueNotifier(null);
  final ValueNotifier<bool> _allowTapButton = ValueNotifier(false);

  @override
  void dispose() {
    emailController.dispose();
    _emailError.dispose();
    _allowTapButton.dispose();

    super.dispose();
  }

  bool isValidEmail(String value) {
    const pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    final regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  bool checkAllowTapButton() {
    return _allowTapButton.value = isValidEmail(emailController.text);
  }

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      overlayColor: AppColors.barrierColor,
      overlayWidgetBuilder: (progress) => const CustomLoadingOverlayWidget(),
      child: BlocConsumer<PasswordRecoveryCubit, PasswordRecoveryState>(
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
              context.pushRoute(
                EnterSmsCodeRoute(email: emailController.text),
              );
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    const Gap(30),
                    const Text(
                      'Forgot password',
                      style: AppTextStyles.fs26w700,
                    ),
                    const Gap(16),
                    Text(
                      'Please enter your email to reset the password',
                      style: AppTextStyles.fs14w500.copyWith(color: AppColors.textFieldBorder, letterSpacing: -0.41),
                    ),
                    const Gap(16),
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
                    const Gap(31),
                    CustomButton(
                        onPressed: () {
                          BlocProvider.of<PasswordRecoveryCubit>(context).forgotPassword(
                            email: emailController.text,
                          );
                        },
                        style: CustomButtonStyles.mainButtonStyle(context, elevation: 5),
                        child: const Text(
                          'Reset Password',
                          style: AppTextStyles.fs16w500,
                        )),
                  ]),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
