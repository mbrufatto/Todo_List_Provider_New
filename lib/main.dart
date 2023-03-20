import 'package:flutter/material.dart';
import 'package:todo_list_provider/app/app_module.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const AppModule());
}
