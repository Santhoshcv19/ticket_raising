import 'package:flutter/material.dart';
import 'package:ticket_raising_management/core/styles/border_radius.style.dart';
import 'package:ticket_raising_management/core/styles/colors.style.dart';

class KCard extends StatelessWidget {
  final Widget child;
  final Color? color;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;
  final Color? borderColor;

  const KCard({
    super.key,
    required this.child,
    this.color,
    this.margin,
    this.padding,
    this.borderRadius,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: margin ?? EdgeInsets.zero,
      color: color ?? AppColors.backgroundLIGHT,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius ?? radius4,
        side: BorderSide(color: borderColor ?? AppColors.grey300),
      ),
      child: Container(padding: padding, child: child),
    );
  }
}
