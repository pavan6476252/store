import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

class Auth extends StatelessWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Center(
            child: ListTile(
          leading: LineIcon(LineIcons.googleLogo),
          title: Text("go with google"),
          onTap: () {
            
          },
        )),
      ),
    );
  }
}
