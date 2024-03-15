import 'package:catbreeds/data/repository/base.dart';

class CatBreedsRepository {
  final BaseRepository baseRepository;
  const CatBreedsRepository({required this.baseRepository});

  getCatBreeds() {
    return baseRepository.get("/breeds");
  }
}
