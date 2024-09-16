/// 需要展示到右侧的字符串
/// 可以是已经格式化了的，也可以是错误的提示信息
String showString = """
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
    /// 设置条件，防止到达边界，后面使用按钮更好一些
    if (left < 0.25 && delta < 0 || right < 0.25 && delta > 0){
      return;
    }
    left = (width * left + delta) / width;
    right = (width * right - delta) / width;
  }
}

bool jsonNoErr = true;

enum RawJsonSpreadOrGather{
  spread,
  gather
}

RawJsonSpreadOrGather nowJsonSpreadState =  RawJsonSpreadOrGather.spread;