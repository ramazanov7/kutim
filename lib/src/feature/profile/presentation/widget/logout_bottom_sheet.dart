import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kutim/src/core/presentation/widgets/bottomsheet/custom_drag_handle.dart';
import 'package:kutim/src/core/presentation/widgets/buttons/custom_button.dart';
import 'package:kutim/src/core/theme/resources.dart';

class LogoutBottomSheet extends StatefulWidget {
  const LogoutBottomSheet({super.key, this.onPressed, this.isDeleteAccount});

  final void Function()? onPressed;
  final bool? isDeleteAccount;

  @override
  State<LogoutBottomSheet> createState() => _LogoutBottomSheetState();

  static Future<void> show(BuildContext context, {void Function()? onPressed, bool? isDeleteAccount}) =>
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        useRootNavigator: true,
        builder: (context) => LogoutBottomSheet(onPressed: onPressed, isDeleteAccount: isDeleteAccount),
      );
}

class _LogoutBottomSheetState extends State<LogoutBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CustomDragHandle(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.isDeleteAccount == true ? 'Delete an account?' : "Log out of your account",
                style: AppTextStyles.fs18w700,
              ),
              const Gap(12),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          const Gap(22),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: Row(
              children: [
                Expanded(
                  child: CustomButton(
                    height: 47,
                    width: 166,
                    onPressed: widget.onPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.white,
                      side: const BorderSide(color: AppColors.mainColor, width: 2),
                      elevation: 0,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    ),
                    child: Text(
                      widget.isDeleteAccount == true ? 'Delete' : 
                      'Yes get out',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.mainColor,
                      ),
                    ),
                  ),
                ),
                const Gap(11),
                Expanded(
                  child: CustomButton(
                    height: 47,
                    width: 166,
                    onPressed: () {
                      context.router.maybePop();
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: AppColors.mainColor,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    ),
                    child: Text(
                      "No",
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Gap(20),
        ],
      ),
    );
  }
}
