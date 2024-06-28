import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticket_raising_management/core/styles/border_radius.style.dart';
import 'package:ticket_raising_management/core/styles/colors.style.dart';
import 'package:ticket_raising_management/core/styles/dimenstions.style.dart';

class OutlineDropdown<Type> extends ConsumerWidget {
  final List<DropdownMenuItem<Type>> items;
  final Function(Type?) onChanged;
  final Type? value;

  const OutlineDropdown({
    super.key,
    required this.items,
    required this.onChanged,
    required this.value,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: radius16,
        border: Border.all(width: 1, color: AppColors.grey300),
      ),
      padding: Dimen.textMargin,
      height: Dimen.icon * 2,
      child: Expanded(
        child: DropdownButton<Type>(
          padding: EdgeInsets.zero,
          isExpanded: true,
          underline: const SizedBox.shrink(),
          icon: const Icon(Icons.keyboard_arrow_down),
          iconSize: Dimen.icon * .75,
          iconEnabledColor: AppColors.grey,
          value: value,
          items: items,
          style: Theme.of(context).textTheme.bodySmall,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
