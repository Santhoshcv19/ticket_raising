import 'package:flutter/material.dart';
import 'package:ticket_raising_management/core/styles/border_radius.style.dart';

class SecondaryButton extends StatelessWidget {
  final Widget? child;
  final Function onTap;
  final Function? onLongPress;
  final double width;
  final double height;
  final Color? color;
  final double? elevation;
  final ShapeBorder? shape;
  final bool showLoader;
  final Widget? loader;
  final EdgeInsetsGeometry? padding;

  const SecondaryButton({
    super.key,
    required this.child,
    required this.onTap,
    this.onLongPress,
    this.height = 40,
    this.width = 40,
    this.color,
    this.elevation,
    this.shape,
    this.padding,
    this.showLoader = false,
    this.loader,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: elevation,
      onPressed: () => onTap(),
      onLongPress: () => onLongPress == null ? null : onLongPress!(),
      minWidth: width,
      height: height,
      color: color,
      padding: padding,
      shape: shape ?? RoundedRectangleBorder(borderRadius: radius8),
      child: showLoader ? Center(child: loader) : child,
    );
  }
}
