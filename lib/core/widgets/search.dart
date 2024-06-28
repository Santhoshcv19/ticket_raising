import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticket_raising_management/core/styles/border_radius.style.dart';
import 'package:ticket_raising_management/core/styles/colors.style.dart';
import 'package:ticket_raising_management/core/styles/dimenstions.style.dart';

class AppSearchBar extends ConsumerWidget {
  final SearchController controller;
  final String? hintText;
  final FutureOr<Iterable<Widget>> Function(
    BuildContext,
    SearchController,
  ) suggestionsBuilder;

  const AppSearchBar({
    super.key,
    required this.controller,
    this.hintText,
    required this.suggestionsBuilder,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = Theme.of(context).scaffoldBackgroundColor;

    return SearchAnchor.bar(
      searchController: controller,
      barPadding: const WidgetStatePropertyAll(Dimen.textMargin),
      barElevation: const WidgetStatePropertyAll(0),
      viewElevation: 0,
      barBackgroundColor: WidgetStatePropertyAll(color),
      viewBackgroundColor: color,
      viewShape: const RoundedRectangleBorder(),
      barShape: WidgetStatePropertyAll(RoundedRectangleBorder(
        borderRadius: radius8,
        side: BorderSide(width: 1.5, color: AppColors.grey300),
      )),
      barLeading: const Icon(
        Icons.search,
        size: Dimen.icon * 1.25,
        color: AppColors.grey,
      ),
      barHintText: hintText,
      suggestionsBuilder: suggestionsBuilder,
    );
  }
}
