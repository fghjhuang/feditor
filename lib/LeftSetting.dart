import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
                      _addFile();
                    },
                    icon: Icon(
                      Icons.insert_drive_file_rounded,
                      color: Colors.white,
                    )),
                IconButton(
                    onPressed: () {
                      _addFolder();
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
  Map<int,dynamic> _map={};
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
      return "tree";
    }else if(item is Node){
      return "node";
    }
    return "";
  }

  //获取长度
  int _indexCount=0;
  int _getTolLen(){
    int res=0;
    _indexCount=0;
    res = res+_accountTree.nodeList.length;
    for(int i=0;i< _accountTree.nodeList.length;i++){
      _map[_indexCount]=_accountTree.nodeList[i];
      _indexCount++;
    }

    for(Tree tree in _accountTree.treeList){
      _indexCount++;
      _map[_indexCount]=tree;
      res = res+_getTreeLen(tree);
    }
    return res;
  }
  int _getTreeLen(Tree tree){
    int res = 0;
    res = res+tree.nodeList.length;
    for(int i=0;i< tree.nodeList.length;i++){
      _map[_indexCount]=tree.nodeList[i];
      _indexCount++;
    }
    for(Tree treeItem in tree.treeList){
      _indexCount++;
      _map[_indexCount]=treeItem;
      res = res+_getTreeLen(treeItem);
    }
    return res;
  }

  void _addFile() {
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
                    Node _file = Node();
                    _file.id='0';
                    _file.name = _controller.text;
                    _accountTree.nodeList.add(_file);
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

  void _addFolder() {
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
                    Tree _tree = Tree();
                    _tree.id='0';
                    _tree.name = _controller.text;
                    _accountTree.treeList.add(_tree);
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
}

class Tree{
  String id="0";
  String name="";
  bool show=true;
  List<Node> nodeList=[];
  List<Tree> treeList=[];
}

class Node{
  String id="";
  String name="";
}
