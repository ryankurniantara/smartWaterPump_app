import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:lazyui/lazyui.dart';

class ArduinoInfoController extends GetxController {
  final CollectionReference _collection =
      FirebaseFirestore.instance.collection('app');

  String mode = "arduino";
  RxBool isArduinoOn = false.obs;

  final forms = LzForm.make(['arduino_power_status']);

  Future getDataIot() async {
    try {
      _collection.doc(mode).snapshots().listen((event) {
        logg("get data");
        Map<String, dynamic> configs = event.data() as Map<String, dynamic>;
        Map<String, dynamic> settings = configs['settings'];
        int arduino_status = settings['arduino_power_status'];
        isArduinoOn.value = arduino_status == 1 ? true : false;

        forms['arduino_power_status']!.controller.text =
            arduino_status == 1 ? "1" : "0";

        // forms['arduino_power_status']!.controller.text = arduino_status == 1 ?  : false;
      });
    } catch (e, s) {
      Errors.check(e, s);
    }
  }

  Future updateArduinoStatus() async {
    try {
      if (isArduinoOn.value) {
        LzToast.show('Mematikan Arduino');
        await _collection
            .doc(mode)
            .update({"settings.arduino_power_status": 0}).then((value) {
          LzToast.success('Arduino Dimatikan');
          LzToast.dismiss();
        });
      } else {
        LzToast.show('Menghidupkan Arduino');
        await _collection
            .doc(mode)
            .update({"settings.arduino_power_status": 1}).then((value) {
          LzToast.success('Arduino Dihidupkan');
          LzToast.dismiss();
        });
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
