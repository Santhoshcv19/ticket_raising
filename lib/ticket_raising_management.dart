import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_raising_management/core/common/data/model/master.model.dart';
import 'package:ticket_raising_management/core/common/data/model/user.model.dart';
import 'package:ticket_raising_management/core/common/domain/entity/master.entity.dart';
import 'package:ticket_raising_management/core/common/domain/entity/user.entity.dart';
import 'package:ticket_raising_management/core/constants/app.constants.dart';
import 'package:ticket_raising_management/core/controller/app_data.controller.dart';
import 'package:ticket_raising_management/core/controller/master.controller.dart';
import 'package:ticket_raising_management/core/l10n/l10n.dart';
import 'package:ticket_raising_management/core/providers/providers.dart';
import 'package:ticket_raising_management/core/routes/route_name.dart';
import 'package:ticket_raising_management/core/routes/routes.dart';
import 'package:ticket_raising_management/core/styles/theme.style.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ticket_raising_management/core/utils/url.dart';
import 'package:ticket_raising_management/services/provider.dart';

class TicketManagement extends ConsumerStatefulWidget {
  final String userId;
  final String organizationId;
  final String channel;

  const TicketManagement({
    super.key,
    required this.userId,
    required this.organizationId,
    required this.channel,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TicketManagementState();
}

class _TicketManagementState extends ConsumerState<TicketManagement> {
  @override
  void initState() {
    _fetchMasters();
    super.initState();
  }

  void _fetchMasters() {
    final stream = ref.read(firebaseService).fetchMasters();

    final priority = stream['priority'];
    final ticketStatus = stream['ticketStatus'];
    final category = stream['category'];
    final type = stream['type'];
    // final channel = stream['channel'];
    // final complaintCategory = stream['complaint'];
    final masters = stream['masters'];

    masterController.setMasterStatus = const [
      MasterEntity(masterId: 1, value: 'Active'),
      MasterEntity(masterId: 2, value: 'Inactive'),
    ];

    // complaintCategory?.listen((event) {
    //   final docs = event.docs;
    //   final list = docs.map((e) => MasterModel.fromJson(e)).toList();
    //   masterController.setCompCategory = list;
    // });

    priority?.listen((event) {
      final docs = event.docs;
      final list = docs.map((e) => MasterModel.fromJson(e)).toList();
      masterController.setPriority = list;
    });

    ticketStatus?.listen((event) {
      final docs = event.docs;
      final list = docs.map((e) => MasterModel.fromJson(e)).toList();
      masterController.setTicketStatus = list;
    });

    category?.listen((event) {
      final docs = event.docs;
      final list = docs.map((e) => MasterModel.fromJson(e)).toList();
      masterController.setCategory = list;
    });

    type?.listen((event) {
      final docs = event.docs;
      final list = docs.map((e) => MasterModel.fromJson(e)).toList();
      masterController.setType = list;
    });

    // channel?.listen((event) {
    //   final docs = event.docs;
    //   final list = docs.map((e) => MasterModel.fromJson(e)).toList();
    //   masterController.setChannel = list;
    // });

    masters?.listen((event) {
      final docs = event.docs;
      final list = docs.map((e) => MasterModel.fromJson(e)).toList();
      masterController.setMasters = list;
    });
  }

  Future<int> _intiate() async {
    await Future.delayed(const Duration(milliseconds: 1600));

    final api = ref.read(apiService);
    final documents = await api.get(Url.getUsers);
    final List list = documents['result'] as List;
    final data = list.map((e) => UserModel.fromJson(e)).toList();

    final user = data.firstWhereOrNull((e) => '${e.iD}' == widget.userId);

    appController.setUser = user;
    appController.setChannel = widget.channel;
    appController.setOrganizationId = widget.organizationId;

    ref.read(userProvider.notifier).setUser = data;

    List<UserEntity> sourceClients = [];
    List<MasterEntity> clients = [];
    List<int> clientsAdded = [];

    for (var user in data) {
      if (user.organizationId == null) continue;
      if (user.organizationId == 1) continue;
      if (clientsAdded.contains(user.organizationId)) continue;
      sourceClients.add(user);
      final int? masterId = user.organizationId;
      final String? value = user.organizationName;
      final model = MasterModel(masterId: masterId, value: value);
      clients.add(model);
      clientsAdded.add(user.organizationId ?? 0);
    }

    ref.read(clientProvider.notifier).setClients = sourceClients;
    masterController.setClient = clients;

    return 0;
  }

  @override
  Widget build(BuildContext context) {
    String page = RouteName.failed;

    return FutureBuilder<int>(
      future: _intiate(),
      builder: (context, snapshot) {
        if (!snapshot.hasData && !snapshot.hasError) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) page = RouteName.failed;
        if (snapshot.hasData) page = RouteName.hms;

        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppConstants.app,
          themeMode: ThemeMode.light,
          darkTheme: AppThemeData.dark,
          theme: AppThemeData.light,
          initialRoute: page,
          getPages: Routes.getRoutes,
          unknownRoute: Routes.route,
          supportedLocales: L10n.all,
          locale: appController.locale,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
        );
      },
    );
  }
}
