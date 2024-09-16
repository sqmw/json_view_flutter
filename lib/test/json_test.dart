import 'dart:convert';
import 'package:tuple/tuple.dart';

Tuple2<String, dynamic> formatJsonString(String jsonString) {
  dynamic jsonObject;
  JsonEncoder encoder;
  try{
     jsonObject = json.decode(jsonString);
    /// 这里表示的是间隔
     encoder = const JsonEncoder.withIndent('  ');
  } catch(err){
    return Tuple2("", err);
  }
  return Tuple2(encoder.convert(jsonObject), null);
}

Tuple2<String, dynamic> compactJsonString(String jsonString) {
  dynamic jsonObject;
  JsonEncoder encoder;
  try{
    jsonObject = json.decode(jsonString);
    encoder = const JsonEncoder();
  }catch(err){
    return Tuple2("", err);
  }
  return Tuple2(encoder.convert(jsonObject), null);
}

void main() {
  String jsonString = """
  {
  "name": "Jack",
  "":{}
  
}

  """;
  var formattedJsonString = formatJsonString(jsonString);
  print(formattedJsonString);
}