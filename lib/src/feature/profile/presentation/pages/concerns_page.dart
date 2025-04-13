import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kutim/src/core/gen/assets.gen.dart';
import 'package:kutim/src/core/theme/resources.dart';

@RoutePage()
class ConcernsPage extends StatefulWidget {
  const ConcernsPage({super.key});

  @override
  State<ConcernsPage> createState() => _ConcernsPageState();
}

class _ConcernsPageState extends State<ConcernsPage> {
  final List<String> concerns = [
    "Acne",
    "Dryness",
    "Dark Spots",
    "Redness",
    "Wrinkles",
    "Sensitivity",
    "Oiliness",
    "Other",
  ];

  final Set<String> selectedConcerns = {"Acne", "Dryness"};

  void toggleConcern(String concern) {
    setState(() {
      if (selectedConcerns.contains(concern)) {
        selectedConcerns.remove(concern);
      } else {
        selectedConcerns.add(concern);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Concerns",
          style: AppTextStyles.fs16w500,
        ),
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.of(context).pop(selectedConcerns.toList());
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: SvgPicture.asset(Assets.icons.concerns.path),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.builder(
          itemCount: concerns.length,
          itemBuilder: (context, index) {
            final item = concerns[index];
            final isSelected = selectedConcerns.contains(item);
            return InkWell(
              onTap: () => toggleConcern(item),
              borderRadius: BorderRadius.circular(10),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      item,
                      style: const TextStyle(fontSize: 16),
                    ),
                    item == 'Other'
                        ? const Icon(Icons.more_horiz, color: Color(0xFF0D5C63))
                        : isSelected
                            ? SvgPicture.asset(Assets.icons.icSelected.path)
                            : SvgPicture.asset(Assets.icons.icNotSelected.path)
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
