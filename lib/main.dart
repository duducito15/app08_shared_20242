import 'package:app08_shared_20242/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      //debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
