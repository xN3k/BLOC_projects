import 'package:bloc_app/models/favorite_item_model.dart';
import 'package:equatable/equatable.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();
  @override
  List<Object> get props => [];
}

class FetchFavoriteList extends FavoriteEvent {}

class FavoriteItem extends FavoriteEvent {
  final FavoriteItemModel item;

  const FavoriteItem({
    required this.item,
  });
}
