import 'package:flutter/material.dart';
import 'package:json_view/handler/view_update_handler.dart';
import 'package:json_view/utils/share.dart' as share;

class JsonViewerLeftPage extends StatefulWidget{
  JsonViewerLeftPage({super.key});
  final TextEditingController _rawJsonStringEditController = TextEditingController();
  @override
  State<StatefulWidget> createState() => _JsonViewerLeftPageState();
}

class _JsonViewerLeftPageState extends State<JsonViewerLeftPage>{
  @override
  Widget build(BuildContext context) {
    widget._rawJsonStringEditController.text = share.rawJsonString;
    return TextField(
      controller: widget._rawJsonStringEditController,
      maxLines: 10000,
      style: const TextStyle(
          height: 1,
          fontSize: 16
      ),
      decoration: const InputDecoration(
        hintText: '请输入...',
      ),
      onChanged: (String $string){
        debugPrint($string);
        share.rawJsonString = $string;
        updateJsonViewerRight();
      },
    );
  }
}