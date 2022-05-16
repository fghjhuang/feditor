

import 'package:hive/hive.dart';

class LocalBuffer{
  static late Box box;
  static String tokenBuffer = '';

  static Future<void> init() async {
    box = await Hive.openBox('local_buffer');
  }

  //读写是否为第一次打开app
  static bool readFirstTimeSetting() {
    return box.get("firsttime", defaultValue: true);
  }

  static void writeFirstTimeSetting(bool value) {
    box.put("firsttime", value);
  }

}