import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_network/image_network.dart';

class ImageAttachment extends ConsumerWidget {
  final String? url;

  const ImageAttachment({super.key, required this.url});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if ((url ?? '').isEmpty) return Container();

    return ImageNetwork(
      image: url ?? '',
      height: double.maxFinite,
      width: double.maxFinite,
      duration: 1000,
      curve: Curves.easeIn,
      fullScreen: true,
      fitWeb: BoxFitWeb.contain,
      onLoading: const CircularProgressIndicator(),
    );
  }
}
