import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:lazyui/lazyui.dart';

class HomeController extends GetxController {
  final DatabaseReference _collection = FirebaseDatabase.instance.ref();

  String mode = "arduino";
  RxBool isPumpOn = false.obs;
  RxBool isArduinoOn = false.obs;

  Future getDataIot() async {
    try {
      _collection.child('power_pump_status').onValue.listen((event) {
        logg("get data");
        logg(event.snapshot.value);
        isPumpOn.value = event.snapshot.value == 1 ? true : false;
      });
    } catch (e, s) {
      logg(e);
      Errors.check(e, s);
    }
  }

  List<Option> durasiPompaHidup = [
    Option(option: 'Hidupkan Pompa', value: 1),
    Option(option: 'Matikan Pompa', value: 0),
    Option(option: '1 Menit', value: 60),
    Option(option: '5 Menit', value: 300),
    Option(option: '10 Menit', value: 600),
    Option(option: '15 Menit', value: 900),
    Option(option: '30 Menit', value: 1800),
    Option(option: '1 Jam', value: 3600),
  ];
  Map<String, FormModel> form = LzForm.make(['operation']);

  int selectedValue = 0;
  RxInt selectedValueRx = 0.obs;
  Timer? _timer;

  Future updatePumpStatus() async {
    try {
      logg(selectedValue, color: LogColor.green);

      switch (selectedValue) {
        // Update Value to Firebase
        case 1:
          if (_timer != null) _timer!.cancel();
          _timer == null;

          selectedValueRx.value = 1;
          selectedValue = 0;
          LzToast.show('Pompa Air Dihidupkan');
          await _collection.child('power_pump_status').set(1);
          break;
        case 0:
          if (_timer != null) _timer!.cancel();
          _timer == null;

          selectedValue = 0;
          selectedValueRx.value = 0;

          LzToast.show('Pompa Air Dimatikan');
          await _collection.child('power_pump_status').set(0);
          break;
        case 60 || 300 || 600 || 900 || 1800 || 3600:
          await _collection.child('power_pump_status').set(1);
          _timer = Timer.periodic(Duration(seconds: 1), (timer) {
            selectedValue--;
            selectedValueRx.value--;
            logg(selectedValue, color: LogColor.red, name: 'Timer');
            if (selectedValue == 0 ||
                selectedValueRx.value == 0 ||
                selectedValue <= 0 ||
                selectedValueRx.value <= 0) {
              _timer!.cancel();
              _collection.child('power_pump_status').set(0);
              logg('Pompa Dimatikan');
              LzToast.show('Pompa Dimatikan');
            }
          });

          break;
        default:
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
