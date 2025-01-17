import 'package:equatable/equatable.dart';

class FavoriteItemModel extends Equatable {
  final String id;
  final String value;
  final bool isDelete;
  final bool isFavorite;

  const FavoriteItemModel({
    required this.id,
    required this.value,
    this.isDelete = false,
    this.isFavorite = false,
  });

  FavoriteItemModel copyWith(
      {String? id, String? value, bool? isDelete, bool? isFavorite}) {
    return FavoriteItemModel(
      id: id ?? this.id,
      value: value ?? this.value,
      isDelete: isDelete ?? this.isDelete,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  @override
  List<Object?> get props => [id, value, isDelete, isFavorite];
}
