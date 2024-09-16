import 'package:flutter/material.dart';
import 'package:flutter_json_view/flutter_json_view.dart';
import 'package:json_view/utils/share.dart' as share;

class JsonViewerRightPage extends StatefulWidget{
  const JsonViewerRightPage({super.key});

  @override
  State<StatefulWidget> createState() => JsonViewerRightPageState();
}

/// 正常这个 State 应该是 private 类型的
class JsonViewerRightPageState extends State<JsonViewerRightPage>{

  void updateView(){
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return share.jsonNoErr?JsonView.string(
      share.showString,
      theme: const JsonViewTheme(
        closeIcon: Icon(
          Icons.remove,
          color: Colors.green,
        ),
        openIcon: Icon(
          Icons.add,
          color: Colors.green,
        ),
      ),
    ):Text(share.showString,style: const TextStyle(color: Colors.red),);
  }
}