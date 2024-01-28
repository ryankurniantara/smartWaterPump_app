import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iot_app/app/modules/arduino_settings/views/arduino_info_view.dart';
import 'package:iot_app/app/modules/widget/custom_widget.dart';
import 'package:lazyui/lazyui.dart';

import '../controllers/arduino_settings_controller.dart';

class ArduinoSettingsView extends GetView<ArduinoSettingsController> {
  const ArduinoSettingsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Arduino Settings'),
          centerTitle: true,
        ),
        body: LzListView(
          children: [
            ...List.generate(2, (i) {
              List<IconData> icon = [
                Ti.infoCircle,
                Ti.wifi,
              ];
              List<String> title = [
                'Arduino Info',
                'Wifi Settings',
              ];

              return WiListTile.list(icon[i], title[i], () {
                if (i == 0) {
                  Get.to(() => ArduinoInfoView());
                }
              });
            })
          ],
        ));
  }
}
