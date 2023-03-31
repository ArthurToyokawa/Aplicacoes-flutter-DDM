import 'package:flutter/material.dart';
import 'package:flutter_dnd/pages/home.dart';
import 'package:flutter_dnd/pages/login.dart';
import 'package:flutter_dnd/pages/personagens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      routes: {
        '/home':(context) => Home(),
        '/login': (context) => Login(),
        '/Personagens':(context) => Personagens(), 
      },
      home: Login(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      )
    );
  }
}