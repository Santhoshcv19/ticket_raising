import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:ticket_raising_management/core/common/domain/entity/master.entity.dart';
import 'package:ticket_raising_management/core/widgets/dropdown_search.dart';

class CreateTicketDropdown extends ConsumerWidget {
  final List<MasterEntity> items;
  final int? value;
  final Function(int?) onChanged;
  final int? flex;

  const CreateTicketDropdown({
    super.key,
    required this.items,
    required this.value,
    required this.onChanged,
    this.flex,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(children: [
      Expanded(
        flex: flex ?? 1,
        child: SearchDropdown<String>(
          items: items.map((e) => e.value ?? '').toList(),
          onChanged: (value) {
            final data = items.firstWhereOrNull((e) => e.value == value);
            onChanged(data?.masterId);
          },
        ),
      ),
      const Spacer(),
    ]);
  }
}
