import 'package:get/get.dart';
import '../modules/arduino_settings/bindings/arduino_settings_binding.dart';
import '../modules/arduino_settings/views/arduino_settings_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ARDUINO_SETTINGS,
      page: () => const ArduinoSettingsView(),
      binding: ArduinoSettingsBinding(),
    ),
  ];
}
