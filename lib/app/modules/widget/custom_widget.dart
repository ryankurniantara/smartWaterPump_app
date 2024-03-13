// Widget List Tile With InkWell
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazyui/lazyui.dart';

class WiListTile extends StatelessWidget {
  final String? title;
  final List<Widget> children;
  final IconData? icon;

  const WiListTile({
    Key? key,
    this.title,
    this.icon,
    this.children = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: Mas.min,
        children: [
          title == null
              ? None()
              : Row(
                  children: [
                    icon == null
                        ? None()
                        : Iconr(icon!,
                            color: Colors.black,
                            size: 20,
                            margin: Ei.only(b: 10, r: 10)),
                    Textr(
                      '$title',
                      style: Gfont.bold,
                      margin: Ei.only(b: 10),
                    ),
                  ],
                ),
          ClipRRect(
            borderRadius: Br.radius(10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                mainAxisSize: Mas.min,
                children: children,
              ),
            ),
          )
        ],
      ),
    );
  }

  static Widget list(IconData? icon, String? title, Function() onTap) {
    if (title == '' || icon == null) return None();

    return InkTouch(
      onTap: onTap,
      child: Container(
        padding: Ei.all(20),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 2,
                offset: Offset(0, 5),
              ),
            ],
            border: Br.only(['t'], color: Colors.black.withOpacity(.09))),
        child: Row(
          mainAxisAlignment: Maa.spaceBetween,
          children: [
            Row(
              children: [
                Iconr(icon, margin: Ei.only(r: 15)),
                (title != null)
                    ? Textr(
                        '$title',
                        style: Gfont.black.copyWith(fontSize: 18),
                      )
                    : None(),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 15,
              color: Colors.black.withOpacity(0.6),
            )
          ],
        ),
      ),
    );
  }

  static Widget list2(IconData icon, String title, String value,
      bool hiddenIcon, Function() onTap) {
    return InkTouch(
      onTap: onTap,
      child: Container(
        padding: Ei.all(15),
        decoration: BoxDecoration(
            border: Br.only(['t'], color: Colors.black.withOpacity(.09))),
        child: Row(
          mainAxisAlignment: Maa.spaceBetween,
          children: [
            Row(
              children: [
                Iconr(icon, margin: Ei.only(r: 15)),
                Column(
                  mainAxisAlignment: Maa.start,
                  crossAxisAlignment: Caa.start,
                  children: [
                    Text(
                      title,
                      style: Gfont.black,
                    ),
                    Text(
                      value,
                      style: Gfont.black.copyWith(color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
            Icon(
              hiddenIcon == true ? Icons.edit : null,
              color: Colors.black.withOpacity(0.6),
            )
          ],
        ),
      ),
    );
  }
}

class WiDialog extends StatelessWidget {
  final List<Widget> children;
  final double padding;
  const WiDialog({Key? key, this.children = const [], this.padding = 25})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CenterDialog(
        child: Column(mainAxisSize: Mas.min, children: [
      ClipRRect(
          borderRadius: Br.radius(5),
          child: Container(
              color: Colors.white,
              width: Get.width,
              padding: Ei.all(padding),
              child: Column(mainAxisSize: Mas.min, children: children))),
      Touch(
          onTap: () => Get.back(),
          child: Textr('Tap here to close',
              style: Gfont.white, padding: Ei.all(15)))
    ]));
  }
}

//Wi Dialog Form (Form) ========================================================
class WiDialogForm extends StatelessWidget {
  final double padding;
  final List<Widget> children;
  final String cancelLabel;
  final String? tittle;
  const WiDialogForm(
      {Key? key,
      this.children = const [],
      this.padding = 25,
      this.tittle,
      this.cancelLabel = 'Batal'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CenterDialog(
        child: Column(children: [
      SlideUp(
        child: ClipRRect(
            borderRadius: Br.radius(5),
            child: Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: Caa.start,
                children: [
                  tittle != null
                      ? Textr(
                          tittle!.ucwords,
                          padding: Ei.only(t: 20, l: 15, r: 15),
                          style: Gfont.black
                              .copyWith(fontSize: 20, letterSpacing: 1),
                        )
                      : None(),
                  Padding(
                    padding: Ei.only(l: 15, r: 15, b: 10),
                    child: Column(
                      children: children,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                            top: Br.side(Colors.black26.withOpacity(0.1)))),
                    child: Intrinsic(
                      children: List.generate(
                        2,
                        (i) {
                          return Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      left: Br.side(i == 0
                                          ? Colors.black26
                                          : Colors.black))),
                              child: InkTouch(
                                  onTap: () =>
                                      Get.back(result: i == 0 ? null : i),
                                  padding: Ei.all(15),
                                  color: i == 0 ? Colors.black12 : Colors.white,
                                  child: Text(i == 0 ? cancelLabel : 'Kirim',
                                      style: i == 0 ? Gfont.black : Gfont.black,
                                      textAlign: Ta.center)),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            )),
      ),
    ]));
  }
}

class CountdownTimerWidget extends StatefulWidget {
  final int seconds;

  CountdownTimerWidget({Key? key, required this.seconds}) : super(key: key);

  @override
  _CountdownTimerWidgetState createState() => _CountdownTimerWidgetState();
}

class _CountdownTimerWidgetState extends State<CountdownTimerWidget> {
  late int remainingSeconds;
  late Timer? _timer;

  @override
  void initState() {
    super.initState();
    remainingSeconds = widget.seconds;
    if (remainingSeconds > 0) {
      _startTimer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return remainingSeconds <= 0
        ? Text('Timer Finished')
        : Text('Remaining Time: $remainingSeconds seconds');
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        remainingSeconds--;
        if (remainingSeconds <= 0) {
          _timer?.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
