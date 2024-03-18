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
  List<CatBreed> catBreedsMemory = [];

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
      final catBreeds = await catBreedsUseCase.call();
      this.catBreeds = catBreeds;
      catBreedsMemory = catBreeds;
      notifyListeners();
    } catch (e) {
      log(e.toString());
    } finally {
      _toggleIsLoading();
    }
  }

  bool equal() {
    return catBreeds == catBreedsMemory;
  }

  filterCatBreed(String catBreed) async {
    catBreeds = catBreedsMemory;
    List<CatBreed> filteredCatBreeds = catBreeds
        .where(
          (element) =>
              element.name!.toLowerCase().contains(catBreed.toLowerCase()),
        )
        .toList();
    _toggleIsLoading();
    await Future.delayed(const Duration(milliseconds: 500));
    _toggleIsLoading();
    catBreeds = filteredCatBreeds;
    notifyListeners();
  }

  void setAllCatBreeds() async {
    _toggleIsLoading();
    await Future.delayed(const Duration(milliseconds: 500));
    _toggleIsLoading();
    catBreeds = catBreedsMemory;
    notifyListeners();
  }
}
