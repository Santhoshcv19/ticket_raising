import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticket_raising_management/ticket_raising_management.dart';

Future<void> main() async {
  runApp(
    const ProviderScope(
      child: TicketManagement(userId: '249', organizationId: '5', channel: '3'),
    ),
  );
}
