import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticket_raising_management/core/common/domain/entity/ticket.entity.dart';
import 'package:ticket_raising_management/core/styles/colors.style.dart';
import 'package:ticket_raising_management/core/styles/dimenstions.style.dart';
import 'package:ticket_raising_management/core/utils/texts/sub_body.text.dart';
import 'package:ticket_raising_management/core/widgets/search.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/logic/others/logic.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/logic/provider.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/widgets/actions/parent_child/parent_child_widget.dart';

class ChildWidget extends ConsumerWidget {
  const ChildWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(ticketDetailsLogic);
    final logic = ref.watch(ticketDetailsLogic);
    final state = ref.watch(childrenNotifier);

    final children = state.whenOrNull(data: (data) => data) ?? [];

    return ListView(children: [
      const Center(
        child: AppSubBodyText(data: 'Children', color: AppColors.grey),
      ),
      const SizedBox(height: Dimen.space * 2),
      AppSearchBar(
        controller: logic.childController,
        hintText: 'SEARCH TICKET NAME / ID',
        suggestionsBuilder: (context, controller) {
          final List<TicketEntity> source = [];

          source.addAll(provider.source);

          source.remove(provider.parent);

          for (var item in children) {
            source.removeWhere((e) => e.ref?.id == item.ticketRef?.id);
          }

          for (var data in provider.child) {
            source.remove(data);
          }

          List<Widget> list = [];
          final String text = controller.text;

          if (text.isEmpty) {
            for (var data in source) {
              final child = ParentChildWidget(
                data: data,
                onAdd: provider.linkChild,
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
              onAdd: provider.linkChild,
              inList: false,
            );
            list.add(Padding(padding: Dimen.textMargin, child: child));
          }

          for (var data in source) {
            final String id = data.ticketId?.toLowerCase() ?? '';
            if (!id.startsWith(query)) continue;
            final child = ParentChildWidget(
              data: data,
              onAdd: provider.linkChild,
              inList: false,
            );
            list.add(Padding(padding: Dimen.textMargin, child: child));
          }

          return list;
        },
      ),
      const SizedBox(height: Dimen.space * 2),
      ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (_, i) => ParentChildWidget(
          data: logic.child[i],
          onRemove: (data) => provider.removeChild(data),
        ),
        separatorBuilder: (_, i) => const SizedBox(height: Dimen.space),
        itemCount: logic.child.length,
      ),
    ]);
  }
}
