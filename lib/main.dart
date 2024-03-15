import 'package:catbreeds/g_controllers/battery_level.dart';
import 'package:catbreeds/ui/routes/names.dart';
import 'package:catbreeds/ui/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BatteryLevelController()),
      ],
      child: const CatBreedsApp(),
    ),
  );
}

class CatBreedsApp extends StatefulWidget {
  const CatBreedsApp({super.key});

  @override
  State<CatBreedsApp> createState() => _CatBreedsAppState();
}

class _CatBreedsAppState extends State<CatBreedsApp> {
  @override
  void initState() {
    super.initState();
    context.read<BatteryLevelController>().getBatteryLevel();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      builder: (_, child) {
        return MaterialApp(
          themeMode: ThemeMode.light,
          theme: ThemeData.light().copyWith(
            scaffoldBackgroundColor: Colors.white,
          ),
          builder: (context, widget) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaler: const TextScaler.linear(1.0),
              ),
              child: widget!,
            );
          },
          onGenerateRoute: CustomRoutes.routes,
          initialRoute: Routes.initial,
          debugShowCheckedModeBanner: false,
          title: 'Cat Breeds',
        );
      },
    );
  }
}
