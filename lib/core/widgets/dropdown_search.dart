import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticket_raising_management/core/styles/dimenstions.style.dart';
import 'package:ticket_raising_management/core/widgets/card.dart';

class SearchDropdown<Type> extends ConsumerWidget {
  final Function(Type?) onChanged;
  final List<Type> items;
  const SearchDropdown({
    super.key,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return KCard(
      child: DropdownSearch<Type>(
        popupProps: const PopupProps.menu(
          showSearchBox: true,
        ),
        items: items,
        dropdownDecoratorProps: const DropDownDecoratorProps(
          dropdownSearchDecoration: InputDecoration(
            contentPadding: Dimen.scaffoldMargin,
            enabled: true,
            enabledBorder: InputBorder.none,
            border: InputBorder.none,
            // labelText: "Menu mode",
            // hintText: "country in menu mode",
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
