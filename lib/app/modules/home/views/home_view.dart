import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazyui/lazyui.dart' hide SelectPicker;
import '../../widget/custom_widget.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());

    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        physics: BounceScroll(),
        child: Container(
          margin: Ei.only(t: Get.height * 0.05, l: 10, r: 10),
          width: Get.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blueAccent),
          child: Stack(
            clipBehavior: Clip.hardEdge,
            children: [
              Poslign(
                alignment: Alignment.topRight,
                child: CustomPaint(
                  painter: CirclePainter(color: Colors.white.withOpacity(0.1)),
                  size: Size(20, 50),
                ),
              ),
              Poslign(
                alignment: Alignment.bottomLeft,
                child: CustomPaint(
                  painter: CirclePainter(color: Colors.white.withOpacity(0.1)),
                  size: Size(20, 50),
                ),
              ),
              Poslign(
                alignment: Alignment.bottomRight,
                child: CustomPaint(
                  painter: CirclePainter(color: Colors.white.withOpacity(0.1)),
                  size: Size(20, 50),
                ),
              ),
              Poslign(
                alignment: Alignment.topLeft,
                child: CustomPaint(
                  painter: CirclePainter(color: Colors.white.withOpacity(0.1)),
                  size: Size(20, 50),
                ),
              ),
              Padding(
                padding: Ei.all(20),
                child: Column(
                  crossAxisAlignment: Caa.start,
                  children: [
                    Text(
                      'Selamat Datang di SmartPump Control',
                      style: Gfont.fs20
                          .copyWith(color: Colors.white, fontSize: 30),
                    ),
                    SizedBox(
                      height: Get.height * 0.01,
                    ),
                    Text(
                      '"SmartPump Control" adalah aplikasi pintar yang memberikan Anda kendali penuh atas pompa air Anda dari mana saja. Dengan antarmuka yang ramah pengguna dan desain yang intuitif, aplikasi ini memungkinkan Anda menghidupkan atau mematikan pompa air hanya dengan satu sentuhan jari.,',
                      style: Gfont.fs16.copyWith(color: Colors.white),
                    ),
                    SizedBox(
                      height: Get.height * 0.02,
                    ),
                    Divider(
                      color: Colors.white,
                      thickness: 1,
                    ),
                    SizedBox(
                      height: Get.height * 0.02,
                    ),
                    Wrap(
                      spacing: 10,
                      children: List.generate(2, (i) {
                        List<IconData> icon = [
                          Ti.power,
                          Ti.power,
                        ];

                        List<String> title = [
                          'Pompa Air 1',
                          'Pompa Air 2',
                        ];

                        return InkTouch(
                          onTap: () {
                            if (i == 0) {
                              SelectPicker.show(context,
                                  options: controller.durasiPompaHidup,
                                  fullScreen: false,
                                  textConfirm: 'Pilih', onSelect: (selector) {
                                final _ctrl = Get.find<HomeController>();
                                // logg(selector.value, name: 'Selected');

                                _ctrl.selectedValue = selector.value;
                                _ctrl.selectedValueRx.value = selector.value;
                                controller.updatePump1Status();
                                controller.form.reset();
                              });
                            } else {
                              SelectPicker.show(context,
                                  options: controller.durasiPompaHidup,
                                  fullScreen: false,
                                  textConfirm: 'Pilih', onSelect: (selector) {
                                final _ctrl = Get.find<HomeController>();
                                // logg(selector.value, name: 'Selected');

                                _ctrl.selectedValue2 = selector.value;
                                _ctrl.selectedValueRx2.value = selector.value;
                                controller.updatePump2Status();
                                controller.form2.reset();
                              });
                            }
                          },
                          child: Container(
                            width: Get.width * 0.28,
                            padding: Ei.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              mainAxisAlignment: Maa.center,
                              crossAxisAlignment: Caa.center,
                              children: [
                                Icon(
                                  icon[i],
                                  size: Get.width * 0.12,
                                  color: Colors.blue.withOpacity(0.5),
                                ),
                                Text(
                                  title[i],
                                  textAlign: Ta.center,
                                  style:
                                      Gfont.fs16.copyWith(letterSpacing: 1.5),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                    SizedBox(
                      height: Get.height * 0.02,
                    ),
                    Obx(() {
                      controller.selectedValueRx.value;
                      String powerModePump1 =
                          controller.isPump1On.value ? 'ON' : 'OFF';
                      String powerModePump2 =
                          controller.isPump2On.value ? 'ON' : 'OFF';

                      bool isHidden = controller.selectedValueRx < 0 ||
                          controller.selectedValue == 0 ||
                          controller.selectedValueRx == 1;
                      bool isHidden2 = controller.selectedValueRx2 < 0 ||
                          controller.selectedValue2 == 0 ||
                          controller.selectedValueRx2 == 1;

                      logg(controller.selectedValueRx.value,
                          name: 'Selected Value');

                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: Caa.start,
                        children: [
                          ...List.generate(2, (i) {
                            List<String> title = [
                              'Pompa Air 1  $powerModePump1',
                              'Pompa Air 2  $powerModePump2',
                            ];

                            return Text(
                              title[i],
                              style: Gfont.fs16.copyWith(
                                color: Colors.white,
                              ),
                            );
                          }),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          isHidden
                              ? None()
                              : SecondCountDown('Pompa Air 1',
                                  controller.selectedValueRx.value),
                          isHidden2
                              ? None()
                              : SecondCountDown('Pompa Air 2',
                                  controller.selectedValueRx2.value),
                        ],
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}

class CirclePainter extends CustomPainter {
  final Color color;
  final double radius;

  CirclePainter({this.color = Colors.blue, this.radius = 100.0});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
