import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lazyui/lazyui.dart';

import '../controllers/wifi_controller.dart';

class WifiView extends GetView<WifiController> {
  const WifiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(WifiController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Wifi'),
          centerTitle: true,
        ),
        body: LzListView(
          padding: Ei.all(20),
          children: [
            LzFormGroup(
              sublabel:
                  'Atur Pengaturan Wifi Arduino Untuk Mengkoneksikanya ke internet, Form Dibawah Tidak Boleh Kosong',
              sublabelStyle: SublabelStyle.cardWarning,
              keepLabel: true,
              labelStyle: TextStyle(fontSize: 20),
              children: [
                LzForm.input(
                  label: 'SSID',
                  labelStyle: LzFormLabelStyle(fontSize: 14),
                  model: controller.forms['ssid'],
                ),
                LzForm.input(
                  label: 'Password',
                  labelStyle: LzFormLabelStyle(fontSize: 14),
                  model: controller.forms['password'],
                ),
              ],
            ),
          ],
        ),
        bottomNavigationBar: LzButton(
          text: 'Update Data'.toUpperCase(),
          onTap: (val) {
            controller.updateWifiData();
          },
        ).dark().theme1());
  }
}
