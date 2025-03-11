import 'dart:io';

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
import 'package:kutim/src/core/presentation/widgets/textfields/custom_validator_textfield.dart';
import 'package:kutim/src/core/theme/resources.dart';
import 'package:kutim/src/core/utils/extensions/context_extension.dart';
import 'package:kutim/src/core/utils/input/validator_util.dart';
import 'package:kutim/src/feature/app/bloc/app_bloc.dart';
import 'package:kutim/src/feature/app/router/app_router.dart';
import 'package:kutim/src/feature/auth/bloc/register_cubit.dart';
import 'package:kutim/src/feature/auth/models/common_dto.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

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
  final TextEditingController phoneController = TextEditingController();

  final ValueNotifier<bool> _obscureText = ValueNotifier(true);
  final ValueNotifier<String?> _passwordError = ValueNotifier(null);
  final ValueNotifier<String?> _phoneError = ValueNotifier(null);
  final ValueNotifier<String?> _surnameNameError = ValueNotifier(null);
  final ValueNotifier<String?> _classError = ValueNotifier(null);
  final ValueNotifier<bool> _allowTapButton = ValueNotifier(false);
  final ValueNotifier<String?> _emailError = ValueNotifier(null);
  CommonDTO? chosenClass;
  final String _prefix = "+";
  final FocusNode _focusNode = FocusNode();
  Country? selectedCountry;

  @override
  void initState() {
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
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
    super.initState();
    selectedCountry = countries.first;
  }

  @override
  void dispose() {
    surnameNameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    _surnameNameError.dispose();
    _classError.dispose();
    _emailError.dispose();
    passwordController.dispose();
    _allowTapButton.dispose();
    _focusNode.dispose();
    _phoneError.dispose();
    super.dispose();
  }

  bool checkAllowTapButton() {
    final isEmailValid = ValidatorUtil.emailValidator(
          emailController.text,
          errorLabel: 'Неверный логин',
        ) ==
        null;
    final isPasswordValid = passwordController.text.length >= 6;
    String phoneUnmasked = phoneController.text.replaceAll(RegExp(r'[^0-9]'), '');
    bool isPhoneValid = phoneUnmasked.length == selectedCountry!.digitLength;
    return _allowTapButton.value =
        isPasswordValid && isEmailValid && surnameNameController.text.isNotEmpty && isPhoneValid;
  }

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      overlayColor: AppColors.barrierColor,
      overlayWidgetBuilder: (progress) => const CustomLoadingOverlayWidget(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          state.maybeWhen(
            loading: () => context.loaderOverlay.show(),
            error: (message) {
              context.loaderOverlay.hide();
              Toaster.showErrorTopShortToast(context, message);
              Future<void>.delayed(
                const Duration(milliseconds: 300),
              ).whenComplete(
                () => _formKey.currentState!.validate(),
              );
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
        builder: (context, state) {
          return GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Scaffold(
              appBar: CustomAppBar(
                actions: [
                  Container(
                    width: 40,
                  )
                ],
              ),
              body: Form(
                key: _formKey,
                // autovalidateMode: AutovalidateMode.onUserInteraction,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Gap(70),
                        Text(
                          context.localized.accountRegister, //accountRegister
                          style: AppTextStyles.fs26w700.copyWith(height: 1.25),
                        ),
                        const Gap(8),
                        Text(
                          context.localized.joinInSecond, //joinInSecond
                          style: AppTextStyles.fs16w500.copyWith(height: 1.7),
                        ),
                        const Gap(20),
                        Text(
                          context.localized.enterYourFullName, //enterYourFullName
                          style: AppTextStyles.fs14w500.copyWith(height: 1.3),
                        ),
                        const Gap(8),
                        SizedBox(
                          height: 44,
                          child: CustomValidatorTextfield(
                            controller: surnameNameController,
                            valueListenable: _surnameNameError,
                            hintText: context.localized.fullname, //fulname
                            onChanged: (value) {
                              checkAllowTapButton();
                            },
                            validator: (String? value) {
                              return null;

                              // if (value == null || value.isEmpty) {
                              //   return _surnameNameError.value = 'Обязательно к заполнению';
                              // }

                              // return _surnameNameError.value = null;
                            },
                          ),
                        ),
                        const Gap(16),
                        Text(
                          context.localized.enterYourEmailAddress, // enterYourEmailAddress
                          style: AppTextStyles.fs14w500.copyWith(height: 1.3),
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

                            // return _emailError.value = ValidatorUtil.emailValidator(
                            //   emailController.text,
                            //   errorLabel: 'Неверный логин',
                            // );
                          },
                        ),
                        const Gap(16),
                        Text(
                          context.localized.enterYourPhoneNumber,
                          style: AppTextStyles.fs14w500.copyWith(height: 1.3),
                        ),
                        const Gap(8),
                        Row(
                          children: [
                            Expanded(
                              child: CustomTextField(
                                height: 44,
                                obscureText: false,
                                focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(12)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(width: 1, color: AppColors.borderTextField),
                                    borderRadius: BorderRadius.circular(12)),
                                prefixIconWidget: Padding(
                                  padding: const EdgeInsets.only(left: 18.0),
                                  child: DropdownButton<Country>(
                                    value: selectedCountry,
                                    borderRadius: BorderRadius.circular(12),
                                    items: countries.map((country) {
                                      return DropdownMenuItem<Country>(
                                        value: country,
                                        child: Text('${country.name} ${country.code}'),
                                      );
                                    }).toList(),
                                    onChanged: (Country? newCountry) {
                                      if (newCountry != null) {
                                        setState(() {
                                          selectedCountry = newCountry;
                                          phoneController.clear();
                                        });
                                      }
                                    },
                                    dropdownColor: Colors.white,
                                    underline: const SizedBox(),
                                  ),
                                ),
                                controller: phoneController,
                                inputFormatters: [
                                  MaskTextInputFormatter(
                                    mask: selectedCountry!.mask,
                                    filter: {"#": RegExp(r'[0-9]')},
                                  ),
                                ],
                                keyboardType: TextInputType.phone,
                                hintText: selectedCountry!.mask.replaceAll('#', '_'),
                                onChanged: (value) {
                                  checkAllowTapButton();
                                },
                                validator: (String? value) {
                                  if (value == null || value.isEmpty) {
                                    return _phoneError.value = context.localized.required_to_fill;
                                  }
                                  String unmasked = value.replaceAll(RegExp(r'[^0-9]'), '');
                                  if (unmasked.length != selectedCountry!.digitLength) {
                                    // return _phoneError.value =
                                    //     context.localized.incorrectNumberFormat;
                                  }
                                  return _phoneError.value = null;
                                },
                              ),
                            ),
                          ],
                        ),
                        const Gap(16),
                        Text(
                          context.localized.enterThePassword,
                          style: AppTextStyles.fs14w500.copyWith(height: 1.3),
                        ),
                        const Gap(6),
                        ValueListenableBuilder(
                          valueListenable: _obscureText,
                          builder: (context, v, c) {
                            return CustomValidatorTextfield(
                              obscureText: _obscureText,
                              controller: passwordController,
                              valueListenable: _passwordError,
                              hintText: context.localized.password,
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
                        const Gap(34),
                        CustomButton(
                          allowTapButton: _allowTapButton,
                          onPressed: () {
                            if (!_formKey.currentState!.validate()) return;
                            String nationalNumber = phoneController.text.replaceAll(RegExp(r'[^0-9]'), '');
                            String fullPhoneNumber = selectedCountry!.code + nationalNumber;
                            // log(emailController.text);
                            // log(surnameNameController.text);
                            // log(passwordController.text);
                            // log(fullPhoneNumber);
                            // log('${Platform.isAndroid}');
                            BlocProvider.of<RegisterCubit>(context).register(
                              email: emailController.text,
                              name: surnameNameController.text,
                              password: passwordController.text,
                              phone: fullPhoneNumber,
                              deviceType: Platform.isAndroid ? 'Android' : 'IOS',
                            );
                          },
                          style: CustomButtonStyles.mainButtonStyle(context),
                          text: context.localized.signUp,
                          child: null,
                        ),
                        const Gap(24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              context.localized.doYouHaveAccount,
                              style: AppTextStyles.fs14w500.copyWith(height: 1.3, color: AppColors.grey969696),
                            ),
                            const Gap(8),
                            GestureDetector(
                              onTap: () {
                                context.router.push(const LoginRoute());
                              },
                              child: Text(
                                context.localized.login,
                                style: AppTextStyles.fs14w600.copyWith(height: 1.3, color: AppColors.mainColor),
                              ),
                            ),
                          ],
                        ),
                        const Gap(24),
                      ],
                    ),
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

class Country {
  final String code;
  final String name;
  final String mask;
  final int digitLength;

  Country({
    required this.code,
    required this.name,
    required this.mask,
    required this.digitLength,
  });
}

List<Country> countries = [
  Country(
    code: '+7',
    name: '🇰🇿',
    mask: '(###) ###-##-##',
    digitLength: 10,
  ),
  Country(
    code: '+998',
    name: '🇺🇿',
    mask: '(##) ###-##-##',
    digitLength: 9,
  ),
];
