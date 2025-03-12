import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTabWidget extends StatelessWidget {
  final String icon;
  final String activeIcon;
  final String title;
  final int currentIndex;
  final int tabIndex;
  final int? count;
  final bool? isNotSvg;
  const CustomTabWidget({
    super.key,
    required this.icon,
    required this.activeIcon,
    required this.title,
    required this.currentIndex,
    required this.tabIndex,
    this.count,
    this.isNotSvg,
  });

  @override
  Widget build(BuildContext context) {
    return Tab(
        // text: title,
        iconMargin: const EdgeInsets.only(bottom: 8),
        icon: isNotSvg == true
            ? Image.asset(
                height: 28,
                tabIndex == currentIndex ? activeIcon : icon,
              )
            : SvgPicture.asset(
                height: 22,
                tabIndex == currentIndex ? activeIcon : icon,
              ));
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
