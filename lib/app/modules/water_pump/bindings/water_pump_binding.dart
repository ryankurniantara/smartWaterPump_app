import 'package:get/get.dart';

import '../controllers/water_pump_controller.dart';

class WaterPumpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WaterPumpController>(
      () => WaterPumpController(),
    );
  }
}
