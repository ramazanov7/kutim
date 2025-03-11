import 'package:flutter/material.dart';
import 'package:kutim/src/core/theme/resources.dart';

class CustomRadio extends StatefulWidget {
  const CustomRadio({
    required this.value,
    required this.onChanged,
    super.key,
    this.groupValue,
    this.size = 24,
    this.color,
  });
  final double size;
  final int value;
  final int? groupValue;
  final void Function(int index) onChanged;
  final Color? color;

  @override
  State createState() => _CustomRadioState();
}

class _CustomRadioState extends State<CustomRadio> {
  @override
  Widget build(BuildContext context) {
    final selected = widget.value == widget.groupValue;

    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(15)),
      onTap: () => widget.onChanged(widget.value),
      child: Container(
        height: widget.size,
        width: widget.size,
        decoration: BoxDecoration(
          color: selected ? Colors.black : AppColors.grey2,
          border: selected
              ? null
              : const Border.fromBorderSide(
                  BorderSide(
                    color: Color(0xffe0e0e0),
                    width: 1.5,
                  ),
                ),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: selected
              ? const Icon(
                  Icons.check,
                  size: 17,
                  color: Colors.white,
                )
              : const SizedBox(),
        ),
      ),
    );
  }
}
