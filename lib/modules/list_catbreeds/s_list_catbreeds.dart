import 'package:catbreeds/data/repository/base.dart';
import 'package:catbreeds/data/repository/cat_breeds.dart';
import 'package:catbreeds/data/uses_cases/cat_breeds.dart';
import 'package:catbreeds/modules/list_catbreeds/c_list_catbreeds.dart';
import 'package:catbreeds/modules/list_catbreeds/widgets/empty_list_catbreeds.dart';
import 'package:catbreeds/modules/list_catbreeds/widgets/list_catbreeds.dart';
import 'package:catbreeds/modules/list_catbreeds/widgets/loading_catbreeds.dart';
import 'package:catbreeds/ui/widgets/app_bar.dart';
import 'package:catbreeds/ui/widgets/scaffold_with_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListCatBreedsScreen extends StatefulWidget {
  const ListCatBreedsScreen._();

  static init() {
    return ChangeNotifierProvider(
      create: (_) => ListCatBreedsController(
        catBreedsUseCase: CatBreedsUseCase(
          catBreedsRepository: CatBreedsRepository(
            baseRepository: BaseRepository(),
          ),
        ),
      ),
      child: const ListCatBreedsScreen._(),
    );
  }

  @override
  State<ListCatBreedsScreen> createState() => _ListCatBreedsScreenState();
}

class _ListCatBreedsScreenState extends State<ListCatBreedsScreen> {
  @override
  void initState() {
    super.initState();
    final ListCatBreedsController controller = context.read();
    WidgetsBinding.instance
        .addPostFrameCallback((timeStamp) => controller.getCatBreeds());
  }

  @override
  Widget build(BuildContext context) {
    final ListCatBreedsController controller = context.watch();

    return ScaffoldWithSafeArea(
      appBar: CustomAppBar(
        text: "CatBreeds",
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Builder(
              builder: (context) {
                if (controller.isLoading) {
                  return const LoadingCatBreeds();
                }
                if (controller.isEmptyCatBreed) {
                  return const EmptyListCatBreeds();
                }
                return const ListCatBreeds();
              },
            ),
          )
        ],
      ),
    );
  }
}
