import 'package:catbreeds/data/repository/cat_breeds.dart';
import 'package:catbreeds/data/uses_cases/base.dart';
import 'package:catbreeds/models/cat_breeds.dart';
import "package:http/http.dart" as http;

class CatBreedsUseCaseParams {
  final String page;
  CatBreedsUseCaseParams({required this.page});
}

class CatBreedsUseCase extends UseCaseNoParams<List<CatBreed>> {
  final CatBreedsRepository catBreedsRepository;

  CatBreedsUseCase({required this.catBreedsRepository});

  @override
  Future<List<CatBreed>> call() async {
    final http.Response response = await catBreedsRepository.getCatBreeds();

    switch (response.statusCode) {
      case 200:
        return catBreedFromBytes(response.bodyBytes);
      default:
        throw UseCaseException("There was a mistake. Try again later");
    }
  }
}
