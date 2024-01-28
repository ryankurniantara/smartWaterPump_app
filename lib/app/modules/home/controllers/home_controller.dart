import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:lazyui/lazyui.dart';

class HomeController extends GetxController {
  final CollectionReference _collection =
      FirebaseFirestore.instance.collection('app');

  String mode = "arduino";
  Map<String, dynamic> wifiData = {};
  RxBool isPumpOn = false.obs;
  RxBool isArduinoOn = false.obs;

  Future getDataIot() async {
    _collection.doc(mode).snapshots().listen((event) {
      logg("get data");
      Map<String, dynamic> configs = event.data() as Map<String, dynamic>;
      Map<String, dynamic> settings = configs['settings'];
      int pump_status = settings['pump_power_status'];
      int arduino_status = settings['arduino_power_status'];

      isPumpOn.value = pump_status == 1 ? true : false;
      isArduinoOn.value = arduino_status == 1 ? true : false;
    });
  }

  Future updatePowerPumpStatus() async {
    try {
      if (isArduinoOn.value) {
        if (isPumpOn.value) {
          LzToast.overlay('Mematikan Pompa Air');
          await _collection
              .doc(mode)
              .update({"settings.pump_power_status": 0}).then((value) {
            LzToast.success('Pompa Air Dimatikan');
            LzToast.dismiss();
          });
        } else {
          LzToast.overlay('Menghidupkan Pompa');
          await _collection
              .doc(mode)
              .update({"settings.pump_power_status": 1}).then((value) {
            LzToast.success('Pompa Air Dihidupkan');
            LzToast.dismiss();
          });
        }
      } else {
        LzToast.show(
            'Pastikan Arduino Dalam Keadaan Hidup, Untuk Mengoperasikan Pompa');
      }
    } catch (e, s) {
      Errors.check(e, s);
    }
  }

  @override
  void onInit() {
    getDataIot();
    super.onInit();
  }
}
