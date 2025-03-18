import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kutim/src/core/gen/assets.gen.dart';
import 'package:kutim/src/core/theme/resources.dart';

class ProductDetailAlert extends StatefulWidget {
  const ProductDetailAlert({super.key});

  @override
  State<ProductDetailAlert> createState() => _ProductDetailAlertState();

  static Future<bool?> show(
    BuildContext context,
  ) async =>
      showDialog(
        context: context,
        useRootNavigator: false,
        builder: (BuildContext context) => const ProductDetailAlert(),
      );
}

class _ProductDetailAlertState extends State<ProductDetailAlert> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      insetPadding: const EdgeInsets.symmetric(horizontal: 40),
      alignment: Alignment.center,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Container(
        // padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 16),
                  child: Image.asset(
                    Assets.images.productExample.path,
                    height: 115,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 16,
                      left: 8,
                    ),
                    child: Text(
                      'Anua Niacinamide 10% + TXA 4% Dark Spot Correcting Serum 30 ml (1.01 fl. oz.)',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.fs14w600.copyWith(letterSpacing: -0.41),
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      context.router.maybePop();
                    },
                    icon: SvgPicture.asset(Assets.icons.close.path))
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 16),
              child: Text(
                'Brightens dark spots, evens skin tone, reduces redness, and prevents new discoloration with 10% niacinamide and 4% tranexamic acid (TXA). Hydrates, strengthens the skin barrier, and enhances radiance. Suitable for dull skin, hyperpigmentation, uneven tone, and post-acne marks.',
                textAlign: TextAlign.center,
                style: AppTextStyles.fs14w100.copyWith(letterSpacing: -0.41),
              ),
            ),
//             const Gap(24),
//             // SvgPicture.asset(Assets.icons..path),
//             const Gap(8),
//             Text(
//               """
// Оплата успешно завершена.
// В ближайшее время с вами свяжется менеджер""",
//               style: AppTextStyles.fs14w400.copyWith(height: 1.4),
//               textAlign: TextAlign.center,
//             ),
//             const Gap(16),
//             CustomButton(
//                 onPressed: () {
//                   context.router.maybePop();
//                 },
//                 style: CustomButtonStyles.greyButtonStyle(context),
//                 child: const Text(
//                   'Ок',
//                   style: AppTextStyles.fs16w600,
//                 ))
          ],
        ),
      ),
    );
  }
}
