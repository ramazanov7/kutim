import 'package:flutter/material.dart';
import 'package:kutim/src/core/theme/resources.dart';

class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({
    super.key,
    this.isError = false,
    this.size = 100,
    this.value,
  });
  final bool isError;
  final double size;
  final double? value;

  @override
  Widget build(BuildContext context) => Center(
        child: RepaintBoundary(
          child: CircularProgressIndicator(
            value: value,
            strokeCap: StrokeCap.round,
            valueColor: AlwaysStoppedAnimation<Color>(
              isError ? Colors.red : AppColors.mainColor,
            ),
          ),
        ),
      );
}

class LoaderWidget extends StatelessWidget {
  const LoaderWidget({
    super.key,
    this.value,
  });

  final double? value;

  @override
  Widget build(BuildContext context) => RepaintBoundary(
        child: CircularProgressIndicator(
          value: value,
          strokeCap: StrokeCap.round,
          valueColor: const AlwaysStoppedAnimation<Color>(
            AppColors.mainColor,
          ),
        ),
      );
}
