import 'package:catbreeds/g_controllers/battery_level.dart';
import 'package:catbreeds/ui/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class BatteryLevelWidget extends StatelessWidget {
  const BatteryLevelWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final batteryPercent = context.watch<BatteryLevelController>();

    MaterialColor getColor() {
      if (batteryPercent.batteryLevel >= 0 &&
          batteryPercent.batteryLevel <= 20) {
        return Colors.red;
      }
      if (batteryPercent.batteryLevel > 20 &&
          batteryPercent.batteryLevel < 50) {
        return Colors.yellow;
      }
      return Colors.green;
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.sp),
      child: CustomText(
        text: "Battery: ${batteryPercent.batteryLevel}%",
        fontSize: 8.sp,
        fontWeight: FontWeight.bold,
        color: getColor(),
      ),
    );
  }
}
