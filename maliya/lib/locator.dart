import 'package:get_it/get_it.dart';
import 'package:maliya/global/httpclient.dart';
import 'package:maliya/global/session_manager.dart';
import 'package:maliya/views/templates/navigator_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigatorService());
  locator.registerLazySingleton(() => HttpClient());
  locator.registerLazySingleton(() => SessionManager());
}
