import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:lazyui/lazyui.dart';

class HomeController extends GetxController {
  final DatabaseReference _collection = FirebaseDatabase.instance.ref();
  FirebaseAuth auth = FirebaseAuth.instance;

  String mode = "arduino";
  RxBool isPump1On = false.obs;
  RxBool isPump2On = false.obs;
  RxBool isArduinoOn = false.obs;

  Future getDataIot() async {
    try {
      _collection.child('power_pump_1').onValue.listen((event) {
        isPump1On.value = event.snapshot.value == 1 ? true : false;
      }).onError((error, stackTrace) {
        Errors.check(error, stackTrace);
      });

      _collection.child('power_pump_2').onValue.listen((event) {
        isPump2On.value = event.snapshot.value == 1 ? true : false;
      }).onError((error, stackTrace) {
        Errors.check(error, stackTrace);
      });
    } catch (e, s) {
      Errors.check(e, s);
    }
  }

  List<Option> durasiPompaHidup = [
    Option(option: 'Hidupkan', value: 1),
    Option(option: 'Hidupkan Selama 1 Menit', value: 60),
    Option(option: 'Hidupkan Selama 15 Menit', value: 900),
    Option(option: 'Matikan', value: 0),
  ];

  Map<String, FormModel> form = LzForm.make(['operation']);
  Map<String, FormModel> form2 = LzForm.make(['operation']);

  int selectedValue = 0;
  int selectedValue2 = 0;
  RxInt selectedValueRx = 0.obs;
  RxInt selectedValueRx2 = 0.obs;
  bool hasSetTimer = false;
  Timer? _timer;

  Future updatePump1Status() async {
    try {
      switch (selectedValue) {
        // Update Value to Firebase
        case 1:
          if (_timer != null) _timer!.cancel();

          selectedValueRx.value = 1;
          selectedValue = 0;
          LzToast.show('Pompa Air 1 Dihidupkan');
          await _collection.child('power_pump_1').set(1);

          break;
        case 0:
          if (_timer != null) _timer!.cancel();

          selectedValue = 0;
          selectedValueRx.value = 0;

          LzToast.show('Pompa Air 1 Dimatikan');
          await _collection.child('power_pump_1').set(0);
          break;
        case 60:
          // Prefenting Multiple Timer
          if (_timer != null) _timer!.cancel();

          LzToast.show('Pompa Air 1 Dihidupkan Selama 1 Menit');
          await _collection.child('power_pump_1').set(1);

          _timer = Timer.periodic(Duration(seconds: 1), (timer) {
            selectedValue--;
            selectedValueRx.value--;
            logg(selectedValue, color: LogColor.red, name: 'Timer');
            if (selectedValue == 0 ||
                selectedValueRx.value == 0 ||
                selectedValue < 0 ||
                selectedValueRx.value < 0) {
              _timer!.cancel();

              _collection.child('power_pump_1').set(0);
              logg('Pompa Air 1 Dimatikan');
              LzToast.show('Pompa Air 1 Dimatikan');
            }
          });

          break;
        case 900:
          // Prefenting Multiple Timer
          if (_timer != null) _timer!.cancel();

          LzToast.show('Pompa Air 1 Dihidupkan Selama 15 Menit');
          await _collection.child('power_pump_1').set(1);

          _timer = Timer.periodic(Duration(seconds: 1), (timer) {
            selectedValue--;
            selectedValueRx.value--;
            logg(selectedValue, color: LogColor.red, name: 'Timer');
            if (selectedValue == 0 ||
                selectedValueRx.value == 0 ||
                selectedValue < 0 ||
                selectedValueRx.value < 0) {
              _timer!.cancel();

              _collection.child('power_pump_1').set(0);
              logg('Pompa Air 1 Dimatikan');
              LzToast.show('Pompa Air 1 Dimatikan');
            }
          });

          break;
        default:
      }
    } catch (e, s) {
      Errors.check(e, s);
    }
  }

  Future updatePump2Status() async {
    try {
      switch (selectedValue2) {
        // Update Value to Firebase
        case 1:
          if (_timer != null) _timer!.cancel();

          if (isPump2On == true) {
            LzToast.show('Pompa Air 2 Dihidupkan dan Mematikan fitur Timer');
            return;
          } else {
            selectedValueRx2.value = 1;
            selectedValue2 = 0;
            LzToast.show('Pompa Air 2 Dihidupkan');
            await _collection.child('power_pump_2').set(1);
          }

          break;
        case 0:
          if (_timer != null) _timer!.cancel();

          selectedValue2 = 0;
          selectedValueRx2.value = 0;

          LzToast.show('Pompa Air 2 Dimatikan');
          await _collection.child('power_pump_2').set(0);
          break;
        case 60:
          // Prefenting Multiple Timer
          if (_timer != null) _timer!.cancel();

          LzToast.show('Pompa Air 2 Dihidupkan Selama 1 Menit');
          await _collection.child('power_pump_2').set(1);

          _timer = Timer.periodic(Duration(seconds: 1), (timer) {
            selectedValue2--;
            selectedValueRx2.value--;
            if (selectedValue2 == 0 ||
                selectedValueRx2.value == 0 ||
                selectedValue2 < 0 ||
                selectedValueRx2.value < 0) {
              _timer!.cancel();

              _collection.child('power_pump_2').set(0);
              logg('Pompa Air 2 Dimatikan');
              LzToast.show('Pompa Air 2 Dimatikan');
            }
          });

          break;
        case 900:
          // Prefenting Multiple Timer
          if (_timer != null) _timer!.cancel();

          LzToast.show('Pompa Air 1 Dihidupkan Selama 15 Menit');
          await _collection.child('power_pump_1').set(1);

          _timer = Timer.periodic(Duration(seconds: 1), (timer) {
            selectedValue--;
            selectedValueRx.value--;
            logg(selectedValue, color: LogColor.red, name: 'Timer');
            if (selectedValue == 0 ||
                selectedValueRx.value == 0 ||
                selectedValue < 0 ||
                selectedValueRx.value < 0) {
              _timer!.cancel();

              _collection.child('power_pump_1').set(0);
              logg('Pompa Air 1 Dimatikan');
              LzToast.show('Pompa Air 1 Dimatikan');
            }
          });

          break;
        default:
      }
    } catch (e, s) {
      Errors.check(e, s);
    }
  }

  double secondsToMinutes(int seconds) {
    return seconds / 60;
  }

  Future logOut() async {
    try {
      await auth.signOut();
      Get.offAllNamed('/login');
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
