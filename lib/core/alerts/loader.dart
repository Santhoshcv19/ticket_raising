import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Loader extends ConsumerWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopScope(
      canPop: false,
      child: AlertDialog(
        elevation: 0,
        icon: const Center(child: CircularProgressIndicator()),
        title: const Text('Please wait...'),
        titleTextStyle: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}
