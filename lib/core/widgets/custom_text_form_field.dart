import 'package:flutter/material.dart';
import 'package:frutes_app/core/utils/app_text_styles.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.textInputType,
    this.suffixIcon,
    this.onSaved,
    this.obscureText = false,
    this.controller,
  });

  final String hintText;
  final TextInputType textInputType;
  final IconData? suffixIcon;
  final void Function(String?)? onSaved;
  final bool obscureText;
  final TextEditingController? controller;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool isObscure;

  @override
  void initState() {
    super.initState();
    isObscure = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return TextFormField(
      controller: widget.controller,
      obscureText: isObscure,
      onSaved: widget.onSaved,
      cursorColor: theme.colorScheme.primary,
      style: TextStyles.bold13.copyWith(
        color: isDark ? Colors.white : Colors.black87,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'هذا الحقل مطلوب';
        }
        return null;
      },
      keyboardType: widget.textInputType,
      decoration: InputDecoration(
        suffixIcon: widget.obscureText
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
                icon: Icon(
                  isObscure ? Icons.visibility_off : Icons.visibility,
                  color: isDark ? Colors.white70 : Colors.black54,
                ),
              )
            : widget.suffixIcon != null
                ? Icon(
                    widget.suffixIcon,
                    color: isDark ? Colors.white70 : Colors.black54,
                  )
                : null,
        hintStyle: TextStyles.bold13.copyWith(
          color: isDark ? Colors.grey.shade400 : const Color(0xFF949D9E),
        ),
        hintText: widget.hintText,
        filled: true,
        fillColor: isDark ? const Color(0xFF2A2A2A) : const Color(0xFFF9FAFA),
        border: buildBorder(isDark),
        enabledBorder: buildBorder(isDark),
        focusedBorder: buildBorder(isDark),
      ),
    );
  }

  OutlineInputBorder buildBorder(bool isDark) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(
        width: 1,
        color: isDark ? const Color(0xFF555555) : const Color(0xFFE6E9E9),
      ),
    );
  }
}