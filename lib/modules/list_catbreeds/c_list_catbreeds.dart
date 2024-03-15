import 'dart:developer';

import 'package:catbreeds/data/uses_cases/cat_breeds.dart';
import 'package:catbreeds/models/cat_breeds.dart';
import 'package:flutter/material.dart';

class ListCatBreedsController extends ChangeNotifier {
  ListCatBreedsController({required this.catBreedsUseCase});

  // USES CASES
  final CatBreedsUseCase catBreedsUseCase;

  // CONTROLLER VARIABLES

  bool isLoading = false;
  List<CatBreed> catBreeds = [];

  // GETTERS

  bool get isEmptyCatBreed {
    return catBreeds.isEmpty;
  }

  int get catBreedsAmount {
    return catBreeds.length;
  }

  // CONTROLLER FUNCTIONS

  _toggleIsLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  getCatBreeds() async {
    try {
      _toggleIsLoading();
      catBreeds = await catBreedsUseCase.call();
      notifyListeners();
    } catch (e) {
      log(e.toString());
    } finally {
      _toggleIsLoading();
    }
  }
}
