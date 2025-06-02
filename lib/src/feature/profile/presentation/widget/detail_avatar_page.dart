import 'dart:developer';
import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kutim/src/core/theme/resources.dart';

@RoutePage()
class DetailAvatarPage extends StatefulWidget {
  final String? image;
  final XFile? xFile;
  const DetailAvatarPage({
    super.key,
    this.image,
    this.xFile,
  });

  @override
  State<DetailAvatarPage> createState() => _DetailAvatarPageState();
}

class _DetailAvatarPageState extends State<DetailAvatarPage> {
  int imageIndex = 0;
  PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: imageIndex);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
      ),
      backgroundColor: AppColors.muteGrey,
      body: Column(
        children: [
          const Gap(34),
          widget.xFile != null
              ? InteractiveViewer(
                  panEnabled: false,
                  boundaryMargin: const EdgeInsets.all(100),
                  minScale: 0.5,
                  maxScale: 2,
                  child: Container(
                    height: 530,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 5.6,
                        ),
                      ],
                    ),
                    child: Image.file(
                      File(widget.xFile?.path ?? ''),
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : SizedBox(
                  height: 530,
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        imageIndex = index;
                        log('$imageIndex', name: 'image index');
                      });
                    },
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
                        child: InteractiveViewer(
                            panEnabled: false,
                            boundaryMargin: const EdgeInsets.all(100),
                            minScale: 0.5,
                            maxScale: 2,
                            child: CachedNetworkImage(
                              imageUrl: widget.image ?? '',
                              fit: BoxFit.contain,
                              width: double.infinity,
                              height: 430,
                            )),
                      );
                    },
                  ),
                ),
          const Gap(6),
        ],
      ),
    );
  }
}
