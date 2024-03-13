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

  @override
  void onInit() {
    getDataIot();
    super.onInit();
  }
}
