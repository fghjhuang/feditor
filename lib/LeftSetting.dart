
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
                IconButton(onPressed: (){}, icon: Icon(Icons.insert_drive_file_rounded,color: Colors.white,)),
                IconButton(onPressed: (){}, icon: Icon(Icons.create_new_folder_rounded,color: Colors.white,)),
                IconButton(onPressed: (){}, icon: Icon(Icons.delete_rounded,color: Colors.white,)),
                IconButton(onPressed: (){}, icon: Icon(Icons.edit_rounded,color: Colors.white,))
              ],
            ),
          )
        ],
      ),
    );
  }



}

