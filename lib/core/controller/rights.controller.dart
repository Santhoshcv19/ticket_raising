import 'package:get/get.dart';
import 'package:ticket_raising_management/core/common/domain/entity/ticket.entity.dart';
import 'package:ticket_raising_management/core/controller/app_data.controller.dart';

final RightsController rightsController = Get.put(RightsController());

class RightsController extends GetxController {
  bool hasTicketRights(TicketEntity? data) {
    final user = appController.user;
    if ([1, 2].contains(user?.roleCount)) return true;
    if (data?.technicalAssingned == user?.iD) return true;
    return false;
  }

  bool get hasUserRights {
    final user = appController.user;
    if ([1].contains(user?.iD)) return true;
    return false;
  }
}
