import 'package:flutter/material.dart';

import 'package:json_view/components/json_viewer/children/json_viewer_left_page.dart';
import 'package:json_view/components/json_viewer/children/json_viewer_right_page.dart';
import 'package:json_view/handler/files/show_view_update_handler.dart';
import 'package:json_view/utils/share.dart' as share;

class JsonViewerMainPage extends StatefulWidget{
  const JsonViewerMainPage({super.key});

  @override
  State<StatefulWidget> createState() => _JsonViewerMainPageState();
}

class _JsonViewerMainPageState extends State<JsonViewerMainPage>{
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    debugPrint(size.toString());
    return Row(
      children: [
        Container(
          color: Colors.white,
          height: size.height,
          width: size.width * share.JsonViewMainPageRate.left,
          child: JsonViewerLeftPage(),
        ),
        MouseRegion(
          cursor: SystemMouseCursors.resizeLeftRight,
          child: GestureDetector(
            // onPanStart: (details){
            //   debugPrint("拖动开始, ${details.globalPosition.dx}");
            // },
            onPanUpdate: (details){
              setState(() {
                share.JsonViewMainPageRate.setByXDelta(size.width, details.delta.dx);
              });
              // debugPrint("正在拖动, ${details.delta}");
            },
            // onPanEnd: (details){
            //   debugPrint("拖动结束, ${details.globalPosition.dx}");
            // },
            /// 使用  VerticalDivider 会出现 GestureDetector 拖动识别不了的情况
            // child:const VerticalDivider(width: 20,),
            child: Container(height: size.height,width: 5,color: Colors.grey)
          ),
        ),
        Expanded(
          child: SizedBox(
            // color: Colors.green,
            height: size.height,
            width: size.width * share.JsonViewMainPageRate.right,
            child: JsonViewerRightPage(
              key: jsonViewerRightGlobalKey,
            ),
          )
        )
      ],
    );
  }
}