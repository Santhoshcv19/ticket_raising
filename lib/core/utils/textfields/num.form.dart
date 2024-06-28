import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticket_raising_management/core/styles/colors.style.dart';

class NumFormField extends ConsumerWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? hintText;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final InputBorder? border;
  final bool? filled;
  final int? minLines;
  final int? maxLines;
  final Color? color;
  final bool? enabled;
  final TextAlign? textAlign;
  final EdgeInsets? contentPadding;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? prefixIconColor;
  final int? maxLength;
  final bool? obscureText;
  final String? Function(String?)? validator;

  const NumFormField({
    super.key,
    this.controller,
    this.focusNode,
    this.hintText,
    this.textStyle,
    this.hintStyle,
    this.border,
    this.filled,
    this.minLines,
    this.maxLines,
    this.color,
    this.enabled,
    this.textAlign,
    this.contentPadding,
    this.suffixIcon,
    this.prefixIcon,
    this.prefixIconColor,
    this.maxLength,
    this.obscureText,
    this.validator,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextFormField(
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      controller: controller,
      focusNode: focusNode,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        filled: filled,
        fillColor: AppColors.white,
        contentPadding: contentPadding,
        border: border,
        enabledBorder: border,
        focusedBorder: border,
        hintText: hintText,
        hintStyle: hintStyle?.copyWith(color: color),
        prefixIcon: prefixIcon,
        prefixIconColor: prefixIconColor,
        suffixIcon: suffixIcon,
      ),
      validator: validator,
      style: textStyle?.copyWith(color: color),
      minLines: minLines,
      maxLines: maxLines,
      maxLength: maxLength,
      enabled: enabled,
      textAlign: textAlign ?? TextAlign.start,
    );
  }
}
