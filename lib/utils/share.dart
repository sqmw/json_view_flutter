/// 被格式化的字符串
String rawJsonString = """
{
  "name": "Jack"
}
""";
/// JsonView 左右的比列
class JsonViewMainPageRate{
  static const double _total = 0.96;

  static double left = _total / 2;
  static double right = _total / 2;

  /// width px
  /// delta px
  static setByXDelta(double width,double delta){
    left = (width * left + delta) / width;
    right = (width * right - delta) / width;
  }
}