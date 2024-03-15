import 'package:catbreeds/modules/initial/s_initial.dart';
import 'package:catbreeds/modules/list_catbreeds/s_list_catbreeds.dart';
import 'package:catbreeds/ui/routes/names.dart';
import 'package:flutter/material.dart';

class CustomRoutes {
  static Route<dynamic> routes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initial:
        return MaterialPageRoute(
          builder: (context) => const InitialScreen(),
          settings: settings,
        );
      case Routes.listcatbreeds:
        return MaterialPageRoute(
          builder: (context) => ListCatBreedsScreen.init(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(),
          settings: settings,
        );
    }
  }
}
