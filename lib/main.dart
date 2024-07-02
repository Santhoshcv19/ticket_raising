import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ticket_raising_management/firebase_options.dart';
import 'package:ticket_raising_management/ticket_raising_management.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.web);
  // Initialize Cache Storage
  await GetStorage.init();
  runApp(
    const ProviderScope(
      child: TicketManagement(
        userId: '249',
        organizationId: '5',
        channel: '3',
      ),
    ),
  );
}
