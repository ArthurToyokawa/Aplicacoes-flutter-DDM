import 'package:flutter/material.dart';
import 'package:flutter_dnd/pages/login.dart';
import 'package:flutter_dnd/routes.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

Future main() async {
  sqfliteFfiInit();

  databaseFactory = databaseFactoryFfi;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      routes: Routes.routes,
      home: const Login(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      )
    );
  }
}