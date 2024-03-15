import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BatteryLevelController extends ChangeNotifier {
  static const platform = MethodChannel('samples.flutter.dev/battery');
  int batteryLevel = 0;

  Future<void> getBatteryLevel() async {
    try {
      final result = await platform.invokeMethod<int>('getBatteryLevel');
      batteryLevel = result ?? 0;
      notifyListeners();
    } on PlatformException catch (e) {
      log(e.toString());
    }
  }
}
