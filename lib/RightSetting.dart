
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
    return Scaffold(
      appBar: AppBar(
        elevation:0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          icon: Icon(
            Icons.arrow_back_ios,
            color: ThemeUtil.backColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),


      body: Column(
        children: [


        ],
      ),
    );
  }



}

