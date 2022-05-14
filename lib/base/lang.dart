

import 'dart:convert';
import 'package:flutter/cupertino.dart';

class S{
  static Map<String, String> langdata= {};
  static String language= "cn";

  /*
  * 根据输入语言加载对应的assets里面的语言包
  * */
  static void loadLang(BuildContext context,String lang,Function callback){
    DefaultAssetBundle.of(context).loadString("assets/lang/$lang.json").then((value) {
      var data = json.decode(value);
      print(data.runtimeType);
      data.forEach((key, value) {
        langdata[key] = value.toString();
      });

      callback();
    });
  }

  /*
  * 获取字符串
  * */
  static String of(String id,String defaultvalue){
    return langdata[id]??defaultvalue;
  }


  static String getLangFileName(Locale locale){
    if(locale.languageCode.contains('zh')){
      language = "cn";
    }else{
      language="en";
    }
    return language;
  }

  static String getCalendarLocale(){
    if("cn"==language){
      return 'zh_CN';
    }else{
      return 'en_US';
    }
  }

}