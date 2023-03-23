import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:vaca_cloud/pages/Login.dart';
import 'package:vaca_cloud/pages/Prueba.dart';
void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Prueba(),
    );
  }
}
