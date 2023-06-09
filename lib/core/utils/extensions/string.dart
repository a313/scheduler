import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';

extension CustomStringExtension on String {
  static const diacriticsReg =
      'à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ|À|Á|Ạ|Ả|Ã|Â|Ầ|Ấ|Ậ|Ẩ|Ẫ|Ă|Ằ|Ắ|Ặ|Ẳ|Ẵ|è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ|È|É|Ẹ|Ẻ|Ẽ|Ê|Ề|Ế|Ệ|Ể|Ễ|ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ|Ò|Ó|Ọ|Ỏ|Õ|Ô|Ồ|Ố|Ộ|Ổ|Ỗ|Ơ|Ờ|Ớ|Ợ|Ở|Ỡ|ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ|Ù|Ú|Ụ|Ủ|Ũ|Ư|Ừ|Ứ|Ự|Ử|Ữ|ì|í|ị|ỉ|ĩ|Ì|Í|Ị|Ỉ|Ĩ|đ|Đ|ỳ|ý|ỵ|ỷ|ỹ|Ỳ|Ý|Ỵ|Ỷ|Ỹ';

  ///Check if string is contain diacritics
  bool get containDiacritics => contains(RegExp(diacriticsReg));

  ///Remove all diacritics of text
  ///
  ///Vi: Xóa toàn bộ dấu khỏi text
  ///
  ///Eg: 'Loại bỏ tiếng việt' -> 'Loai bo tieng viet'
  String removeDiacritics() {
    const vietnamese = 'aAeEoOuUiIdDyY';
    final vietnameseRegex = <RegExp>[
      RegExp(r'à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ'),
      RegExp(r'À|Á|Ạ|Ả|Ã|Â|Ầ|Ấ|Ậ|Ẩ|Ẫ|Ă|Ằ|Ắ|Ặ|Ẳ|Ẵ'),
      RegExp(r'è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ'),
      RegExp(r'È|É|Ẹ|Ẻ|Ẽ|Ê|Ề|Ế|Ệ|Ể|Ễ'),
      RegExp(r'ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ'),
      RegExp(r'Ò|Ó|Ọ|Ỏ|Õ|Ô|Ồ|Ố|Ộ|Ổ|Ỗ|Ơ|Ờ|Ớ|Ợ|Ở|Ỡ'),
      RegExp(r'ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ'),
      RegExp(r'Ù|Ú|Ụ|Ủ|Ũ|Ư|Ừ|Ứ|Ự|Ử|Ữ'),
      RegExp(r'ì|í|ị|ỉ|ĩ'),
      RegExp(r'Ì|Í|Ị|Ỉ|Ĩ'),
      RegExp(r'đ'),
      RegExp(r'Đ'),
      RegExp(r'ỳ|ý|ỵ|ỷ|ỹ'),
      RegExp(r'Ỳ|Ý|Ỵ|Ỷ|Ỹ')
    ];
    var result = this;
    for (var i = 0; i < vietnamese.length; ++i) {
      result = result.replaceAll(vietnameseRegex[i], vietnamese[i]);
    }
    return result;
  }

  bool isValidPassLength() {
    return RegExp(r'^.{8,999}$').hasMatch(this);
  }

  bool isEmailWith(String regex) {
    return RegExp(regex).hasMatch(this);
  }

  bool isValidSpecial() {
    return RegExp('[0-9]|@|#').hasMatch(this);
  }

  bool isValidAz() {
    return RegExp('.*(^(.*([A-Z]).*([a-z]))|(([a-z]).*([A-Z]))).*')
        .hasMatch(this);
  }

  bool isValidPassword() {
    return RegExp(r"^(?=.*[A-Za-z])(?=.*\d).{6,20}$").hasMatch(this);
  }

  bool isVnMobilePhone() {
    return RegExp('(84|0[3|5|7|8|9])+([0-9]{8})').hasMatch(this);
  }

  String convertToPhone() {
    var res = this;
    if (startsWith("84")) {
      res = "0${res.substring(2)}";
    }

    res = res.replaceAll('+84', '0');

    if (!startsWith('0')) {
      res = '0$res';
    }
    res = res.replaceAll(RegExp("[^\\d]"), "");
    return res;
  }

  int hexToInt() {
    var hexColor = toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  String phoneWithDialCode(String dialCode) {
    var removeSpace = replaceAll(' ', '');
    if (dialCode == "+84") {
      if (removeSpace.startsWith("0")) removeSpace = removeSpace.substring(1);
      var subString = "";
      for (int i = 1; i <= removeSpace.length; i++) {
        if (i % 3 == 0) {
          subString += " ${removeSpace.substring(i - 3, i)}";
        }
      }
      return "($dialCode) $subString";
    } else {
      return "($dialCode) $removeSpace";
    }
  }

  bool get isNumericOnly => _isNumericOnly(this);
  String get onlyNumberic => _numbericOnly();

  String _numbericOnly({bool firstWordOnly = false}) {
    var numericOnlyStr = '';

    for (var i = 0; i < length; i++) {
      if (_isNumericOnly(this[i])) {
        numericOnlyStr += this[i];
      }
      if (firstWordOnly && numericOnlyStr.isNotEmpty && this[i] == " ") {
        break;
      }
    }

    return numericOnlyStr;
  }

  bool _isNumericOnly(String? value) {
    return (value == null) ? false : RegExp(r'^\d+$').hasMatch(value);
  }

  Size textSize({
    required TextStyle style,
    TextDirection? textDirection = TextDirection.rtl,
  }) {
    if (isEmpty) return Size.zero;
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: this, style: style),
      maxLines: 1,
      textDirection: textDirection,
    )..layout();
    return textPainter.size;
  }

  String get hashSha256 {
    final encode = utf8.encode(this);
    var checksum = sha256.convert(encode).toString();
    return checksum;
  }

  List<int> toListInt(String pattern, {int onFailed = -1}) {
    if (isEmpty) return [];
    final list = split(pattern);
    return list.map((e) => int.tryParse(e) ?? onFailed).toList();
  }

  List<String> toListString(String pattern) => split(pattern);
}
