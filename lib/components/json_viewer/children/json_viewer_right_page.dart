import 'package:flutter/cupertino.dart';
import 'package:flutter_json_view/flutter_json_view.dart';
import 'package:json_view/utils/share.dart';

class JsonViewerRightPage extends StatefulWidget{
  const JsonViewerRightPage({super.key});

  @override
  State<StatefulWidget> createState() => JsonViewerRightPageState();
}

class JsonViewerRightPageState extends State<JsonViewerRightPage>{

  void updateView(){
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return JsonView.string(rawJsonString);
  }
}