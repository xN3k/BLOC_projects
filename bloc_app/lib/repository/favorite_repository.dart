import 'package:bloc_app/models/favorite_item_model.dart';

class FavoriteRepository {
  Future<List<FavoriteItemModel>> fetchItems() async {
    await Future<void>.delayed(const Duration(seconds: 3));
    return List.of(_generateItemsList(10));
  }

  List<FavoriteItemModel> _generateItemsList(int length) {
    return List.generate(
      length,
      (index) => FavoriteItemModel(id: '$index', value: 'Item $index'),
    );
  }
}
