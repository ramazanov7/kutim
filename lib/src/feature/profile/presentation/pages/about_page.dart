import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:kutim/src/core/gen/assets.gen.dart';
import 'package:kutim/src/core/presentation/widgets/buttons/custom_button.dart';
import 'package:kutim/src/core/presentation/widgets/dialog/toaster.dart';
import 'package:kutim/src/core/presentation/widgets/textfields/custom_validator_textfield.dart';
import 'package:kutim/src/core/theme/resources.dart';
import 'package:kutim/src/core/utils/extensions/context_extension.dart';
import 'package:kutim/src/feature/app/router/app_router.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  final TextEditingController surnameController = TextEditingController();

  final ValueNotifier<String?> _surnameError = ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "About",
          style: AppTextStyles.fs16w500,
        ),
        centerTitle: false,
        leading: const BackButton(),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: SvgPicture.asset(Assets.icons.icAbout.path),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildListItem(
                imgPath: Assets.icons.icAbout.path,
                checked: true,
                text: "Name: KUTIM — AI Skin Analyzer",
              ),
              _buildListItem(
                imgPath: Assets.icons.icVersion.path,
                checked: false,
                text: "Version: 1.0.0",
              ),
              _buildListItem(
                imgPath: Assets.icons.icTeam.path,
                checked: true,
                text: "The development team (...)",
              ),
              _buildListItem(
                imgPath: Assets.icons.icPurpose.path,
                checked: false,
                text: "Purpose: individual selection of skin care",
              ),
              _buildClickableListItem(
                checked: true,
                text: "Privacy Policy",
                onTap: () => _launchUrl('https://flutter.dev'),
              ),
              _buildClickableListItem(
                checked: true,
                text: "Terms of Use",
                onTap: () => _launchUrl('https://flutter.dev'),
              ),
              const Gap(20),

              ///
              /// <--`edit surname`-->
              ///
              const Text(
                'Write you own opinion for improving our products',
                style: AppTextStyles.fs16w500,
              ),
              const Gap(10),
              CustomValidatorTextfield(
                controller: surnameController,
                valueListenable: _surnameError,
                hintText: 'Write a review',
                onChanged: (value) {
                  setState(() {});
                },
                validator: (String? value) {
                  // if (value == null || value.isEmpty) {
                  //   return _surnameError.value = context.localized.required_to_fill;
                  // }

                  return _surnameError.value = null;
                },
              ),
              const Gap(20),
              CustomButton(
                  onPressed: () {
                    if (surnameController.text.isNotEmpty) {
                      Toaster.showTopShortToast(context, message: 'Successfully sent');
                    }
                    surnameController.text = '';
                  },
                  style: null,
                  child: const Text('Send feedback')),
              if (context.repository.authRepository.user?.fullName == 'admin')
                CustomButton(
                    onPressed: () {
                      context.router.push(const AdminRoute());
                    },
                    style: null,
                    child: const Text('Admin'))
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListItem({
    required bool checked,
    required String text,
    required String imgPath,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        children: [
          SvgPicture.asset(imgPath),
          const Gap(20),
          Text(
            text,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildClickableListItem({
    required bool checked,
    required String text,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          children: [
            SvgPicture.asset(
              Assets.icons.icLink.path,
              height: 20,
            ),
            const Gap(12),
            Text(
              text,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }
}
