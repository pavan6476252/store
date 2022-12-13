import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive/hive.dart';
import 'package:store/auth/auth_handler.dart';
import 'package:store/constants.dart';
import 'package:store/firebase/add_user.dart';
import 'package:store/utils/app_bar.dart';
import 'package:store/utils/small_utils.dart';
import 'package:store/utils/snack_bar.dart';

import '../firebase/gloabals.dart';

GoogleSignIn googleSignIn = GoogleSignIn();

class UserAccount extends StatefulWidget {
  const UserAccount({super.key});

  @override
  State<UserAccount> createState() => _UserAccountState();
}

class _UserAccountState extends State<UserAccount> {
  GoogleSignInAccount? _user;

  checkisAdmin() async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .where('admin', isEqualTo: true)
          .get()
          .then(
        (value) {
          value.docs.forEach((element) {
            print(element['admin']);
            print(element['mail']);
            //here it is big flau but  iadont know how to check strictly is email is contains
            element['mail'] == _user?.email
                ? isAdmin.put("isAdmin", true)
                : isAdmin.put("isAdmin", false);
          });
        },
      );
    } catch (e) {
      print(e);
    }
  }

  signOut() async {
    googleSignIn.signOut();
    await isAdmin.put("isAdmin", false);
    _user = null;
    setState(() {});
  }

  signIn() async {
    try {
      await googleSignIn.signIn();
      _user = googleSignIn.currentUser;
      await checkisAdmin();
      setState(() {});
    } catch (e) {
      print("erorr");
    }
  }

  @override
  void initState() {
    _user = googleSignIn.currentUser;
    super.initState();
  }

  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      floatingActionButton: isAdmin.get('isAdmin') == true
          ? FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, '/add_product');
              },
              child: Text("Add item"),
            )
          : null,
      appBar: myAppBar(context, "About me ", null),
      body: Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpacer(25),
              title("Account"),
              verticalSpacer(10),
              userFun(),
              settings(),
              // ListTile(
              //   onTap: () {},
              //   title: Text("add product"),
              //   leading: Icon(Icons.add),
              //   trailing: Icon(Icons.shopping_bag),
              // )
            ],
          )),
    ));
  }

  Widget settings() {
    return Expanded(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpacer(30),
        title("Settings"),
        customTile(Icons.notifications, "Notifications", null,
            Icons.arrow_forward_ios_rounded),
        customTile(Icons.arrow_forward_ios_outlined, "Language", null,
            Icons.arrow_forward_ios_outlined),
        customTile(Icons.lock_outlined, "Privacy", null,
            Icons.arrow_forward_ios_rounded),
        customTile(Icons.help_outline_rounded, "Help Center", null,
            Icons.arrow_forward_ios_rounded),
        customTile(Icons.info_outline_rounded, "About Us", null,
            Icons.arrow_forward_ios_rounded),
      ],
    ));
  }

  Widget customTile(
          IconData icon, String title, String? sufText, IconData sufIcon) =>
      Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Theme.of(context).colorScheme.secondaryContainer),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: Row(
              children: [
                CircleAvatar(child: Icon(icon)),
                SizedBox(
                  width: 15,
                ),
                Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontWeight: FontWeight.w300),
                )
              ],
            )),
            Icon(sufIcon)
          ],
        ),
      );

  title(String title) => Text(
        title,
        style: Theme.of(context).textTheme.headline5,
      );

  userFun() {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Theme.of(context).colorScheme.secondaryContainer),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              flex: 2,
              child: CircleAvatar(
                  child: _user != null
                      ? Image.network(_user!.photoUrl ?? "")
                      : Icon(Icons.person))),
          Expanded(
              flex: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _user != null ? _user!.displayName ?? "" : "sdfdf",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const Divider(
                    height: 5,
                  ),
                  Text(_user == null ? "" : _user!.email)
                ],
              )),
          _user != null
              ? IconButton(
                  onPressed: () {
                    signOut();
                  },
                  icon: Icon(Icons.login))
              : IconButton(
                  onPressed: () {
                    signIn();
                  },
                  icon: Icon(Icons.logout))
        ],
      ),
    );
  }
}

class AddressBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExpandablePanel(
        header: Text("Sdfsdfsfs"),
        collapsed: Text(
          'vfdfsdfsf asdd d',
          softWrap: true,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        expanded: Column(
          children: [
            ListTile(
              title: Text("Dfds"),
            ),
            ListTile(
              title: Text("Dfds"),
            ),
            ListTile(
              title: Text("Dfds"),
            )
          ],
        ));
  }
}
