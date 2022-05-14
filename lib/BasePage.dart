import 'package:feditor/LeftSetting.dart';
import 'package:feditor/MainPage.dart';
import 'package:feditor/RightSetting.dart';
import 'package:feditor/TopSetting.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> implements ControlBarListener {
  static const _tag = "(_MyHomePageState)";
  bool _showLeft = false;
  bool _showRight = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: null,
      body: Container(
        // color: Colors.red,
        // width: 500,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          _showLeft ? FileBrowserPage() : Container(),
          Expanded(
            child: MainEditPanelPage(
              ctlListener: this,
            ),
          ),
          _showRight ? SettingPage() : Container()
        ]),
      ),
    );
  }

  @override
  void onFileBarClick(bool enable) {
    setState(() {
      _showLeft = enable;
    });
  }

  @override
  void onSettingBarClick(bool enable) {
    setState(() {
      _showRight = enable;
    });
  }
}
