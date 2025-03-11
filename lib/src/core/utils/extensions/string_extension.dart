import 'dart:convert';

import 'package:kutim/src/core/constant/constants.dart';
import 'package:tuple/tuple.dart';

/// Common extensions for [String]
extension StringExtension on String {
  /// Returns a new string with the first [length] characters of this string.
  String limit(int length) => length < this.length ? substring(0, length) : this;

  String monthToUpperCase() {
    final list = split('.');
    if (list.length > 1) {
      list[1] = list[1].capitalize();
    }
    final StringBuffer stringBuffer = StringBuffer();
    for (var i = 0; i < list.length; i++) {
      stringBuffer.write(list[i]);
      if (i != list.length - 1) {
        stringBuffer.write('.');
      }
    }
    return stringBuffer.toString();
  }

  bool emailValidator() => RegExp(
        // r"^[a-zA-Z0-9.a-zA-Z0-9._]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
        // r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
      ).hasMatch(this);

  bool oneDigit() => RegExp(
        r'^.*\d.*',
      ).hasMatch(this);

  bool atLeastOneUpperAndOneLowerAZ() => RegExp(
        r'^(?=.*[a-z])(?=.*[A-Z]).+$',
      ).hasMatch(this);

  bool upperAndLowerAZ() => RegExp(
        r'^.*[A-Za-z\s].*',
      ).hasMatch(this);

  bool oneSpecialChar() => RegExp(
        r'^.*[^\A-Z0-9\a-z0-9\А-Я0-9\а-я0-9\u04D8\u04D9\u04B0\u04B1\u0406\u0456\u04A2\u04A3\u0492\u0493\u04AE\u04AF\u049A\u049B\u04E8\u04E9\u04BA\u04BB].*',
      ).hasMatch(this);

  bool numberValidator() {
    if (length == 11) {
      return RegExp(
        r'^[0-9]{11}$',
      ).hasMatch(this);
    }
    return RegExp(
      r'^[0-9]{10}$',
    ).hasMatch(this);
  }

  bool isPhone() => RegExp(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{5,5}$').hasMatch(this);

  bool isOnlyDigits() {
    if (startsWith('+')) {
      return RegExp(
        r'^[\+]?[0-9]',
      ).hasMatch(this);
    }

    return false;
  }

  bool isNumeric() => num.tryParse(this) != null;
}

extension NullableImageExtension on String? {
  String handleImage() {
    if (this != null && this!.isNotEmpty) {
      return this!;
    } else {
      return NO_IMAGE_AVAILABLE;
    }
  }

  String? handleNullableImage() {
    if (this != null && this!.isNotEmpty) {
      return this!;
    } else {
      return null;
    }
  }

  String? addNewLine({
    required String word,
  }) {
    if (this != null && this!.isNotEmpty) {
      if (this!.contains(word)) {
        final index = this!.indexOf(word);
        final stringBuffer = StringBuffer()
          ..write(this!.substring(0, index))
          ..writeln()
          ..write(this!.substring(index, this!.length));
        return stringBuffer.toString();
      } else {
        return this!;
      }
    } else {
      return null;
    }
  }

  String? getLine({
    required int index,
  }) {
    if (this != null && this!.isNotEmpty) {
      final list = this!.split(',');
      final first = StringBuffer();
      final second = StringBuffer();

      if (list.length < 3 && index == 0) {
        return this;
      }
      if (list.length < 3 && index == 1) {
        return null;
      }

      for (var i = 0; i < list.length; i++) {
        if (i >= 2) {
          second.write(list[i]);
          if (i != list.length - 1) {
            second.write(',');
          }
        } else {
          first
            ..write(list[i])
            ..write(',');
        }
      }
      if (index == 0) {
        return first.toString();
      } else {
        return second.toString();
      }
    } else {
      return null;
    }
  }

  Tuple2<String, String> getTwoLines() {
    if (this == null) {
      return const Tuple2('', '');
    }
    const ls = LineSplitter();
    final array = ls.convert(this!);

    if (array.length >= 2) {
      return Tuple2(array.first, array[1]);
    } else if (array.isNotEmpty) {
      return Tuple2(array.first, '');
    } else {
      return const Tuple2('', '');
    }
  }

  int nullableLentgh() {
    if (this == null) {
      return 0;
    } else {
      return this!.length;
    }
  }

  bool nullableContains(String value) {
    if (this == null) {
      return false;
    } else {
      return this!.contains(value);
    }
  }

  String getFirstLettter() {
    if (this == null || this!.isEmpty) return '';

    return this![0];
  }

  String capitalize() {
    if (this == null || this!.isEmpty) return '';

    return '${this![0].toUpperCase()}${this!.substring(1)}';
  }

  String pre7() {
    return '7$this';
  }
}
