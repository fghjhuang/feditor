
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'base/theme_style.dart';


///MainEditPanel
class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SettingPageState();
  }
}

class _SettingPageState extends State<SettingPage> {
/*---------------------------常量---------------------------*/
static const _tag = "(_SettingPageState)";

/*---------------------------end 常量---------------------------*/


/*---------------------------变量---------------------------*/


/*---------------------------end 变量---------------------------*/


  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: 200,
      color: Colors.greenAccent,
    );
  }


}

