// Widget List Tile With InkWell
import 'package:flutter/material.dart';
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
