import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticket_raising_management/core/utils/assets/assets.dart';
import 'package:ticket_raising_management/core/widgets/image.dart';

class UnderDevelopment extends ConsumerWidget {
  const UnderDevelopment({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      alignment: Alignment.center,
      child: const Photo(image: Assets.underDevelopment),
    );
  }
}
