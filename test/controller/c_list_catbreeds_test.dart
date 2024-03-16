import 'package:catbreeds/modules/list_catbreeds/c_list_catbreeds.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider_test/provider_test.dart';

import 'constants.dart';
import 'use_case.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  group("List CatBreed Controller Test: ", () {
    late MockCatBreedsUseCase mockCatBreedsUseCase;
    late ListCatBreedsController listCatBreedsController;

    setUpAll(() {
      mockCatBreedsUseCase = MockCatBreedsUseCase();
      listCatBreedsController =
          ListCatBreedsController(catBreedsUseCase: mockCatBreedsUseCase);
    });

    test("Get isEmptyCatBreed ", () {
      when(mockCatBreedsUseCase.call()).thenAnswer(
        (realInvocation) => Future.value([]),
      );
      listCatBreedsController.getCatBreeds();
      expect(listCatBreedsController.isEmptyCatBreed, true);
    });

    test("Is loading when get breeds is called", () async {
      final future = listCatBreedsController.getCatBreeds();
      expect(listCatBreedsController.isLoading, true);
      await future;
      expect(listCatBreedsController.isLoading, false);
    });

    testProvider(
      "Success Add CatBreeds to State",
      build: () => listCatBreedsController,
      act: (provider) {
        when(mockCatBreedsUseCase.call()).thenAnswer(
          (realInvocation) => Future.value(parsedCatBreeds),
        );
        return provider.getCatBreeds();
      },
      expect: {
        (ListCatBreedsController provider) => provider.catBreeds.length: [1],
      },
    );

    testProvider(
      "Get catBreedsAmount",
      build: () => listCatBreedsController,
      act: (provider) {
        when(mockCatBreedsUseCase.call()).thenAnswer(
          (realInvocation) => Future.value(parsedCatBreeds),
        );
      },
      expect: {
        (ListCatBreedsController provider) => provider.catBreedsAmount: [1],
      },
    );
  });
}
