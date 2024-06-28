import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ticket_raising_management/core/styles/colors.style.dart';
import 'package:ticket_raising_management/core/utils/texts/body.text.dart';

class Photo extends StatelessWidget {
  final String image;
  final double? size;

  const Photo({super.key, required this.image, this.size});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      height: size,
      width: size,
      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) => child,
      errorBuilder: (context, object, stackTrace) => const Center(
        child: Icon(Icons.error),
      ),
    );
  }
}

class MemoryImg extends StatelessWidget {
  final Uint8List image;

  const MemoryImg({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Image.memory(
      image,
      fit: BoxFit.cover,
      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) => child,
      errorBuilder: (context, object, stackTrace) => const Center(
        child: AppBodyText(data: 'Error !'),
      ),
    );
  }
}

class Svg extends StatelessWidget {
  final String svg;
  final double? size;
  final Color? color;

  const Svg({
    super.key,
    required this.svg,
    this.size,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      svg,
      height: size,
      width: size,
      colorFilter: ColorFilter.mode(color ?? AppColors.black, BlendMode.srcIn),
    );
  }
}

class SvgLite extends StatelessWidget {
  final String svg;
  final double? size;

  const SvgLite({super.key, required this.svg, this.size});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(svg, height: size, width: size);
  }
}

class FileImageWidget extends StatelessWidget {
  final File file;
  final double? radius;

  const FileImageWidget({
    super.key,
    required this.file,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius ?? 0),
      child: Image.file(
        file,
        height: radius,
        width: radius,
        frameBuilder: (context, child, frame, wasSync) => child,
        errorBuilder: (context, object, stackTrace) => const Center(
          child: Icon(Icons.error),
        ),
        fit: BoxFit.cover,
        filterQuality: FilterQuality.medium,
      ),
    );
  }
}
