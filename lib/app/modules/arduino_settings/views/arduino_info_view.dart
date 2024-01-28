import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lazyui/lazyui.dart';

class ArduinoInfoView extends GetView {
  const ArduinoInfoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
            child: Column(
              crossAxisAlignment: Caa.start,
              mainAxisSize: Mas.min,
              children: [
                Text(
                  'Info Detail Arduino',
                  style: Gfont.fs18.copyWith(fontSize: 30),
                ),
                LzFormGroup(
                  label: 'Power Arduino',
                  sublabelStyle: SublabelStyle.card,
                  labelStyle: Gfont.fs19,
                  children: [
                    LzForm.switches(
                        label: 'On|Off',
                        onChange: (val) {
                          logg(val);
                        }),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
