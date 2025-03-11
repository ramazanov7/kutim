import 'package:flutter/material.dart';

class ScrollWrapper extends StatelessWidget {
  const ScrollWrapper({
    required this.child,
    super.key,
    this.controller,
  });
  final Widget child;
  final ScrollController? controller;

  @override
  Widget build(BuildContext context) => CustomScrollView(
        controller: controller,
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: child,
          ),
        ],
      );
}
