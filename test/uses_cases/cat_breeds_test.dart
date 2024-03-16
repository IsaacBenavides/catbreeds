import 'dart:convert';

import 'package:catbreeds/data/uses_cases/base.dart';
import 'package:catbreeds/data/uses_cases/cat_breeds.dart';
import 'package:catbreeds/models/cat_breeds.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import "package:http/http.dart" as http;
import 'package:mockito/mockito.dart';

import 'repository.dart';
import 'constants.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  group("Cat Breeds Use Case Test: ", () {
    late MockCatBreedsRepository mockCatBreedsRepository;
    late CatBreedsUseCase catBreedsUseCase;
    setUpAll(() {
      mockCatBreedsRepository = MockCatBreedsRepository();
      catBreedsUseCase = CatBreedsUseCase(
        catBreedsRepository: mockCatBreedsRepository,
      );
    });

    test("Success", () async {
      when(mockCatBreedsRepository.getCatBreeds()).thenAnswer(
        (_) => Future.value(
          http.Response(json.encode(catBreeds), 200),
        ),
      );
      List<CatBreed> catBreedsResponse = await catBreedsUseCase.call();
      expect(catBreedsResponse.runtimeType, List<CatBreed>);
      expect(catBreedsResponse[0].id, "abys");
    });

    test("Failed", () async {
      when(mockCatBreedsRepository.getCatBreeds()).thenAnswer(
        (_) => Future.value(
          http.Response(json.encode([]), 500),
        ),
      );
      Future<List<CatBreed>> catBreedsResponse = catBreedsUseCase.call();
      expect(
        catBreedsResponse,
        throwsA(
          predicate(
            (p0) => p0 is UseCaseException,
          ),
        ),
      );
    });
  });
}
