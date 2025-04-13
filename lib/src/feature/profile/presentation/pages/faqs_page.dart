import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kutim/src/core/gen/assets.gen.dart';
import 'package:kutim/src/core/theme/resources.dart';

@RoutePage()
class FaqsPage extends StatefulWidget {
  const FaqsPage({super.key});

  @override
  State<FaqsPage> createState() => _FaqsPageState();
}

class _FaqsPageState extends State<FaqsPage> {
  final List<Map<String, String>> faqs = [
    {
      "question": "How does the skin analysis work?",
      "answer":
          "The app uses artificial intelligence (AI) and computer vision to analyze a photo of your face. It detects features such as dryness, acne, redness, and other visible skin conditions. Based on this, it identifies your skin type and offers personalized skincare recommendations.",
    },
    {
      "question": "Is it safe to use the camera?",
      "answer":
          "Yes, using the camera is completely safe. The app only accesses your camera or gallery with your permission. Photos are used solely for analysis purposes and are not shared or stored without your consent. All data is processed securely according to privacy policies.",
    },
    {
      "question": "Can I use the app without creating an account?",
      "answer":
          "Yes, you can access basic features without creating an account. However, to save your skin history, track progress, and receive personalized routines, we recommend registering for a better experience.",
    },
    {
      "question": "How often should I perform the analysis?",
      "answer":
          "For best results, we recommend performing the skin analysis once a week. This helps track changes over time and adjust skincare recommendations based on your current condition.",
    },
  ];

  final Set<int> _expandedIndexes = {};

  void _toggleExpand(int index) {
    setState(() {
      if (_expandedIndexes.contains(index)) {
        _expandedIndexes.remove(index);
      } else {
        _expandedIndexes.add(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "FAQs",
          style: AppTextStyles.fs16w500,
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: SvgPicture.asset(Assets.icons.icFaqs.path),
          )
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        itemCount: faqs.length,
        itemBuilder: (context, index) {
          final faq = faqs[index];
          final isExpanded = _expandedIndexes.contains(index);

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () => _toggleExpand(index),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          faq["question"]!,
                          style: AppTextStyles.fs16w400
                        ),
                      ),
                      Icon(
                        isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
              if (isExpanded)
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Text(
                    faq["answer"]!,
                    style: AppTextStyles.fs16w400
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
