import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticket_raising_management/core/l10n/l10n.dart';

class Localization extends StateNotifier<Locale> {
  Localization() : super(const Locale('en'));

  void setLocale(Locale locale) {
    if (!L10n.all.contains(locale)) return;
    state = locale;
  }
}
