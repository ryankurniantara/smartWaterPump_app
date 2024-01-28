import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:lazyui/lazyui.dart';

class HomeController extends GetxController {
  final CollectionReference _collection =
      FirebaseFirestore.instance.collection('app');

  String mode = "arduino";
  RxBool isPumpOn = false.obs;
  RxBool isArduinoOn = false.obs;

  Future getDataIot() async {
    try {
      _collection.doc(mode).snapshots().listen(onDone: () {
        logg('done');
      }, onError: (e) {
        logg(e);
      }, (event) {
        logg("get data");
        Map<String, dynamic> configs = event.data() as Map<String, dynamic>;
        Map<String, dynamic> settings = configs['settings'];
        int pump_status = settings['pump_power_status'];
        int arduino_status = settings['arduino_power_status'];

        isPumpOn.value = pump_status == 1 ? true : false;
        isArduinoOn.value = arduino_status == 1 ? true : false;
      });
    } catch (e, s) {
      logg(e);
      Errors.check(e, s);
    }
  }

  Future updatePowerPumpStatus() async {
    try {
      if (isArduinoOn.value) {
        if (isPumpOn.value) {
          LzToast.show('Mematikan Pompa Air');
          await _collection
              .doc(mode)
              .update({"settings.pump_power_status": 0}).then((value) {
            LzToast.success('Pompa Air Dimatikan');
          });
          LzToast.dismiss();
        } else {
          LzToast.show('Menghidupkan Pompa');
          await _collection
              .doc(mode)
              .update({"settings.pump_power_status": 1}).then((value) {
            LzToast.success('Pompa Air Dihidupkan');
          });
          LzToast.dismiss();
        }
      } else {
        LzToast.show(
            'Pastikan Arduino Dalam Keadaan Hidup, Untuk Mengoperasikan Pompa');
      }
    } catch (e, s) {
      logg(e);
      Errors.check(e, s);
    }
  }

  @override
  void onInit() {
    getDataIot();
    super.onInit();
  }
}
