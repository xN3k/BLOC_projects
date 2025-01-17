import 'package:equatable/equatable.dart';
import 'package:post_app/models/model.dart';
import 'package:post_app/utils/enums.dart';

class PostState extends Equatable {
  final PostStatus postStatus;

  final List<PostModel> postList;

  final String message;

  final List<PostModel> searchList;

  const PostState({
    this.message = '',
    this.postList = const [],
    this.postStatus = PostStatus.loading,
    this.searchList = const [],
  });

  PostState copyWith({
    PostStatus? postStatus,
    List<PostModel>? postList,
    String? message,
    List<PostModel>? searchList,
  }) {
    return PostState(
      postList: postList ?? this.postList,
      postStatus: postStatus ?? this.postStatus,
      message: message ?? this.message,
      searchList: searchList ?? this.searchList,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [postList, postStatus, message, searchList];
}
