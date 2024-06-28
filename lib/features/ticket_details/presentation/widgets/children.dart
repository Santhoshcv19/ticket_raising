import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:ticket_raising_management/core/common/data/model/ticket_model.dart';
import 'package:ticket_raising_management/core/common/domain/entity/ticket.entity.dart';
import 'package:ticket_raising_management/core/styles/colors.style.dart';
import 'package:ticket_raising_management/core/styles/dimenstions.style.dart';
import 'package:ticket_raising_management/core/utils/texts/sub_body.text.dart';
import 'package:ticket_raising_management/core/widgets/card.dart';
import 'package:ticket_raising_management/features/ticket_details/domain/usecase/params.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/logic/others/logic.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/logic/provider.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/widgets/actions/parent_child/parent_child_widget.dart';

class ChildrenView extends ConsumerStatefulWidget {
  final List<ChildEntity> data;
  final Function(ChildEntity)? onRemove;

  const ChildrenView({
    super.key,
    required this.data,
    this.onRemove,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChildrenViewState();
}

class _ChildrenViewState extends ConsumerState<ChildrenView> {
  void _onDelete(String? id) {
    final provider = ref.read(ticketActionNotifier.notifier);
    final logic = ref.read(ticketDetailsLogic);
    final String? refId = logic.data?.ref?.id;
    final params = TicketDetailsParams(id: id, ticketId: refId);
    provider.deleteChildren(params);
    navigator?.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return KCard(
      margin: Dimen.verticalMargin * 5,
      padding: Dimen.scaffoldMargin,
      child: ListView(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppSubBodyText(data: 'Children', color: AppColors.grey),
              CloseButton(),
            ],
          ),
          const SizedBox(height: Dimen.space * 2),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (_, i) => StreamBuilder(
              stream: widget.data[i].ticketRef?.snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return const CircularProgressIndicator();
                final model = TicketModel.fromJson(snapshot.data);
                return ParentChildWidget(
                  data: model,
                  showOptions: true,
                  onRemove: (data) => _onDelete(widget.data[i].ref?.id),
                );
              },
            ),
            separatorBuilder: (_, i) => const SizedBox(height: Dimen.space),
            itemCount: widget.data.length,
          ),
        ],
      ),
    );
  }
}
