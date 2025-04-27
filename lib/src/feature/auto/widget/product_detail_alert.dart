import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kutim/src/core/constant/constants.dart';
import 'package:kutim/src/core/gen/assets.gen.dart';
import 'package:kutim/src/core/theme/resources.dart';
import 'package:kutim/src/core/utils/image_util.dart';
import 'package:kutim/src/feature/main/model/product_dto.dart';

class ProductDetailAlert extends StatefulWidget {
  const ProductDetailAlert({super.key, this.productDTO});

  final ProductDTO? productDTO;

  @override
  State<ProductDetailAlert> createState() => _ProductDetailAlertState();

  static Future<bool?> show(BuildContext context, {ProductDTO? productDTO}) async => showDialog(
        context: context,
        useRootNavigator: false,
        builder: (BuildContext context) => ProductDetailAlert(
          productDTO: productDTO,
        ),
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
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 2,
                        ),
                      ],
                    ),
                    child: CachedNetworkImage(
                      imageUrl: widget.productDTO?.image ?? NOT_FOUND_IMAGE,
                      height: 115,
                      width: 100,
                      fit: BoxFit.cover,
                      progressIndicatorBuilder: ImageUtil.cachedLoadingBuilder,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 16,
                      left: 8,
                    ),
                    child: Text(
                      '${widget.productDTO?.name}',
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
                '${widget.productDTO?.description}',
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
