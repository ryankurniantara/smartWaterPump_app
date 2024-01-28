import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:lazyui/lazyui.dart';

class WifiController extends GetxController {
  final CollectionReference _collection =
      FirebaseFirestore.instance.collection('app');

  String mode = "arduino";
  final forms = LzForm.make(['password', 'ssid']);

  Future getDataIot() async {
    try {
      _collection.doc(mode).snapshots().listen((event) {
        logg("get data");
        Map<String, dynamic> configs = event.data() as Map<String, dynamic>;
        Map<String, dynamic> settings = configs['settings'];
        Map<String, dynamic> wifi = settings['wifi'];

        forms['ssid']!.controller.text = wifi['ssid'];
        forms['password']!.controller.text = wifi['password'];
      });
    } catch (e, s) {
      Errors.check(e, s);
    }
  }

  Future updateWifiData() async {
    try {
      final map = forms.toMap();

      LzForm input = LzForm.validate(forms,
          required: ['*'],
          singleNotifier: false,
          notifierType: LzFormNotifier.text,
          messages: FormMessages(
            required: {
              'ssid': 'Ssid tidak boleh kosong.',
              'password': 'Password Tidak Boleh Kosong',
            },
          ),
          toastPosition: Position.center);

      if (input.ok) {
        LzToast.show('Sedang Mengedit Data');
        await _collection.doc(mode).update({
          "settings.wifi": map,
        }).then((value) {
          LzToast.success('Berhasil Mengedit Data', position: Position.center);
        });
        LzToast.dismiss();
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
