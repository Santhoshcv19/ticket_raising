import 'package:get/get.dart';

abstract mixin class RouteService {
  Future<void> push(String route, [Map<String, String>? data]);
  Future<void> pushReplace(String route, [Map<String, String>? data]);
  Future<void> pushAndRemove(String route, [Map<String, String>? data]);
  void back();
}

class RouteServiceImpl extends GetxController with RouteService {
  @override
  Future<void> push(String route, [Map<String, String>? data]) async {
    return await Get.toNamed(route, parameters: data);
  }

  @override
  Future<void> pushReplace(String route, [Map<String, String>? data]) async {
    return await Get.offAndToNamed(route, parameters: data);
  }

  @override
  Future<void> pushAndRemove(String route, [Map<String, String>? data]) async {
    return await Get.offNamedUntil(route, (route) => false, parameters: data);
  }

  @override
  void back() => Get.back();
}
