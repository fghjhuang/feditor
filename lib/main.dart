import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:oktoast/oktoast.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'BasePage.dart';
import 'database/local_buffer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}
class _MyAppState extends State<MyApp> {

  Future<void> initSystem() async {
    await Hive.initFlutter(); //初始化本地数据库
    await LocalBuffer.init(); //读取本地内容，配置
  }

  @override
  void initState() {
    super.initState();
    initSystem();
  }

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
