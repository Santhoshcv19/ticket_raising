import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticket_raising_management/features/ticket_details/domain/usecase/fetch_details.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/logic/others/logic.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/logic/ticket_details/state.dart';
import 'package:ticket_raising_management/core/common/data/model/ticket_model.dart';

class TicketDetailsNotifier extends StateNotifier<TicketDetailsState> {
  final FetchDetails _fetchDetailsData;
  final TicketDetailsLogic _logic;

  TicketDetailsNotifier({
    required FetchDetails fetchDetailsData,
    required TicketDetailsLogic logic,
    TicketDetailsState? initial,
  })  : _fetchDetailsData = fetchDetailsData,
        _logic = logic,
        super(initial ?? const TicketDetailsState.initial());

  Future<void> getTicketDetails(String id) async {
    state = const TicketDetailsState.loading();
    var data = await _fetchDetailsData.call(id);
    data.fold((l) => state = const TicketDetailsState.error(), (r) {
      r.listen((item) {
        final model = TicketModel.fromJson(item);
        _logic.onData(model);
        state = TicketDetailsState.data(data: model);
      }, onError: (e) => state = const TicketDetailsState.error());
    });
  }
}
