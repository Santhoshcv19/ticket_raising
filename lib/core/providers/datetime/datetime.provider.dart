import 'package:flutter_riverpod/flutter_riverpod.dart';

class GetDateTime extends StateNotifier<DateTime> {
  GetDateTime() : super(DateTime.now());

  DateTime get dateTime => state;
}
