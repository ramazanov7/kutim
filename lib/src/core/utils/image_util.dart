import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:kutim/src/core/theme/resources.dart';

class ImageUtil {
  ImageUtil._();

  static Widget loadingBuilder(
    BuildContext context,
    Widget child,
    ImageChunkEvent? loadingProgress,
  ) {
    if (loadingProgress == null) {
      return child;
    }
    return Center(
      child: CircularProgressIndicator.adaptive(
        backgroundColor: AppColors.mainColor,
        value: loadingProgress.expectedTotalBytes != null
            ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
            : null,
      ),
    );
  }

  static Widget cachedLoadingBuilder(
    BuildContext context,
    String url,
    DownloadProgress? downoadProgress,
  ) {
    return Center(
      child: CircularProgressIndicator.adaptive(
        backgroundColor: AppColors.mainColor,
        value: downoadProgress?.progress,
      ),
    );
  }
}
