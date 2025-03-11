import 'package:auto_route/auto_route.dart';
import 'package:kutim/src/core/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:kutim/src/core/presentation/widgets/bottomsheet/custom_drag_handle.dart';
import 'package:kutim/src/core/presentation/widgets/buttons/custom_material_button.dart';
import 'package:kutim/src/core/presentation/widgets/other/custom_radio.dart';
import 'package:kutim/src/core/theme/resources.dart';

import 'package:kutim/src/feature/auth/models/common_dto.dart';

class ChooseClassBottomSheet extends StatefulWidget {
  const ChooseClassBottomSheet({
    super.key,
    this.chosenClass,
    required this.classes,
  });
  final List<CommonDTO> classes;
  final CommonDTO? chosenClass;

  @override
  _ChooseClassBottomSheetState createState() => _ChooseClassBottomSheetState();

  static Future<CommonDTO?> show(
    BuildContext context, {
    required List<CommonDTO> classes,
    CommonDTO? chosenClass,
  }) =>
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => ChooseClassBottomSheet(
          classes: classes,
          chosenClass: chosenClass,
        ),
      );
}

class _ChooseClassBottomSheetState extends State<ChooseClassBottomSheet> {
  int? chosenClassIndex;
  @override
  void initState() {
    if (widget.chosenClass != null) {
      chosenClassIndex = widget.classes.indexWhere((e) => widget.chosenClass?.id == e.id);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) => DraggableScrollableSheet(
        expand: false,
        maxChildSize: 0.85,
        minChildSize: 0.5,
        initialChildSize: 0.65,
        builder: (context, scrollController) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CustomDragHandle(),
            const Gap(16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Укажите свой класс',
                    style: AppTextStyles.fs24w700,
                  ),
                  // CustomMaterialButton(
                  //   onTap: () {
                  //     context.router.maybePop();
                  //   },
                  //   child: SvgPicture.asset(Assets.icons.close.path),
                  // ),
                ],
              ),
            ),
            const Gap(12),
            Flexible(
              child: ListView.builder(
                itemCount: widget.classes.length,
                controller: scrollController,
                itemBuilder: (context, index) => CustomMaterialButton(
                  borderRadiusGeometry: BorderRadius.zero,
                  onTap: () {
                    context.router.maybePop(widget.classes[index]);
                  },
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.classes[index].name ?? 'no text',
                        style: AppTextStyles.fs16w400h1_6,
                      ),
                      CustomRadio(
                        value: index,
                        groupValue: chosenClassIndex,
                        onChanged: (int index) {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
