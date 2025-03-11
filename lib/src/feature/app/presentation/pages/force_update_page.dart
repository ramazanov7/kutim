import 'package:kutim/src/core/gen/assets.gen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:kutim/src/core/constant/localization/localization.dart';
import 'package:kutim/src/core/presentation/widgets/buttons/custom_button.dart';
import 'package:kutim/src/core/theme/resources.dart';

class ForceUpdatePage extends StatelessWidget {
  const ForceUpdatePage({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
    this.error,
    this.stackTrace,
  });

  factory ForceUpdatePage.forceUpdate({
    required Future<void> Function() onTap,
  }) =>
      ForceUpdatePage(
        title: 'Қосымшаны жаңартыңыз',
        subtitle: 'Қосымшаны ағымдағы нұсқасы жарамсыз',
        icon: 'Assets.images.webp.forceUpdate.path',
        onTap: onTap,
      );

  factory ForceUpdatePage.noInternet({
    required Future<void> Function() onTap,
  }) =>
      ForceUpdatePage(
        title: 'Интернет байланысы жоқ',
        subtitle: 'Wi-Fi немесе ұляы телефоныңыздың қосылымын тексеріп, әрекетті қайталаңыз',
        icon: 'Assets.images.webp.noInternet.path',
        onTap: onTap,
      );

  factory ForceUpdatePage.noAvailable({
    required Future<void> Function() onTap,
    Object? error,
    StackTrace? stackTrace,
  }) =>
      ForceUpdatePage(
        title: 'Localization.currentLocalizations.theServiceIsTemporarilyUnavailable',
        subtitle: 'Бұл процесс жұмыс үстінде, өтінеміз, кейінірек қайталап көріңіз',
        icon: 'Assets.images.webp.appNotAvailable.path',
        onTap: onTap,
        error: error,
        stackTrace: stackTrace,
      );

  factory ForceUpdatePage.lowInternetConnection({
    required Future<void> Function() onTap,
  }) =>
      ForceUpdatePage(
        title: 'Интернет байланысы әлсіз',
        subtitle: 'Интернет байланысын тексеріп, кейінірек қайталап көріңіз',
        icon: 'Assets.images.webp.weakInternetConnection.path',
        onTap: onTap,
      );

  final String title;
  final String subtitle;
  final String icon;
  final Future<void> Function() onTap;

  /// The error that caused the initialization to fail.
  final Object? error;

  /// The stack trace of the error that caused the initialization to fail.
  final StackTrace? stackTrace;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              // SvgPicture.asset(
              //   Assets.images.svg.topGreenCurveContainer.path,
              //   fit: BoxFit.fitWidth,
              // ),
              Positioned(
                bottom: 75,
                right: 25,
                left: 25,
                child: Column(
                  children: [
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.fs26w700.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    const Gap(16),
                    Text(
                      subtitle,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.fs18w500.copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Spacer(),
          if (kDebugMode && error != null && stackTrace != null) ...[
            Text('$error'),
            Text('$stackTrace'),
          ] else
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70),
              child: Image.asset(icon),
            ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16)
                .copyWith(bottom: MediaQuery.viewPaddingOf(context).bottom + 20),
            child: CustomButton(
              onPressed: onTap,
              style: null,
              text: 'Жаңарту',
              child: null,
            ),
          ),
        ],
      ),
    );
  }
}
