import 'package:kutim/src/core/gen/assets.gen.dart';
import 'package:kutim/src/core/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kutim/src/core/theme/resources.dart';

class SearchWidget extends StatefulWidget {
  final TextEditingController? searchController;
  final bool? readOnly;
  final InputBorder? focusedBorder;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final Widget? suffixIcon;
  final BoxConstraints? suffixIconConstraints;
  final bool? autofocus;

  const SearchWidget({
    super.key,
    this.searchController,
    this.readOnly,
    this.focusedBorder,
    this.onTap,
    this.suffixIcon,
    this.suffixIconConstraints,
    this.onChanged,
    this.onFieldSubmitted,
    this.autofocus,
  });

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        height: 46,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: AppColors.backgroundColor, // BorderRadius applied to the Container
        ),
        child: TextFormField(
          autofocus: widget.autofocus ?? false,
          readOnly: widget.readOnly ?? false,
          controller: widget.searchController,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,
            fillColor: AppColors.backgroundColor,
            isCollapsed: true,
            // prefixIcon: Padding(
            //   padding: const EdgeInsets.only(
            //     top: 12,
            //     bottom: 12,
            //   ),
            //   child: SvgPicture.asset(
            //     Assets.icons.search.path,
            //   ),
            // ),
            hintText: context.localized.search,
            hintStyle: AppTextStyles.fs16w500.copyWith(color: AppColors.greyTextColor),
            suffixIcon: widget.suffixIcon,
            suffixIconConstraints: widget.suffixIconConstraints,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: AppColors.borderColor,
                )),
            focusedBorder: widget.focusedBorder,
            // OutlineInputBorder(
            //     borderRadius: BorderRadius.circular(16),
            //     borderSide: const BorderSide(color: AppColors.tabActive, width: 0.5)),
          ),
          style: const TextStyle(
            color: Colors.black,
          ),
          textAlignVertical: TextAlignVertical.center,
          onTap: widget.onTap,
          onChanged: widget.onChanged,
          onFieldSubmitted: widget.onFieldSubmitted ??
              (value) {
                if (value.isNotEmpty) {}
              },
        ),
      ),
    );
  }
}
