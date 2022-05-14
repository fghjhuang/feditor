import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

///提示工具类
class ToastUtil {
  ///提示内容
  static void show(String tips) {
    showToast(
      tips,
      duration: Duration(seconds: 2),
      backgroundColor: Colors.black.withOpacity(0.5),
      radius: 10.0,
    );
  }

  static void showUntil(String tips,int second) {
    showToast(
      tips,
      duration: Duration(seconds: second),
      backgroundColor: Colors.black.withOpacity(0.5),
      radius: 10.0,
    );
  }



  //成功提示
  static void showSuccess(String tips) {
    showToastWidget(
      Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Container(
            padding: EdgeInsets.all(5),
            color: Colors.grey.withOpacity(0.8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.check_circle_outline_outlined,
                  // size: 30.0,
                  color: Colors.white,
                ),
                Container(
                  width: 100,
                  child: Text(
                    tips,
                    maxLines: 5,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      duration: Duration(seconds: 3),
    );
  }

  //警告框
  static void showWarning(String tips) {
    showToastWidget(
      Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Container(
            padding: EdgeInsets.all(5),
            color: Colors.grey.withOpacity(0.8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.error_outline_outlined,
                  // size: 30.0,
                  color: Colors.white,
                ),
                Container(
                  width: 100,
                  child: Text(
                    tips,
                    maxLines: 5,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      duration: Duration(seconds: 3),
    );
  }
}
