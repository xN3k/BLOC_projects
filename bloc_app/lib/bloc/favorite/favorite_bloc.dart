import 'package:bloc_app/bloc/favorite/favorite_event.dart';
import 'package:bloc_app/bloc/favorite/favorite_state.dart';
import 'package:bloc_app/models/favorite_item_model.dart';
import 'package:bloc_app/repository/favorite_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  List<FavoriteItemModel> favoriteList = [];

  FavoriteRepository favoriteRepository;

  FavoriteBloc(this.favoriteRepository) : super(const FavoriteState()) {
    on<FetchFavoriteList>(fetchList);
    on<FavoriteItem>(_addFavoriteItem);
  }

  void fetchList(FetchFavoriteList event, Emitter<FavoriteState> emit) async {
    favoriteList = await favoriteRepository.fetchItems();
    emit(state.copyWith(
        favoriteItemList: List.from(favoriteList),
        listStatus: ListStatus.success));
  }

  void _addFavoriteItem(FavoriteItem event, Emitter<FavoriteState> emit) async {
    final index =
        favoriteList.indexWhere((element) => element.id == event.item.id);
    favoriteList[index] = event.item;

    emit(state.copyWith(favoriteItemList: List.from(favoriteList)));
  }
}
