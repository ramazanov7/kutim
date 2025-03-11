import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kutim/src/core/theme/resources.dart';

class CustomTabWidget extends StatelessWidget {
  final String icon;
  final String activeIcon;
  final String title;
  final int currentIndex;
  final int tabIndex;
  final int? count;
  const CustomTabWidget({
    super.key,
    required this.icon,
    required this.activeIcon,
    required this.title,
    required this.currentIndex,
    required this.tabIndex,
    this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Tab(
      text: title,
      iconMargin: const EdgeInsets.only(bottom: 8),
      icon: SvgPicture.asset(
        tabIndex == currentIndex ? activeIcon : icon,
      ),
    );
  }
}

class TabDotIndicator extends Decoration {
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _TopIndicatorBoxDark();
  }
}

class _TopIndicatorBoxDark extends BoxPainter {
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {}
}
