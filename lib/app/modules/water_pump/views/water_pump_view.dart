import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iot_app/app/modules/widget/custom_widget.dart';
import 'package:lazyui/lazyui.dart';

import '../controllers/water_pump_controller.dart';

class WaterPumpView extends GetView<WaterPumpController> {
  const WaterPumpView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(WaterPumpController());
    return WiDialogForm(
      padding: 20,
      cancelLabel: 'Batal',
      children: [
        SizedBox(height: 20),
        LzFormGroup(
          keepLabel: false,
          children: [
            LzForm.select(
              label: 'Pilih Operasi Pompa',
              options: controller.durasiPompaHidup,
              hint: 'Pilih Operasi Hidup Pompa',
            ),
          ],
        ),
      ],
    );
  }
}
