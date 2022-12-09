import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

myAppBar() {
  return PreferredSize(
    preferredSize: Size.fromHeight(120),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        children: [
          IconButton(
              onPressed: () {},
              icon: LineIcon(
                LineIcons.bars,
                size: 32,
              ))
        ],
      ),
    ),
  );
}
