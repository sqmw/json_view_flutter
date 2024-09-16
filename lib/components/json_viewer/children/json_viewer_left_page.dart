import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_view/handler/view_update_handler.dart' as view_update_handler;
import 'package:json_view/utils/json/util_json.dart' as util_util;
import 'package:json_view/utils/share.dart' as share;

class JsonViewerLeftPage extends StatefulWidget{
  JsonViewerLeftPage({super.key});
  final TextEditingController _rawJsonStringEditController = TextEditingController();
  @override
  State<StatefulWidget> createState() => _JsonViewerLeftPageState();
}

class _JsonViewerLeftPageState extends State<JsonViewerLeftPage>{
  int textSelectOffset = 0;

  final FocusNode _focusNode = FocusNode();
  DateTime? _lastCmdKeyPress;
  static const _doubleTapDuration = Duration(milliseconds: 500);

  void _handleKeyEvent(KeyEvent event) {
    if (event is KeyDownEvent) {
      if (event.logicalKey == LogicalKeyboardKey.metaLeft ||
          event.logicalKey == LogicalKeyboardKey.metaRight) {
        DateTime now = DateTime.now();
        if (_lastCmdKeyPress != null && now.difference(_lastCmdKeyPress!) < _doubleTapDuration) {
          debugPrint('CMD 键被连续按下两次！');
          if (share.nowJsonSpreadState == share.RawJsonSpreadOrGather.spread){
            widget._rawJsonStringEditController.text = util_util.compactJsonString(widget._rawJsonStringEditController.text).item1;
            share.nowJsonSpreadState = share.RawJsonSpreadOrGather.gather;
          }else{
            widget._rawJsonStringEditController.text = util_util.formatJsonString(widget._rawJsonStringEditController.text).item1;
            share.nowJsonSpreadState = share.RawJsonSpreadOrGather.spread;
          }
          _lastCmdKeyPress = null; // 重置，避免连续三次按下也被认为是双击
        } else {
          _lastCmdKeyPress = now;
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _focusNode.requestFocus();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    widget._rawJsonStringEditController.text = share.showString;
    return KeyboardListener(
      focusNode: _focusNode,
      onKeyEvent: _handleKeyEvent,
      child: TextField(
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
          textSelectOffset = widget._rawJsonStringEditController.selection.baseOffset;
          // debugPrint($string);
          var res = util_util.formatJsonString($string);
          /// 表示转换没问题
          if (res.item2 == null){
            share.jsonNoErr = true;
            share.showString = res.item1;
            /// 如果发现文本格式化之后和当前文本框里面「不」一样 => 更新左边的
            if (widget._rawJsonStringEditController.text != share.showString){
              widget._rawJsonStringEditController.text = share.showString;
            }
            view_update_handler.updateJsonViewerRight();

            widget._rawJsonStringEditController.selection = TextSelection.fromPosition(
                TextPosition(offset: min(textSelectOffset, share.showString.length))
            );
          }else{
            share.jsonNoErr = false;
            share.showString = res.item2.toString();
            view_update_handler.updateJsonViewerRight();
          }
        },
      )
    );
  }
}