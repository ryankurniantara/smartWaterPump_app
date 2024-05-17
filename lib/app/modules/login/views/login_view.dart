import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lazyui/lazyui.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('LoginView'),
          centerTitle: true,
        ),
        body: Wrapper(
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Stack(
                children: [
                  Poslign(
                      margin: Ei.only(t: 10, l: 15),
                      alignment: Alignment.topLeft,
                      child: InkTouch(
                        radius: Br.circle,
                        color: Colors.black,
                        padding: Ei.all(10),
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(
                          Ti.arrowLeft,
                          size: 25,
                          color: Colors.white,
                        ),
                      )),
                  Column(
                    mainAxisSize: Mas.min,
                    children: [
                      Expanded(
                        child: Center(
                          child: SizedBox(
                            width: 330,
                            child: SingleChildScrollView(
                              physics:
                                  MediaQuery.of(context).viewInsets.bottom > 0
                                      ? BounceScroll()
                                      : NeverScrollableScrollPhysics(),
                              padding: Ei.sym(v: 25, h: 15),
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: Maa.center,
                                  children: [
                                    Column(mainAxisSize: Mas.min, children: [
                                      LzForm.input(
                                        label: 'Masuk',
                                        hint: "Masukkan ID Member Varash",
                                        maxLength: 12,
                                        keyboard: TextInputType.number,
                                      ),
                                      LzForm.input(
                                        hint: 'Masukkan Kata Sandi',
                                        maxLength: 30,
                                        obsecure: controller.isObsecure,
                                        obsecureIcons: [
                                          Ti.eye,
                                          Ti.eyeOff,
                                        ],
                                      )
                                    ]),
                                    InkTouch(
                                      onTap: () {
                                        // controller.login();
                                      },
                                      highlightColor: Utils.hex('212121'),
                                      color: Colors.white,
                                      border: Br.all(color: Colors.black),
                                      elevation: 1,
                                      radius: Br.radius(2),
                                      child: Container(
                                        padding: Ei.sym(v: 15, h: 15),
                                        width: Get.width,
                                        child: Text(
                                          'MASUK',
                                          textAlign: Ta.center,
                                          style: Gfont.bold.copyWith(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w900),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
