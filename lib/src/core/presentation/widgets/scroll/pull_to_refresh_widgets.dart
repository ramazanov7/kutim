import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:kutim/src/core/utils/extensions/context_extension.dart';

class RefreshClassicHeader extends StatelessWidget {
  const RefreshClassicHeader({super.key});

  @override
  Widget build(BuildContext context) => ClassicHeader(
        completeText: context.localized.successfullyUpdated,
        releaseText: context.localized.update,
        idleText: context.localized.pullDownToRefresh,
        // failedText: context.localized.unknownError,
        // refreshingText: context.localized.updateDotDotDot,
        // completeText: '',
        // completeIcon: null,
        // completeDuration: Duration.zero,
      );
}

class RefreshClassicFooter extends StatelessWidget {
  const RefreshClassicFooter({super.key});

  @override
  Widget build(BuildContext context) => const ClassicFooter(
        idleText: '',
        failedText: 'context.localized.unknownError',
        loadingText: 'context.localized.uploadingDotDotDot',
        canLoadingText: ' context.localized.pullUpToLoadTheData',
        noDataText: '',
        idleIcon: null,
      );
}

class TextfieldSearchFooter extends StatelessWidget {
  const TextfieldSearchFooter({super.key});

  @override
  Widget build(BuildContext context) => const ClassicFooter(
        idleText: '',
        failedText: 'context.localized.unknownError',
        loadingText: 'context.localized.uploadingDotDotDot',
        canLoadingText: 'context.localized.pullUpToLoadTheData',
        noDataText: '',
        idleIcon: null,
      );
}
