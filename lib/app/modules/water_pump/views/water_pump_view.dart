import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iot_app/app/modules/home/controllers/home_controller.dart';
import 'package:iot_app/app/modules/widget/custom_widget.dart';
import 'package:lazyui/lazyui.dart';

class WaterPumpView extends GetView<HomeController> {
  const WaterPumpView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
              model: controller.form['operation'],
              onSelect: (selector) {
                final _ctrl = Get.find<HomeController>();
                _ctrl.selectedValue = selector.option!.value;
                _ctrl.selectedValueRx.value = selector.option!.value;
              },
            ),
          ],
        ),
      ],
    );
  }
}
