import 'package:app08_shared_20242/pages/home_page.dart';
import 'package:app08_shared_20242/utils/shared_global.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedGlobal preference = SharedGlobal();
  await preference.initSharedPreferences();
  runApp(const MyApp());
}

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
