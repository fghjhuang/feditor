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
                    icon: Icon(
                      Icons.insert_drive_file_rounded,
                      color: Colors.white,
                    )),
                IconButton(
                    onPressed: () {
                      _addFolderUI();
                    },
                    icon: Icon(
                      Icons.create_new_folder_rounded,
                      color: Colors.white,
                    )),
                IconButton(
                    onPressed: () {
                      _delete();
                    },
                    icon: Icon(
                      Icons.delete_rounded,
                      color: Colors.white,
                    )),
                IconButton(
                    onPressed: () {
                      _editName();
                    },
                    icon: Icon(
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
                            _selectedNode = _map[index];
                          },
                          child: Row(
                            children: [
                              Icon(_getItemType(index)=="tree"?Icons.folder:Icons.insert_drive_file),
                              Text(_getItem(index))
                            ],
                          )),
                    );
                  }))
        ],
      ),
    );
  }

  Tree _accountTree = Tree(); //整体的树
  dynamic _selectedNode = ""; //选择的节点
  var _count = 0;
  String _selectedPath="0";
  Map<int,dynamic> _map={};
  Map<String,dynamic> _smap={};
  //获取内容
  String _getItem(int index){
    dynamic item=_map[index];
    if(item is Tree){
      return item.name;
    }else if(item is Node){
      return item.name;
    }
    return "";
  }
  String _getItemType(int index){
    dynamic item=_map[index];
    if(item is Tree){
      print('index"$index is tree');
      return "tree";
    }else if(item is Node){
      print('index"$index is Node');
      return "node";
    }
    print('index"$index is nothing');
    return "";
  }

  //获取长度
  int _indexCount=0;
  int _getTolLen(){
    return _smap.length;
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
    _file.level=_selectedPath;
    _file.name = name;
    _smap["$_selectedPath-file"]=_file;
  }

  void _addTree(String name){
    Tree _tree = Tree();
    _tree.level=_selectedPath;
    _tree.name = name;
    _smap["$_selectedPath-tree"]=_tree;
  }
}

class Tree{
  String level="0";
  String name="";
  bool show=true;
  Map<int,dynamic> nodes={};

  @override
  String toString(){
    var nodestr=[];
    nodes.forEach( (key, value){
      nodestr.add("($key : $value)");
    } );
    return "level:$level,name:$name,show:$show,node list:[$nodestr]";
  }
}

class Node{
  String level="";
  String name="";

  @override
  String toString(){
    return "Node(level:$level,name:$name)";
  }
}
