import 'package:flutter/cupertino.dart';
import 'package:json_view/components/json_viewer/children/json_viewer_right_page.dart';

/// 这里是通过修改为 public 的形式来访问的，实际上应该是 private 才可以
final GlobalKey<JsonViewerRightPageState> jsonViewerRightGlobalKey = GlobalKey();

void updateJsonViewerRight(){
  jsonViewerRightGlobalKey.currentState?.updateView();
}