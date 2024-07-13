import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'data/storage_controller.dart';
import 'data/theme_controller.dart';
import 'http_cleint/request_handler.dart';
import 'preferences/shared_prefs.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

Future init(SharedPreferences prefs) async {
  Dio dio = Dio();

  locator.registerLazySingleton<MyPrefs>(() => MyPrefs());
  locator.registerLazySingleton<RequestHandler>(() => RequestHandler(prefs: prefs, dio: dio));
  locator.registerLazySingleton<ThemeController>(() => ThemeController(prefs: prefs));
  locator.registerLazySingleton<StorageController>(() => StorageController(prefs: prefs));

  Get.lazyPut<RequestHandler>(() => RequestHandler(dio: dio, prefs: prefs));

  Get.put(RequestHandler(prefs: prefs, dio: dio));
  Get.put(StorageController(prefs: prefs));
  Get.put(ThemeController(prefs: prefs));
  ///

  // Get.lazyPut(() => ThemeController(prefs: prefs));
  // Get.lazyPut(() => StorageController(prefs: prefs));
}
