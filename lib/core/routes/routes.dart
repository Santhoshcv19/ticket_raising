import 'package:get/get.dart';
import 'package:ticket_raising_management/core/routes/route_name.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/pages/index.dart';
import 'package:ticket_raising_management/features/tickets/presentation/pages/index.dart';

class Routes {
  static List<GetPage> get getRoutes {
    return [
      GetPage(name: RouteName.ticketDetails, page: () => const TicketDetails()),
      GetPage(name: RouteName.hms, page: () => const Hms()),
    ];
  }

  static GetPage get route {
    return GetPage(name: RouteName.hms, page: () => const Hms());
  }
}
