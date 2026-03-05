import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frutes_app/core/utils/app_images.dart';
import 'package:frutes_app/core/utils/app_text_styles.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key, this.onChanged, this.controller});
  final void Function(String)? onChanged;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // ناخد الـ Theme الحالي
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: isDark ? Colors.black26 : const Color(0x0A000000),
            blurRadius: 9,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        onChanged: onChanged,
        controller: controller,
        keyboardType: TextInputType.text,
        style: TextStyles.regular13.copyWith(
          color: isDark ? Colors.white : Colors.black87,
        ),
        cursorColor: theme.colorScheme.primary,
        decoration: InputDecoration(
          prefixIcon: SizedBox(
            width: 20,
            child: Center(
              child: SvgPicture.asset(
                Assets.assetsImagesSearchIcon,
                colorFilter: ColorFilter.mode(
                  isDark ? Colors.white : Colors.black54,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          suffixIcon: SizedBox(
            width: 20,
            child: Center(
              child: SvgPicture.asset(
                Assets.assetsImagesFilter,
                colorFilter: ColorFilter.mode(
                  isDark ? Colors.white : Colors.black54,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          hintStyle: TextStyles.regular13.copyWith(
            color: isDark ? Colors.grey.shade400 : const Color(0xFF949D9E),
          ),
          hintText: 'ابحث عن.......',
          filled: true,
          fillColor: isDark ? const Color(0xFF2A2A2A) : Colors.white,
          border: buildBorder(isDark),
          enabledBorder: buildBorder(isDark),
          focusedBorder: buildBorder(isDark),
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder(bool isDark) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(
        width: 1,
        color: isDark ? const Color(0xFF555555) : Colors.white,
      ),
    );
  }
}