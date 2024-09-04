class RegExpUtils {
  RegExpUtils._();

  static bool regMatch(String? value, String pattern) {
    return (value == null) ? false : RegExp(pattern).hasMatch(value);
  }

  // 手机号正则
  static bool isPhoneReg(String? value) => regMatch(value, r'^1[3-9]\d{9}$');

  // 姓名正则 包含少数名族 例如司马义·买买提
  static bool isNumeReg(String? value) => regMatch(value, r'^[\u4e00-\u9fa5]+(?:·[\u4e00-\u9fa5]+)*$');

  // 纯数字
  static bool isAllNumbersReg(String? value) => regMatch(value, r'^\d+$');

  // 纯字母
  static bool isAllLettersReg(String? value) => regMatch(value, r'^[A-Za-z]+$');
}
