import 'package:flutter/material.dart';

extension CatBreedContext on BuildContext {
  Size get appSize {
    return MediaQuery.of(this).size;
  }

  Future<Object?> goTo(String route, {Object? arguments}) {
    return Navigator.of(this).pushNamed(route, arguments: arguments);
  }

  Future<Object?> goToAndReplace(
      String route, bool Function(Route<dynamic>) predicate,
      {Object? arguments}) {
    return Navigator.of(this).pushNamedAndRemoveUntil(
      route,
      predicate,
      arguments: arguments,
    );
  }

  Object? getArguments() {
    return ModalRoute.of(this)!.settings.arguments;
  }

  void unfocus() {
    FocusScope.of(this).unfocus();
  }
}
