import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'base/log.dart';
import 'base/theme_style.dart';

///MainEditPanel
class FileBrowserPage extends StatefulWidget {
  const FileBrowserPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FileBrowserPageState();
  }
}

class _FileBrowserPageState extends State<FileBrowserPage> {
/*---------------------------常量---------------------------*/
  static const _tag = "(_FileBrowserPageState)";

/*---------------------------end 常量---------------------------*/

/*---------------------------变量---------------------------*/

/*---------------------------end 变量---------------------------*/

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DartLog.ii(_tag, _accountTree.toString());
    return Container(
      height: MediaQuery.of(context).size.height,
      width: 200,
      color: Colors.grey[900],
      child: Column(
        children: [
          Container(
            height: 60,
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      _addFileUI();
                    },
                    icon: const Icon(
                      Icons.insert_drive_file_rounded,
                      color: Colors.white,
                    )),
                IconButton(
                    onPressed: () {
                      _addFolderUI();
                    },
                    icon: const Icon(
                      Icons.create_new_folder_rounded,
                      color: Colors.white,
                    )),
                IconButton(
                    onPressed: () {
                      _delete();
                    },
                    icon: const Icon(
                      Icons.delete_rounded,
                      color: Colors.white,
                    )),
                IconButton(
                    onPressed: () {
                      _editName();
                    },
                    icon: const Icon(
                      Icons.edit_rounded,
                      color: Colors.white,
                    ))
              ],
            ),
          ),
          //文件夹管理
          Expanded(
              child: ListView.builder(
                  itemCount: _getTolLen(),
                  itemBuilder: (context, index) {
                    return Container(
                      child: TextButton(
                          onPressed: () {
                            _selected(index);
                          },
                          child: Container(
                            color: _accountTree[index].cur==_selectedNode?.cur?Colors.black54:Colors.transparent,
                            child: Row(
                              children: [
                                Icon(_getItemType(index)=="tree"?Icons.folder:Icons.insert_drive_file),
                                Text(_getItem(index))
                              ],
                            ),
                          )),
                    );
                  }))
        ],
      ),
    );
  }

  List<Node> _accountTree = []; //整体的树
  var _count = 0;
  Node? _selectedNode;
  Map<int,dynamic> _map={};
  Map<String,dynamic> _smap={};
  //获取内容
  String _getItem(int index){
    return _accountTree[index].name;
  }
  String _getItemType(int index){
    return _accountTree[index].type;
  }

  //获取长度

  int _getTolLen(){
    return _accountTree.length;
  }

  //点击文件或者文件夹
  _selected(int index){
    _selectedNode=_accountTree[index];
    setState(() {

    });
  }

  void _addFileUI() {
 final TextEditingController _controller=TextEditingController();
    showCupertinoDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text("input name"),
            content: Card(
              color: Colors.white,
              elevation: 0.0,
              child: TextField(
                  cursorColor: Colors.grey[800],
                  textAlignVertical: TextAlignVertical.bottom,
                  enableInteractiveSelection: false,
                  onTap: () {},
                  controller: _controller,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[800]!),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.close,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        _controller.clear();
                      },
                    ),
                  )),
            ),
            actions: [
              CupertinoDialogAction(
                child: Text("save"),
                onPressed: () {
                  Navigator.pop(context);
                  setState(() {
                    _addFile(_controller.text);
                  });
                },
              ),
              CupertinoDialogAction(
                child: Text("cancel"),
                isDestructiveAction: true,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  void _addFolderUI() {
    final TextEditingController _controller=TextEditingController();
    showCupertinoDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text("input folder name"),
            content: Card(
              color: Colors.white,
              elevation: 0.0,
              child: TextField(
                  cursorColor: Colors.grey[800],
                  textAlignVertical: TextAlignVertical.bottom,
                  enableInteractiveSelection: false,
                  onTap: () {},
                  controller: _controller,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[800]!),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.close,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        _controller.clear();
                      },
                    ),
                  )),
            ),
            actions: [
              CupertinoDialogAction(
                child: Text("save"),
                onPressed: () {
                  Navigator.pop(context);
                  setState(() {
                    _addTree(_controller.text);
                  });
                },
              ),
              CupertinoDialogAction(
                child: Text("cancel"),
                isDestructiveAction: true,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  void _delete() {}

  void _editName() {}

  void _addFile(String name){
    Node _file = Node();

    _file.name = name;
    if(_selectedNode?.type=="node"){
      int parent = _selectedNode?.parent??0;
      _file.parent=parent;
      List<Node> list = _accountTree.where((element) => element.parent==parent).toList();
      _file.cur = list.length+1;
    }else if(_selectedNode?.type=="tree"){

    }else{
      int parent = _selectedNode?.parent??0;
      _file.parent=parent;
      List<Node> list = _accountTree.where((element) => element.parent==parent).toList();
      _file.cur = list.length+1;
    }
    _file.show=true;
    _file.type="node";
    _accountTree.add(_file);
  }

  void _addTree(String name){
    Node _file = Node();
    _file.name = name;
    if(_selectedNode?.type=="node"){
      int parent = _selectedNode?.parent??0;
      _file.parent=parent;
      List<Node> list = _accountTree.where((element) => element.parent==parent).toList();
      _file.cur = list.length+1;
    }else if(_selectedNode?.type=="tree"){

    }else{
      int parent = _selectedNode?.parent??0;
      _file.parent=parent;
      List<Node> list = _accountTree.where((element) => element.parent==parent).toList();
      _file.cur = list.length+1;
    }
    _file.show=true;
    _file.type="tree";
    _accountTree.add(_file);
  }
}

class Node{
  int parent=0;
  int cur=0;
  String name="";
  bool show=true;
  String type="node"; //node tree

  @override
  String toString(){
    return "(parent:$parent,cur:$cur,name:$name,show:$show,type:$type)";
  }
}

