import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:markdown/markdown.dart';
import 'TopSetting.dart';
import 'base/theme_style.dart';

///MainEditPanel
class MainEditPanelPage extends StatefulWidget {
  const MainEditPanelPage({Key? key, required this.ctlListener}) : super(key: key);
  final ControlBarListener ctlListener;
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

  final TextEditingController _fileInputCtl = TextEditingController();

/*---------------------------end 变量---------------------------*/

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ControlBar(listener: widget.ctlListener),
        _mainPanel(),
      ],
    );
  }

  Widget _mainPanel() {
    return Container(
      // color: Colors.green,
      height: MediaQuery.of(context).size.height - 60,
      width: MediaQuery.of(context).size.width,
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(child: Container(
            color: Colors.red,
            child: TextField(
              textAlign: TextAlign.left,
              style:TextStyle(color: Colors.black, fontSize: 18),
              maxLines: null,
              minLines: 100,
              cursorColor:Colors.grey[800],
              decoration: const InputDecoration(
                filled: true,
                border: InputBorder.none,
                fillColor: Colors.grey,),
              controller: _fileInputCtl,
              onChanged: (value){
                setState(() {

                });
              },
            ),
          ),flex: 1,)
          ,
          Container(
            width: 2,
            color: Colors.grey,
          ),
          Expanded(child: SingleChildScrollView(
            child: HtmlWidget(
                markdownToHtml(_fileInputCtl.text)
            ),
          ),flex: 1,)
          ,
        ],
      ),
    );
  }


}
