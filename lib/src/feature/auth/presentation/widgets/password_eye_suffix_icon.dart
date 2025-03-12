import 'package:flutter/material.dart';

class PasswordEyeSuffixIcon extends StatelessWidget {
  const PasswordEyeSuffixIcon({
    super.key,
    required this.valueListenable,
    this.hasError = true,
  });
  final ValueNotifier<bool> valueListenable;
  final bool hasError;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        valueListenable.value = !valueListenable.value;
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 16, left: 10),
        child: Icon(
          valueListenable.value ? Icons.visibility : Icons.visibility_off,
          color: Colors.black,
        ),
      ),
    );
  }
}
