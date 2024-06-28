import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticket_raising_management/core/styles/colors.style.dart';
import 'package:ticket_raising_management/core/styles/dimenstions.style.dart';
import 'package:ticket_raising_management/core/utils/texts/sub_body.text.dart';
import 'package:ticket_raising_management/core/widgets/search.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/logic/others/logic.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/widgets/actions/parent_child/parent_child_widget.dart';

class ParentWidget extends ConsumerWidget {
  const ParentWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(ticketDetailsLogic);
    final logic = ref.watch(ticketDetailsLogic);

    return ListView(children: [
      const Center(
        child: AppSubBodyText(data: 'Parent', color: AppColors.grey),
      ),
      const SizedBox(height: Dimen.space * 2),
      AppSearchBar(
        controller: logic.parentController,
        hintText: 'SEARCH TICKET NAME / ID',
        suggestionsBuilder: (context, controller) {
          final List source = [];

          source.addAll(provider.source);

          source.remove(provider.parent);

          List<Widget> list = [];
          final String text = controller.text;

          if (text.isEmpty) {
            for (var data in source) {
              final child = ParentChildWidget(
                data: data,
                onAdd: provider.linkParent,
                inList: false,
              );
              list.add(Padding(padding: Dimen.textMargin, child: child));
            }
            return list;
          }

          final query = text.toLowerCase();

          for (var data in source) {
            final String title = data.title?.toLowerCase() ?? '';
            if (!title.startsWith(query)) continue;
            final child = ParentChildWidget(
              data: data,
              onAdd: provider.linkParent,
              inList: false,
            );
            list.add(Padding(padding: Dimen.textMargin, child: child));
          }

          for (var data in source) {
            final String id = data.ticketId?.toLowerCase() ?? '';
            if (!id.startsWith(query)) continue;
            final child = ParentChildWidget(
              data: data,
              onAdd: provider.linkParent,
              inList: false,
            );
            list.add(Padding(padding: Dimen.textMargin, child: child));
          }

          return list;
        },
      ),
      const SizedBox(height: Dimen.space * 2),
      ParentChildWidget(
        data: logic.parent,
        onRemove: (data) => provider.linkParent(null),
      ),
    ]);
  }
}
