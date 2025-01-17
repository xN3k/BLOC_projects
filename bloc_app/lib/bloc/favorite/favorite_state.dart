import 'package:bloc_app/models/favorite_item_model.dart';
import 'package:equatable/equatable.dart';

enum ListStatus { loading, success, failure }

class FavoriteState extends Equatable {
  final List<FavoriteItemModel> favoriteItemList;
  final ListStatus listStatus;

  const FavoriteState({
    this.favoriteItemList = const [],
    this.listStatus = ListStatus.success,
  });

  FavoriteState copyWith(
      {List<FavoriteItemModel>? favoriteItemList, ListStatus? listStatus}) {
    return FavoriteState(
      favoriteItemList: favoriteItemList ?? this.favoriteItemList,
      listStatus: listStatus ?? this.listStatus,
    );
  }

  @override
  List<Object?> get props => [favoriteItemList, listStatus];
}
