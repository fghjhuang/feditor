import 'package:feditor/base/theme_style.dart';
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
            flex: 6,
          ),

          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Stack(
                  children: [
                    Row(
                      children: const [
                        Text('PREVIEW AS',style: TextStyle(
                            color: Colors.white
                        ),),
                        Icon(Icons.arrow_drop_down,   color: Colors.white)
                      ],
                    ),
                    SizedBox(
                    //  color: Colors.grey,
                      child: TextButton(
                        onPressed: (){
                          _previewAs();
                        },
                        child: const Text('PREVIEW AS',style: TextStyle(
                          color: Colors.transparent
                        ),),
                      ),
                    )
                  ],
                ),

                const SizedBox(width: 35,),
                Stack(
                  children: [
                    Row(
                      children: const [
                        Text('EXPORT AS',style: TextStyle(
                            color: Colors.white
                        ),),
                        Icon(Icons.arrow_drop_down,   color: Colors.white)
                      ],
                    ),
                    SizedBox(
                      //  color: Colors.grey,
                      child: TextButton(
                        onPressed: (){
                          _exportAs();
                        },
                        child: const Text('EXPORT AS',style: TextStyle(
                            color: Colors.transparent
                        ),),
                      ),
                    )
                  ],
                ),
                const SizedBox(width: 35,),
                Stack(
                  children: [
                    Row(
                      children: const [
                        Text('IMPORT FROM',style: TextStyle(
                            color: Colors.white
                        ),),
                        Icon(Icons.arrow_drop_down,   color: Colors.white)
                      ],
                    ),
                    SizedBox(
                      //  color: Colors.grey,
                      child: TextButton(
                        onPressed: (){
                          _importFrom();
                        },
                        child: const Text('IMPORT FROM',style: TextStyle(
                            color: Colors.transparent
                        ),),
                      ),
                    )
                  ],
                ),
                const SizedBox(width: 30,),
                IconButton(
                    onPressed: () {_clickSettingBar();},
                    icon: const Icon(
                      Icons.settings,
                      color: Colors.white,
                    ))
              ],
            ),
            flex: 12,
          ),
        ],
      ),
    );
  }

  bool _enableFileBar=false;
  bool _enableSettingBar=false;
  //显示隐藏左右边的bar
  void _clickFileBar(){
    _enableFileBar=!_enableFileBar;
    widget.listener.onFileBarClick(_enableFileBar);
  }

  void _clickSettingBar(){
    _enableSettingBar=!_enableSettingBar;
    widget.listener.onSettingBarClick(_enableSettingBar);
  }

  //预览
  void _previewAs(){

  }

  //导入文件
  void _importFrom(){

  }

  //导出文件
  void _exportAs(){

  }


}
