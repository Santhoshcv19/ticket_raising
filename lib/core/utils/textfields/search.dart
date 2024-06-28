import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticket_raising_management/core/styles/border_radius.style.dart';
import 'package:ticket_raising_management/core/styles/colors.style.dart';
import 'package:ticket_raising_management/core/styles/dimenstions.style.dart';

class AppSearchField extends ConsumerWidget {
  final TextEditingController controller;
  final String? hintText;

  const AppSearchField({super.key, required this.controller, this.hintText});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 40,
      child: TextField(
        decoration: InputDecoration(
          contentPadding: Dimen.horizontalMargin,
          border: OutlineInputBorder(
            borderRadius: radius8,
            borderSide: BorderSide(width: 1.5, color: AppColors.grey300),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: radius8,
            borderSide: BorderSide(width: 1.5, color: AppColors.grey300),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: radius8,
            borderSide: BorderSide(width: 1.5, color: AppColors.grey300),
          ),
          hintText: hintText ?? 'Search',
          prefixIcon: const Icon(Icons.search, size: Dimen.icon * 1.25),
          prefixIconColor: AppColors.grey,
        ),
        controller: controller,
      ),
    );
  }
}
