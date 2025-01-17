import 'package:equatable/equatable.dart';

abstract class PostEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class PostFetch extends PostEvent {}

class SearchPost extends PostEvent {
  final String search;

  SearchPost(this.search);
}
