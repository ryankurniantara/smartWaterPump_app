import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iot_app/app/modules/water_pump/views/water_pump_view.dart';
import 'package:iot_app/app/routes/app_pages.dart';
import 'package:lazyui/lazyui.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());

    return Scaffold(
        appBar: AppBar(
            title: Text(
          'Smart Pump Control',
          style: Gfont.fs20.copyWith(color: Colors.white),
        )),
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
                    painter:
                        CirclePainter(color: Colors.white.withOpacity(0.1)),
                    size: Size(20, 50),
                  ),
                ),
                Poslign(
                  alignment: Alignment.bottomLeft,
                  child: CustomPaint(
                    painter:
                        CirclePainter(color: Colors.white.withOpacity(0.1)),
                    size: Size(20, 50),
                  ),
                ),
                Poslign(
                  alignment: Alignment.bottomRight,
                  child: CustomPaint(
                    painter:
                        CirclePainter(color: Colors.white.withOpacity(0.1)),
                    size: Size(20, 50),
                  ),
                ),
                Poslign(
                  alignment: Alignment.topLeft,
                  child: CustomPaint(
                    painter:
                        CirclePainter(color: Colors.white.withOpacity(0.1)),
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
                        children: List.generate(1, (i) {
                          List<IconData> icon = [
                            Ti.power,
                          ];

                          List<String> title = [
                            'Hidupkan Pompa Air',
                          ];

                          return InkTouch(
                            onTap: () {
                              Get.dialog(WaterPumpView());
                            },
                            child: Container(
                              width: Get.width * 0.28,
                              height: Get.width * 0.28,
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
                        String powerModePump =
                            controller.isPumpOn.value ? 'ON' : 'OFF';

                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: Caa.start,
                          children: [
                            Text(
                              'WaterPump Power : $powerModePump',
                              style: Gfont.fs16.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        );
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
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
