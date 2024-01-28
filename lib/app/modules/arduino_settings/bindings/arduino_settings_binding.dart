import 'package:get/get.dart';

import 'package:iot_app/app/modules/arduino_settings/controllers/arduino_info_controller.dart';
import 'package:iot_app/app/modules/arduino_settings/controllers/wifi_controller.dart';

import '../controllers/arduino_settings_controller.dart';

class ArduinoSettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WifiController>(
      () => WifiController(),
    );
    Get.lazyPut<ArduinoInfoController>(
      () => ArduinoInfoController(),
    );
    Get.lazyPut<ArduinoSettingsController>(
      () => ArduinoSettingsController(),
    );
  }
}
