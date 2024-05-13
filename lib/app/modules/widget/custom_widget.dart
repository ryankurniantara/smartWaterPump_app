// Widget List Tile With InkWell
import 'dart:async';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide ContextExtensionss;
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
                  // Container(
                  //   decoration: BoxDecoration(
                  //       border: Border(
                  //           top: Br.side(Colors.black26.withOpacity(0.1)))),
                  //   child: Intrinsic(
                  //     children: List.generate(
                  //       2,
                  //       (i) {
                  //         return Expanded(
                  //           child: Container(
                  //             decoration: BoxDecoration(
                  //                 border: Border(
                  //                     left: Br.side(i == 0
                  //                         ? Colors.white70
                  //                         : Colors.black26.withOpacity(0.1)))),
                  //             child: InkTouch(
                  //                 onTap: () =>
                  //                     Get.back(result: i == 0 ? null : i),
                  //                 padding: Ei.all(15),
                  //                 color: i == 0 ? Colors.black12 : Colors.white,
                  //                 child: Text(i == 0 ? cancelLabel : 'Kirim',
                  //                     style: i == 0 ? Gfont.black : Gfont.black,
                  //                     textAlign: Ta.center)),
                  //           ),
                  //         );
                  //       },
                  //     ),
                  //   ),
                  // )
                ],
              ),
            )),
      ),
    ]));
  }
}

class SecondCountDown extends StatelessWidget {
  final int seconds;
  final String text;
  final double fontSize;

  const SecondCountDown(this.text, this.seconds,
      {Key? key, this.fontSize = 15.5})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(Duration(seconds: 1), (i) => i),
      builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
        int now = DateTime.now().millisecondsSinceEpoch;
        int expiredTime =
            now + (seconds * 1000); // Mengubah detik menjadi milidetik
        Duration duration = Duration(milliseconds: expiredTime - now);

        int minutesRemaining = duration.inMinutes.remainder(60);
        int secondsRemaining = duration.inSeconds.remainder(60);

        String countdown = duration.inSeconds <= 0
            ? '00:00'
            : '$minutesRemaining:${secondsRemaining.toString().padLeft(2, '0')}';

        return Text('$text Hidup Selama ($countdown)',
            style: TextStyle(color: Colors.red, fontSize: fontSize));
      },
    );
  }
}

class SelectPicker {
  static show(BuildContext context,
      {required List<Option> options,
      Function(Option)? onSelect,
      Option? initialValue,
      String? textConfirm,
      bool fullScreen = false,
      double? height,
      int maxLines = 1}) {
    context.bottomSheet(
        SelectPickerWidget(
            initialValue: initialValue,
            options: options,
            fullScreen: fullScreen,
            onSelect: onSelect,
            maxLines: maxLines,
            height: height),
        backgroundColor: Colors.transparent,
        safeArea: !fullScreen);
  }
}

class SelectPickerWidget extends StatefulWidget {
  /// List of available options to choose from.
  final List<Option> options;

  /// Callback function to handle the selected option.
  final Function(Option)? onSelect;

  /// Initial selected option (optional).
  final Option? initialValue;

  /// Text for the confirmation button (optional).
  final String? textConfirm;

  /// Whether to display the picker in full screen (optional).
  final bool fullScreen;

  /// Whether to display the search bar (optional).
  final bool withSearch;

  /// Maximum number of lines for option text (optional).
  final int? maxLines;

  /// Height of the picker (optional), minimum is 300.
  final double? height;

  const SelectPickerWidget(
      {Key? key,
      this.options = const [],
      this.onSelect,
      this.initialValue,
      this.textConfirm,
      this.fullScreen = false,
      this.withSearch = false,
      this.maxLines,
      this.height})
      : super(key: key);

  @override
  State<SelectPickerWidget> createState() => _SelectPickerWidgetState();
}

class _SelectPickerWidgetState extends State<SelectPickerWidget> {
  final notifier = SelectPickerNotifier();

  double radius = LazyUi.radius;
  BorderRadiusGeometry borderRadius = Br.radiusOnly(tl: 0, tr: 0);
  double magnification = 1,
      diameterRatio = 1,
      squeeze = 1,
      itemExtent = 40,
      height = 300,
      maxLines = 1;

  double toDecimal(double value) {
    return value >= 1000 ? .4 : value / pow(10, value.ceil().toString().length);
  }

  void onInitials() {
    borderRadius = Br.radiusOnly(tl: radius, tr: radius);

    int i = widget.options.indexWhere(
        (e) => e.toMap().toString() == widget.initialValue?.toMap().toString());
    i = (i == -1 ? 0 : i);

    // set initial index
    notifier.index = i;
    notifier.scroll = FixedExtentScrollController(initialItem: i);

    notifier.options = widget.options.map((e) => e.option).toList();
    notifier.values = widget.options.map((e) => e.value).toList();

    // set original data
    notifier.originalOptions = notifier.options;
    notifier.originalValues = notifier.values;

    notifier.result = notifier.values.isEmpty
        ? {'option': notifier.options.isEmpty ? null : notifier.options[i]}
        : {
            'option': notifier.options.isEmpty ? null : notifier.options[i],
            'value': notifier.values.isEmpty ? null : notifier.values[i]
          };

    maxLines = (widget.maxLines ?? 1).toDouble();

    if (maxLines >= 4) {
      maxLines = 4;
    }

    magnification = maxLines > 1
        ? 1
        : widget.fullScreen
            ? 1.5
            : 1.2;
    diameterRatio = widget.fullScreen ? 1 : .8;
    squeeze = 1.2;
    itemExtent = 40 * maxLines;

    height = widget.fullScreen ? context.height : 300;

    if (maxLines > 2) {
      height += (20 * maxLines);
    }

    if (widget.height != null && !widget.fullScreen) {
      height = widget.height! < 300 ? 300 : widget.height!;
    }

    notifier.setHeight(height);
  }

  @override
  void initState() {
    super.initState();

    onInitials();
  }

  @override
  void dispose() {
    notifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isMobile = context.width < 600;

    return FractionallySizedBox(
      widthFactor: isMobile ? 1 : toDecimal(context.width),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            ScrollConfiguration(
              behavior: Unglow(),
              child: notifier.watch((state) => AnimatedContainer(
                    duration: 150.ms,
                    height: state.height,
                    decoration: BoxDecoration(
                        color: Colors.white, borderRadius: borderRadius),
                    child: SafeArea(
                      top: false,
                      child: Column(
                        children: [
                          Expanded(
                            child: CupertinoPicker(
                                magnification: magnification,
                                useMagnifier: false,
                                itemExtent: itemExtent,
                                offAxisFraction: 0,
                                diameterRatio: diameterRatio,
                                squeeze: squeeze,
                                scrollController: notifier.scroll,
                                selectionOverlay: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      border: Br.only(['b', 't'])),
                                ),

                                // This is called when selected item is changed.
                                onSelectedItemChanged: (int selectedItem) {
                                  if (widget.onSelect != null) {
                                    notifier.index = selectedItem;
                                    int i = notifier.index;

                                    if (notifier.values.isNotEmpty) {
                                      notifier.result = {
                                        'option': notifier.options[i],
                                        'value': notifier.values.length < i
                                            ? null
                                            : notifier.values[i]
                                      };
                                    } else {
                                      notifier.result = {
                                        'option': notifier.options[i]
                                      };
                                    }
                                  }
                                },
                                children: List<Widget>.generate(
                                    notifier.options.length, (int index) {
                                  return Center(
                                    child: Container(
                                      constraints: BoxConstraints(
                                          maxWidth: context.width * .75),
                                      child: Text(
                                        notifier.options[index],
                                        overflow: Tof.ellipsis,
                                        textAlign: Ta.center,
                                        maxLines: maxLines.toInt(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(fontSize: 16),
                                      ),
                                    ),
                                  );
                                })),
                          ),
                        ],
                      ),
                    ),
                  )),
            ),
            Positioned.fill(
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: Maa.center,
                        children: [
                          const SizedBox(width: 60),
                          SlideUp(
                            delay: 300,
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Utils.hex('fafafa'),
                                    spreadRadius: 15,
                                    blurRadius: 25,
                                    offset: const Offset(0, -5),
                                  ),
                                ],
                              ),
                              child: Builder(builder: (context) {
                                String confirm = widget.textConfirm ?? 'Select';

                                return InkTouch(
                                    onTap: () {
                                      if (widget.onSelect != null) {
                                        widget.onSelect?.call(
                                            Option.fromMap(notifier.result));
                                        Navigator.pop(context);
                                      }
                                    },
                                    padding: Ei.sym(
                                        v: 13,
                                        h: confirm.length > 25 ? 25 : 45),
                                    radius: Br.radius(25),
                                    color: Utils.hex('fff'),
                                    border: Br.all(),
                                    child: Container(
                                      constraints: BoxConstraints(
                                          maxWidth: context.width * .4),
                                      child: Text(
                                        confirm,
                                        textAlign: Ta.center,
                                        maxLines: 1,
                                        overflow: Tof.ellipsis,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                              fontWeight: Fw.bold,
                                              color: LzColors.black,
                                            ),
                                      ),
                                    ));
                              }),
                            ),
                          ),
                          Touch(
                            onTap: () => context.lzPop(),
                            child: SlideUp(
                              delay: 400,
                              child: Iconr(
                                La.times,
                                padding: Ei.all(20),
                              ),
                            ),
                          )
                        ],
                      ).margin(b: 15, l: 0),
                    ))),

            // search bar
            Poslign(
              alignment: Alignment.topLeft,
              child: Row(
                children: [
                  notifier.watch((state) => state.found == 0
                      ? const None()
                      : Textr(state.found.toString(), margin: Ei.only(r: 15)))
                ],
              ).margin(all: 5),
            )
          ],
        ),
      ),
    );
  }
}
