import 'package:bawabak/core/config/themes/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    required this.hint,
    this.controller,
    this.borderRadius,
    this.validator,
    this.onChanged,
    this.intialValue,
    this.keyboardType,
    this.minLine,
    this.maxLine,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.label,
    this.style,
    this.contentPadding,
    this.fillColor,
    this.withBorder,
  });
  final String hint;
  final String? label;
  final String? intialValue;
  final TextEditingController? controller;
  final double? borderRadius;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;
  final int? minLine;
  final int? maxLine;
  final bool? obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextStyle? style;
  final EdgeInsetsGeometry? contentPadding;
  final Color? fillColor;
  final bool? withBorder;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: style,
      initialValue: intialValue,
      keyboardType: keyboardType,
      minLines: minLine,
      maxLines: maxLine,
      controller: controller,
      obscureText: obscureText ?? false,
      cursorColor: AppColors.primaryColor,
      validator: validator,
      onChanged: onChanged,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),

      decoration: InputDecoration(
        filled: true,
        fillColor: fillColor ?? AppColors.grey.withValues(alpha: 0.1),
        isDense: true,
        contentPadding:
            contentPadding ??
            const EdgeInsets.symmetric(horizontal: 10, vertical: 17),
        hintText: hint,
        labelText: label,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        errorBorder: _buildBorder(color: AppColors.redColor),
        enabledBorder: OutlineInputBorder(
          borderSide: withBorder == true
              ? const BorderSide(color: AppColors.grey, width: 0.3)
              : BorderSide.none,
          borderRadius: BorderRadius.circular(14),
        ),
        focusedBorder: _buildBorder(color: AppColors.primaryColor),
        focusedErrorBorder: _buildBorder(color: AppColors.redColor),
      ),
    );
  }

  OutlineInputBorder _buildBorder({required Color color}) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color, width: 2),
      borderRadius: BorderRadius.circular(20),
    );
  }
}
