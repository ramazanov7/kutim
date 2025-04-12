import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:kutim/src/core/gen/assets.gen.dart';
import 'package:kutim/src/core/theme/resources.dart';
import 'package:kutim/src/feature/profile/presentation/pages/choose_image_bottom_sheet.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class ContactSupportPage extends StatefulWidget {
  const ContactSupportPage({super.key});

  @override
  State<ContactSupportPage> createState() => _ContactSupportPageState();
}

class _ContactSupportPageState extends State<ContactSupportPage> {
  List<File> imageFileList = [];

  final TextEditingController comentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Contact Support",
          style: AppTextStyles.fs16w500,
        ),
        centerTitle: false,
        leading: const BackButton(),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: SvgPicture.asset(Assets.icons.icContactSup.path),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Email", style: AppTextStyles.fs16w600),
            const Gap(20),
            Row(
              children: [
                SvgPicture.asset(
                  Assets.icons.icLink.path,
                  height: 20,
                ),
                const SizedBox(width: 6),
                GestureDetector(
                  onTap: () async {
                    final Uri youtubeUri = Uri.parse(
                      'https://www.youtube.com/watch?v=QidS5vPaw5U&list=RDn2dC5sEVacw&index=21',
                    );
                    if (await canLaunchUrl(youtubeUri)) {
                      await launchUrl(youtubeUri, mode: LaunchMode.externalApplication);
                    } else {
                      debugPrint('Could not launch the URL');
                    }
                  },
                  child: Text("support@kutim.com", style: AppTextStyles.fs16w400),
                ),
              ],
            ),
            const Gap(22),
            const Text(
              "Send a request",
              style: AppTextStyles.fs16w400,
            ),
            const Gap(19),
            TextField(
              controller: comentController,
            ),
            const Gap(26),
            _addImageSection(),
            const Gap(20),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.mainColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "Send",
                  style: AppTextStyles.fs14w500.copyWith(color: AppColors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _addImageSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          child: imageFileList.isEmpty
              ? InkWell(
                  onTap: () async {
                    await ChooseImageBottomSheet.show(
                      context,
                      avatar: false,
                      image: (image) {
                        if (image != null) {
                          imageFileList.add(image);
                        }
                        setState(() {});
                      },
                    );
                  },
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: AppColors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            "You can attach a screenshot",
                            style: AppTextStyles.fs14w400,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 12),
                          child: SvgPicture.asset(Assets.icons.icAddPhoto.path),
                        ),
                      ],
                    ),
                  ),
                )
              : SizedBox(
                  height: 80,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      SizedBox(
                        height: 80,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: imageFileList.length,
                          scrollDirection: Axis.horizontal,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.only(left: index == 0 ? 0 : 10.0),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(Radius.circular(12)),
                                child: Stack(
                                  children: [
                                    Image.file(
                                      File(imageFileList[index].path),
                                      height: 80,
                                      width: 90,
                                      fit: BoxFit.cover,
                                    ),
                                    Positioned(
                                      top: 2,
                                      right: 2,
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            imageFileList.removeAt(index);
                                          });
                                        },
                                        child: Container(
                                          decoration: const BoxDecoration(
                                              color: AppColors.backgroundInput, shape: BoxShape.circle),
                                          child: SvgPicture.asset(
                                            Assets.icons.close.path,
                                            height: 20,
                                            width: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const Gap(8),
                      if (imageFileList.length < 5)
                        Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: InkWell(
                            onTap: () async {
                              await ChooseImageBottomSheet.show(
                                context,
                                avatar: false,
                                image: (image) {
                                  if (image != null) {
                                    imageFileList.add(image);
                                  }

                                  setState(() {});
                                },
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: AppColors.mainColor, width: 1),
                                  borderRadius: BorderRadius.circular(12)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 23.75),
                                child: SvgPicture.asset(
                                  Assets.icons.icAddPhoto.path,
                                  height: 24,
                                  width: 24,
                                  color: AppColors.mainColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
        ),
      ],
    );
  }
}
