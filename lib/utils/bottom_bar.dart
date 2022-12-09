import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

Widget bottomBar(BuildContext context, Function fn) {
  return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("\$ 12900.00", style: Theme.of(context).textTheme.headline5),
          GestureDetector(
            onTap: () => fn(),
            child: Chip(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              label: Row(children: [
                LineIcon(LineIcons.shoppingCart),
                Text(
                  "Add To Cart",
                  style: Theme.of(context).textTheme.bodyMedium,
                )
              ]),
            ),
          ),
        ],
      ));
}
