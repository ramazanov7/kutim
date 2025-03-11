import 'dart:async';

import 'package:flutter/material.dart';

class FieldDebouncer {
  final int milliseconds;
  Timer? _timer;

  FieldDebouncer({required this.milliseconds});

  void run(VoidCallback action) {
    if (null != _timer) {
      _timer?.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }

  void cancel() {
    _timer?.cancel();
  }
}
