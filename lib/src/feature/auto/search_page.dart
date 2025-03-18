import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:kutim/src/core/gen/assets.gen.dart';
import 'package:kutim/src/core/presentation/widgets/textfields/custom_textfield.dart';
import 'package:kutim/src/core/theme/resources.dart';
import 'package:kutim/src/feature/auto/widget/product_detail_alert.dart';

@RoutePage()
class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Gap(63),

          ///
          /// <--`search`-->
          ///
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              height: 40,
              decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(30)), boxShadow: [
                BoxShadow(blurRadius: 4, spreadRadius: 0, offset: Offset(0, 4), color: AppColors.circle)
              ]),
              child: TextField(
                decoration: InputDecoration(
                    fillColor: AppColors.backgroundColor2,
                    filled: true,
                    enabledBorder:
                        OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: AppColors.mainColor)),
                    hintText: 'Search',
                    hintStyle: AppTextStyles.fs14w300.copyWith(color: AppColors.textFieldBorder, height: 1.7),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 12, top: 12, bottom: 12),
                      child: SvgPicture.asset(Assets.icons.search.path),
                    )),
              ),
            ),
          ),

          ///
          /// <--`list`-->
          ///
          Expanded(
            child: GridView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.only(left: 16, top: 20, right: 16),
              scrollDirection: Axis.vertical,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 8,
                mainAxisSpacing: 14,
              ),
              itemCount: 10,
              // itemCount: catalogTitle.length,
              itemBuilder: (context, index) {
                return Material(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(30),
                    onTap: () {
                      ProductDetailAlert.show(context);
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          Assets.images.productExample.path,
                          height: 190,
                        ),
                        const Gap(8),
                        Text(
                          'Anua Niacinamide 10% + TXA 4% Dark Spot Correcting Serum',
                          textAlign: TextAlign.center,
                          style: AppTextStyles.fs14w300.copyWith(letterSpacing: -0.41),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
