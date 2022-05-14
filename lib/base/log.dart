import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class DartLog {

  /*
  * 打印普通信息
  * */
  static void i(String tag, String msg) {
    var stackTrace = StackTrace.current;
    var line = "";
    try {
      line = stackTrace.toString().trimRight().split('\n')[1];
      line = line.substring(line.indexOf('('));
    } catch (e) {
      line = 'error trace info';
    }
    var now = DateTime.now();
    var str = '[${now.hour}:${now.minute}:${now.second}],$tag:$msg $line\n';
    if (msg.length > 800) {
      for (int i = 0; i <= msg.length ~/ 800; i++) {
        print('$tag-$i:' +
            msg.substring(i * 800,
                (msg.length - 800 * (i + 1)) > 0 ? 800 * (i + 1) : msg.length));
      }
      print(line);
    } else {
      print(str);
    }
  }

  static void ii(String tag, String msg){
    debugPrint("----------------------\nTag:$tag\nMsg:$msg\n------------------------\n");
  }
  /*
  * 打印错误信息
  * */
  static void e(String tag, String msg) {
    var stackTrace = StackTrace.current;
    var line = "";
    try {
      line = stackTrace.toString().trimRight().split('\n')[1];
      line = line.substring(line.indexOf('('));
    } catch (e) {
      line = 'error trace info';
    }
    print(tag + ':' + msg + " " + line);
  }


}

