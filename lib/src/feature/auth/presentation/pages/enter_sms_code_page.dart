import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:kutim/src/feature/app/presentation/widgets/custom_appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:pinput/pinput.dart';
import 'package:kutim/src/core/presentation/widgets/buttons/custom_button.dart';
import 'package:kutim/src/core/presentation/widgets/dialog/toaster.dart';
import 'package:kutim/src/core/presentation/widgets/other/custom_loading_overlay_widget.dart';
import 'package:kutim/src/core/presentation/widgets/scroll/scroll_wrapper.dart';
import 'package:kutim/src/core/theme/resources.dart';
import 'package:kutim/src/core/utils/extensions/context_extension.dart';
import 'package:kutim/src/feature/app/router/app_router.dart';
import 'package:kutim/src/feature/auth/bloc/enter_sms_code_cubit.dart';
import 'package:kutim/src/feature/auth/bloc/password_recovery_cubit.dart';

@RoutePage()
class EnterSmsCodePage extends StatefulWidget implements AutoRouteWrapper {
  const EnterSmsCodePage({
    super.key,
    required this.email,
    required this.token,
  });
  final String email;
  final String token;

  @override
  State<EnterSmsCodePage> createState() => _EnterSmsCodePageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => EnterSmsCodeCubit(
            repository: context.repository.authRepository,
          ),
        ),
        BlocProvider(
          create: (context) => PasswordRecoveryCubit(
            repository: context.repository.authRepository,
          ),
        ),
      ],
      child: this,
    );
  }
}

class _EnterSmsCodePageState extends State<EnterSmsCodePage> {
  final Duration oneSec = const Duration(seconds: 1); // Set to 1 second for countdown
  final ValueNotifier<bool> _allowTapButton = ValueNotifier(false);
  final TextEditingController pinputController = TextEditingController();
  late final ValueNotifier<int> timerSeconds;
  late Timer timer;
  final ValueNotifier<bool> forceErrorState = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    pinputController.addListener(checkAllowTapButton);
    // startTimer();
  }

  final defaultPinTheme = PinTheme(
    width: double.infinity,
    // height: 55,
    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 25),
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      color: AppColors.backgroundInputGrey,
      border: Border.all(color: AppColors.line2),
    ),
    textStyle: const TextStyle(
      color: AppColors.text,
      fontWeight: FontWeight.w600,
      fontSize: 28,
      height: 39.2 / 28,
    ),
  );

  final focusedPinTheme = PinTheme(
    width: double.infinity,
    // height: 55,
    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 25),
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      color: AppColors.backgroundInputGrey,
      border: Border.all(color: AppColors.text),
    ),
    textStyle: const TextStyle(
      color: AppColors.text,
      fontWeight: FontWeight.w600,
      fontSize: 28,
      height: 39.2 / 28,
    ),
  );

  final errorPinTheme = PinTheme(
    width: double.infinity,
    // height: 55,
    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 25),
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      color: AppColors.muteRed,
      border: Border.all(color: AppColors.red),
    ),
    textStyle: const TextStyle(
      color: AppColors.text,
      fontWeight: FontWeight.w600,
      fontSize: 28,
      height: 39.2 / 28,
    ),
  );

  void checkAllowTapButton() {
    // Check if pinputController has enough characters to enable button
    forceErrorState.value = false;
    _allowTapButton.value = pinputController.text.length == 4;
  }

  @override
  void dispose() {
    _allowTapButton.dispose();
    pinputController.removeListener(checkAllowTapButton);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      overlayColor: AppColors.barrierColor,
      overlayWidgetBuilder: (progress) => const CustomLoadingOverlayWidget(),
      child: BlocConsumer<EnterSmsCodeCubit, EnterSmsCodeState>(
        listener: (context, state) {
          state.maybeWhen(
            error: (message) {
              context.loaderOverlay.hide();
              Toaster.showErrorTopShortToast(context, message);
              forceErrorState.value = true;
            },
            loading: () {
              context.loaderOverlay.show();
            },
            loaded: (token) {
              context.loaderOverlay.hide();
              context.pushRoute(
                NewPasswordRoute(token: token),
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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ScrollWrapper(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Gap(70),
                      Text(
                        context.localized.enterYourCode,
                        textAlign: TextAlign.start,
                        style: AppTextStyles.fs26w700,
                      ),
                      const Gap(12),
                      Text(
                        '${context.localized.weHaveSent}:  ${widget.email}', //weHaveSent
                        textAlign: TextAlign.start,
                        style: AppTextStyles.fs14w500.copyWith(color: const Color(0xff555555)),
                      ),
                      const Gap(20),
                      Center(
                        child: ValueListenableBuilder(
                          valueListenable: forceErrorState,
                          builder: (context, v, c) {
                            return Pinput(
                              autofocus: true,
                              controller: pinputController,
                              forceErrorState: forceErrorState.value,
                              separatorBuilder: (index) => const SizedBox(width: 16),
                              onChanged: (value) {
                                checkAllowTapButton();
                              },
                              closeKeyboardWhenCompleted: false,
                              preFilledWidget: const Text(
                                '0',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 28,
                                  color: AppColors.greyText,
                                  height: 39.2 / 28,
                                ),
                              ),
                              // androidSmsAutofillMethod: ,
                              defaultPinTheme: defaultPinTheme,
                              // submittedPinTheme: defaultPinTheme,
                              focusedPinTheme: focusedPinTheme,
                              // followingPinTheme: defaultPinTheme,
                              errorPinTheme: errorPinTheme,
                            );
                          },
                        ),
                      ),
                      const Gap(30),
                      CustomButton(
                        allowTapButton: _allowTapButton,
                        onPressed: () {
                          // ignore: unnecessary_statements
                          pinputController.text.length == 4;
                          {
                            BlocProvider.of<EnterSmsCodeCubit>(context).sendSmsCode(
                              code: pinputController.text,
                              token: widget.token,
                            );
                          }
                        },
                        style: null,
                        text: context.localized.send, // send
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
