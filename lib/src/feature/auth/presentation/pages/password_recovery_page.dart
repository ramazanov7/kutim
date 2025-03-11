import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:kutim/src/core/gen/assets.gen.dart';
import 'package:kutim/src/feature/app/presentation/widgets/custom_appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:kutim/src/core/presentation/widgets/buttons/custom_button.dart';
import 'package:kutim/src/core/presentation/widgets/dialog/toaster.dart';
import 'package:kutim/src/core/presentation/widgets/other/custom_loading_overlay_widget.dart';
import 'package:kutim/src/core/presentation/widgets/scroll/scroll_wrapper.dart';
import 'package:kutim/src/core/presentation/widgets/textfields/custom_validator_textfield.dart';
import 'package:kutim/src/core/theme/resources.dart';
import 'package:kutim/src/core/utils/extensions/context_extension.dart';
import 'package:kutim/src/core/utils/input/validator_util.dart';
import 'package:kutim/src/feature/app/router/app_router.dart';
import 'package:kutim/src/feature/auth/bloc/password_recovery_cubit.dart';
import 'package:kutim/src/feature/auth/enum/enter_sms_code_type.dart';

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
            loaded: (token) {
              context.loaderOverlay.hide();
              context.pushRoute(
                EnterSmsCodeRoute(email: emailController.text, token: token),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Gap(70),
                      Text(
                        context.localized.passwordRecovery,
                        style: AppTextStyles.fs26w700,
                      ),
                      const Gap(20),
                      Text(
                        context.localized.enterYourEmailAddress,
                        style: AppTextStyles.fs14w500,
                      ),
                      const Gap(8),
                      CustomValidatorTextfield(
                        controller: emailController,
                        valueListenable: _emailError,
                        hintText: context.localized.email,
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) {
                          checkAllowTapButton();
                        },
                        validator: (String? value) {
                          return null;
                        },
                      ),
                      const Gap(34),
                      CustomButton(
                        allowTapButton: _allowTapButton,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            BlocProvider.of<PasswordRecoveryCubit>(context).forgotPassword(
                              email: emailController.text,
                            );
                          }
                        },
                        style: null,
                        text: context.localized.getCode,
                        child: null,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
