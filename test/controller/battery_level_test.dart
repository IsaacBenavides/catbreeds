import 'package:catbreeds/g_controllers/battery_level.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockMethodChannel extends Mock implements MethodChannel {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('BatteryLevelController', () {
    late BatteryLevelController controller;

    setUp(() {
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(
              const MethodChannel('samples.flutter.dev/battery'),
              (methodCall) async {
        if (methodCall.method == 'getBatteryLevel') {
          return 42;
        }
        return null;
      });
      controller = BatteryLevelController();
    });

    test('getBatteryLevel updates batteryLevel', () async {
      await controller.getBatteryLevel();
      expect(controller.batteryLevel, 42);
    });

    test('getBatteryLevel handles error', () async {
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(
              const MethodChannel('samples.flutter.dev/battery'),
              (methodCall) async {
        throw PlatformException(code: 'Battery level not available');
      });

      await controller.getBatteryLevel();
      expect(controller.batteryLevel, 0);
    });
  });
}
