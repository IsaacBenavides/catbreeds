import 'package:catbreeds/ui/routes/names.dart';
import 'package:catbreeds/ui/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(
    const CatBreedsApp(),
  );
}

class CatBreedsApp extends StatelessWidget {
  const CatBreedsApp({super.key});
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
