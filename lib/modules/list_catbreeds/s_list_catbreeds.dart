import 'package:catbreeds/modules/list_catbreeds/c_list_catbreeds.dart';
import 'package:catbreeds/modules/list_catbreeds/widgets/loading_catbreeds.dart';
import 'package:catbreeds/ui/widgets/app_bar.dart';
import 'package:catbreeds/ui/widgets/scaffold_with_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListCatBreedsScreen extends StatelessWidget {
  const ListCatBreedsScreen._();

  static init() {
    return ChangeNotifierProvider.value(
      value: ListCatBreedsController(),
      child: const ListCatBreedsScreen._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithSafeArea(
      appBar: CustomAppBar(
        text: "CatBreeds",
      ),
      body: const LoadingCatBreeds(),
    );
  }
}
