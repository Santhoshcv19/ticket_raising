import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticket_raising_management/core/common/domain/entity/user.entity.dart';

class Client extends StateNotifier<List<UserEntity>> {
  Client() : super([]);

  set setClients(List<UserEntity> data) => state = data;
}
