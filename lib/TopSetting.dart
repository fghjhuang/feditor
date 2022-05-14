import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ControlBarListener{
  void onFileBarClick(bool enable){}
  void onSettingBarClick(bool enable){}
}
///MainEditPanel
class ControlBar extends StatefulWidget {
  const ControlBar({Key? key, required this.listener}) : super(key: key);
  final ControlBarListener listener;
  @override
  State<StatefulWidget> createState() {
    return _ControlBarState();
  }
}

class _ControlBarState extends State<ControlBar> {
/*---------------------------常量---------------------------*/
  static const _tag = "(_ControlBarState)";

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
      width: MediaQuery.of(context).size.width,
      height: 60,
      color: Colors.grey[800],
      child: Flex(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        direction: Axis.horizontal,
        children: [
          Expanded(
            child: IconButton(
                onPressed: () {
                  _clickFileBar();
                },
                icon: const Icon(
                  Icons.space_dashboard,
                  color: Colors.white,
                )),
            flex: 1,
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 10),
              child: const Text('FEditor',
                  style: TextStyle(
                      fontFamily: 'spixel', color: Colors.white, fontSize: 18)),
            ),
            flex: 18,
          ),
          Expanded(
            child: IconButton(
                onPressed: () {_clickSettingBar();},
                icon: const Icon(
                  Icons.settings,
                  color: Colors.white,
                )),
            flex: 1,
          ),
        ],
      ),
    );
  }

  bool _enableFileBar=false;
  bool _enableSettingBar=false;
  void _clickFileBar(){
    _enableFileBar=!_enableFileBar;
    widget.listener.onFileBarClick(_enableFileBar);
  }

  void _clickSettingBar(){
    _enableSettingBar=!_enableSettingBar;
    widget.listener.onSettingBarClick(_enableSettingBar);
  }
}
