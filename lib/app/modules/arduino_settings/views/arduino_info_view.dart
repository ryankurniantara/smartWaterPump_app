import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iot_app/app/modules/arduino_settings/controllers/arduino_info_controller.dart';
import 'package:lazyui/lazyui.dart';

class ArduinoInfoView extends GetView<ArduinoInfoController> {
  const ArduinoInfoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(ArduinoInfoController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Arduino'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: Ei.all(10),
          child: Container(
            padding: Ei.all(20),
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(10)),
            child: Obx(() {
              controller.isArduinoOn.value;
              return Column(
                crossAxisAlignment: Caa.start,
                mainAxisSize: Mas.min,
                children: [
                  Text(
                    'Arduino',
                    style: Gfont.fs18.copyWith(fontSize: 30),
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  Divider(
                    color: Colors.black.withOpacity(0.2),
                    thickness: 1,
                  ),
                  LzFormGroup(
                    label: 'Power',
                    sublabelStyle: SublabelStyle.card,
                    labelStyle: Gfont.fs20,
                    children: [
                      LzForm.switches(
                        label: 'On|Off',
                        model: controller.forms['arduino_power_status'],
                        onChange: (p0) {
                          controller.updateArduinoStatus();
                        },
                      ),
                    ],
                  )
                ],
              );
            }),
          ),
        ));
  }
}
