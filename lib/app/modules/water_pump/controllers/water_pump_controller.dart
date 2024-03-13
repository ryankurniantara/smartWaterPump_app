import 'package:get/get.dart';
import 'package:lazyui/lazyui.dart';

import '../../home/controllers/home_controller.dart';

class WaterPumpController extends GetxController {
  List<Option> durasiPompaHidup = [
    Option(option: 'Hidupkan Pompa', value: 1),
    Option(option: 'Matikan Pompa', value: 0),
    Option(option: '5 Menit', value: 5),
    Option(option: '10 Menit', value: 10),
    Option(option: '15 Menit', value: 15),
    Option(option: '30 Menit', value: 30),
    Option(option: '1 Jam', value: 60),
  ];

  Future updatePumpStatus({
    Option? selected,
  }) async {
    try {
      switch (selected!.value) {
        case 1:
          break;
        default:
      }
    } catch (e, s) {
      Errors.check(e, s);
    }
  }

  @override
  void onInit() {
    super.onInit();
  }
}
