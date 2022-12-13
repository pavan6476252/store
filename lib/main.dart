import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/firebase/gloabals.dart';
import 'package:store/main2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:store/pages/product_page.dart';

import 'package:store/state/scaffold_state.dart';


import 'package:hive_flutter/hive_flutter.dart';
import 'pages/add_product.dart';
import 'pages/my_cart.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
 
 final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  isAdmin =await Hive.openBox('isAdmin');
  runApp(const Main2());
}

class Main2 extends StatefulWidget {
  const Main2({super.key});

  @override
  State<Main2> createState() => _Main2State();
}

class _Main2State extends State<Main2> {
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [Provider<MyScaffoldState>(create: (_) => MyScaffoldState())],
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => MyApp(),
          '/product_page': (context) => ProductPage(),
          '/my_cart': (context) => MyCart(),
          '/add_product': (context) => AddProduct(),
        },
      ),
    );
  }
}
