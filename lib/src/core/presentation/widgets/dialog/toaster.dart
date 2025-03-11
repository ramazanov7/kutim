import 'package:kutim/src/core/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gap/gap.dart';
import 'package:kutim/src/core/theme/resources.dart';

@sealed
class Toaster {
  const Toaster._();

  static void showTopShortToast(
    BuildContext context, {
    required String message,
    double radius = 12,
    EdgeInsetsGeometry? padding = const EdgeInsets.all(14),
    Color? color,
    Widget? body,
    String? svgIconPath,
  }) {
    FToast().removeQueuedCustomToasts();

    final Widget toast = Container(
      padding: padding,
      margin: const EdgeInsets.symmetric(horizontal: 32),
      // width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(color: Colors.black.withOpacity(0), width: 0.5),
        color: color ?? Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Color(0x28000000),
            blurRadius: 24,
          ),
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 2,
          ),
        ],
      ),
      child: body ??
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // SvgPicture.asset(
              //   svgIconPath ?? Assets.icons.icLikeActive.path,
              //   width: 20,
              //   height: 20,
              // ),
              // const SizedBox(width: 12),
              Text(
                message,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
    );

    FToast().showToast(
      child: toast,
      gravity: ToastGravity.TOP,
      toastDuration: const Duration(milliseconds: 1500),
      positionedToastBuilder: (context, child, q) {
        return Positioned(
          top: 50.0,
          left: 0,
          right: 0,
          // left: MediaQuery.of(context).size.width / 3,
          child: child,
        );
      },
    );
  }

  static void showErrorTopShortToast(
    BuildContext context,
    String message, {
    double radius = 12,
    EdgeInsetsGeometry? padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    Color? color,
    Widget? body,
  }) {
    FToast().removeQueuedCustomToasts();

    final Widget toast = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(color: Colors.black.withOpacity(0), width: 0.5),
          color: color ?? Colors.white,
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 1),
              color: Color.fromRGBO(12, 12, 13, 0.05),
              blurRadius: 4,
            ),
            BoxShadow(
              offset: Offset(0, 1),
              color: Color.fromRGBO(12, 12, 13, 0.1),
              blurRadius: 4,
            ),
          ],
        ),
        child: body ??
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // SvgPicture.asset(
                //   Assets.icons.closeRedCircle.path,
                //   width: 22,
                //   height: 22,
                // ),
                const Gap(8),
                Flexible(
                  child: Text(
                    message,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.fs14w500,
                  ),
                ),
              ],
            ),
      ),
    );

    FToast().showToast(
      child: toast,
      gravity: ToastGravity.TOP,
      toastDuration: const Duration(milliseconds: 2005),
      positionedToastBuilder: (context, child, q) {
        return Positioned(
          top: 50.0,
          left: 0,
          right: 0,
          // left: MediaQuery.of(context).size.width / 3,
          child: child,
        );
      },
    );
  }
}
