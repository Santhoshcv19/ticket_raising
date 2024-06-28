import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ticket_raising_management/core/alerts/loader.dart';
import 'package:ticket_raising_management/core/styles/dimenstions.style.dart';

class Utils {
  static void toast(String? msg) {
    if (msg == null) return;
    Fluttertoast.showToast(msg: msg, timeInSecForIosWeb: 2);
  }

  static Future showAlert({
    required BuildContext context,
    Widget? child,
    bool? isDismissible,
  }) async {
    await showDialog(
      context: context,
      barrierDismissible: isDismissible ?? true,
      builder: (context) => child ?? const SizedBox(),
    );
  }

  static Future showModal({
    required Widget child,
    required BuildContext context,
    bool? isScrollControlled,
    Color? color,
  }) async {
    await showModalBottomSheet(
      context: context,
      backgroundColor: color,
      isScrollControlled: isScrollControlled ?? false,
      builder: (_) => Padding(padding: Dimen.scaffoldMargin, child: child),
    );
  }

  static void pop(BuildContext context) => Navigator.pop(context);

  static Future search(
      {required SearchDelegate child, required BuildContext context}) async {
    await showSearch(context: context, delegate: child);
  }

  static void showLoader(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Loader(),
    );
  }

  static void dismissLoader(BuildContext context) {
    Navigator.pop(context);
  }

  static int getTimeStamp() {
    var dateTime = DateTime.now();
    return dateTime.millisecondsSinceEpoch;
  }

  static DateTime? convertDateTime(int? ts) {
    if (ts == null) return null;
    return DateTime.fromMillisecondsSinceEpoch(ts);
  }

  static int getRandomInt(int limit) {
    Random random = Random();
    int randomNumber = random.nextInt(limit);
    return randomNumber;
  }

  static int getId() {
    Random rnd = Random();
    num power = pow(2, 31) - 1;
    return rnd.nextInt(power.toInt());
  }

  static String? getPath(String? path) {
    if (path == null) return null;
    if (!Platform.isAndroid) return path;

    String newPath = '';
    var oldPath = path.split('/');

    for (int i = 1; i < (oldPath.length); i++) {
      String folder = oldPath[i];
      if (folder == 'Android') break;
      newPath += '/$folder';
    }

    return newPath;
  }
}
