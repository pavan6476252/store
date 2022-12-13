library globals;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

late Box isAdmin;

  final ImagePicker imagePicker = ImagePicker();


