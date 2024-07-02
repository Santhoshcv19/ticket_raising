import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_raising_management/core/common/domain/entity/user.entity.dart';

final TRMAppDataController appController = Get.put(TRMAppDataController());

class TRMAppDataController extends GetxController {
  UserEntity? _user;
  Locale _locale = const Locale('en');

  String? _channel;
  String? _organizationId;

  set setUser(UserEntity? user) => _user = user;
  set setLocale(Locale locale) => _locale = locale;

  set setChannel(String? channel) => _channel = channel;
  set setOrganizationId(String? id) => _organizationId = id;

  UserEntity? get user => _user;
  Locale get locale => _locale;

  String? get channel => _channel;
  String? get organizationId => _organizationId;
}
