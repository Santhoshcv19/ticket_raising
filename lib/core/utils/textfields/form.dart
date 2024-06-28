import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticket_raising_management/core/styles/colors.style.dart';

class AppFormField extends ConsumerWidget {
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
  final String? Function(String)? onFieldSubmitted;

  const AppFormField({
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
    this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextFormField(
      onFieldSubmitted: onFieldSubmitted,
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

class MapFormField extends FormField<Map<String, dynamic>> {
  MapFormField({
    super.key,
    required FormFieldSetter<Map<String, dynamic>> super.onSaved,
    required FormFieldValidator<Map<String, dynamic>> super.validator,
    Map<String, dynamic>? initialValue,
    AutovalidateMode super.autovalidateMode = AutovalidateMode.disabled,
  }) : super(
          initialValue: initialValue ?? {},
          builder: (FormFieldState<Map<String, dynamic>> state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Custom UI to display the map values
                // For example:
                TextFormField(
                  initialValue: state.value?['field1'] as String? ?? '',
                  onChanged: (val) {
                    state.value?['field1'] = val;
                    state.didChange(state.value);
                  },
                  decoration: InputDecoration(
                    labelText: 'Field 1',
                    errorText: state.errorText,
                  ),
                ),
                // Add more fields as necessary
              ],
            );
          },
        );
}
