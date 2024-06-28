import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:ticket_raising_management/core/common/domain/entity/user.entity.dart';

class User extends StateNotifier<List<UserEntity>> {
  User() : super([]);

  set setUser(List<UserEntity> data) => state = data;

  String getUserFromId(int? id) {
    final data = state.firstWhereOrNull((e) => e.iD == id);
    return data?.userName ?? '';
  }

  String getRolesFromId(int? id) {
    final data = state.firstWhereOrNull((e) => e.iD == id);
    return data?.roleNames ?? '';
  }
}
