import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

import 'BasePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'FEditor',
        home: const MyHomePage(),
      ),
    );
  }
}
