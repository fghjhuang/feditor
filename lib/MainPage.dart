
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'base/theme_style.dart';


///MainEditPanel
class MainEditPanelPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainEditPanelState();
  }
}

class _MainEditPanelState extends State<MainEditPanelPage> {
/*---------------------------常量---------------------------*/
static const _tag = "(_MainEditPanelState)";

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

