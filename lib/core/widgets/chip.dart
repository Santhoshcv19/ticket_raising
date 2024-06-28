import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticket_raising_management/core/styles/border_radius.style.dart';
import 'package:ticket_raising_management/core/styles/colors.style.dart';

class ManualChip extends ConsumerWidget {
  final String label;
  final IconData? icon;
  final Color? color;
  final Color? fontColor;
  final TextStyle? style;

  const ManualChip({
    required this.label,
    this.icon,
    this.color,
    this.fontColor,
    this.style,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var leadIcon = icon != null ? Icon(icon, color: fontColor, size: 14) : null;
    final textStyle = style ?? Theme.of(context).textTheme.bodySmall;
    final kFontColor = fontColor ?? AppColors.white;

    return Chip(
      avatar: leadIcon,
      label: Text(label),
      labelStyle: textStyle?.copyWith(color: kFontColor),
      color: WidgetStatePropertyAll(color),
      shape: RoundedRectangleBorder(
        borderRadius: radius32,
        side: BorderSide(color: color ?? AppColors.white, width: 1),
      ),
    );
  }
}
