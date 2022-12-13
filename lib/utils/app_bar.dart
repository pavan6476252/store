import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

import '../state/scaffold_state.dart';

myAppBar(BuildContext context, String title, Widget? widget) {
  MyScaffoldState myScaffoldState = context.watch<MyScaffoldState>();
  return PreferredSize(
    preferredSize: Size.fromHeight(120),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                // IconButton(
                //     onPressed: () {
                //       myScaffoldState.setDrawerState();
                //     },
                //     icon: LineIcon(
                //       LineIcons.bars,
                //       size: 32,
                //     )),
                SizedBox(
                  width: 10,
                ),
                Title(
                    color: Theme.of(context).colorScheme.primary,
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.headline5,
                    ))
              ],
            ),
          ),
          IconButton(onPressed: () {}, icon: LineIcon(LineIcons.search)),
          widget ?? SizedBox()
        ],
      ),
    ),
  );
}
