import 'package:equatable/equatable.dart';
import 'package:post_app/models/model.dart';
import 'package:post_app/utils/enums.dart';

class PostState extends Equatable {
  final PostStatus postStatus;
  final List<PostModel> postList;
  final List<PostModel> searchList;
  final String message;
  final String searchMessage;

  const PostState({
    this.message = '',
    this.postList = const [],
    this.postStatus = PostStatus.loading,
    this.searchList = const [],
    this.searchMessage = '',
  });

  PostState copyWith({
    PostStatus? postStatus,
    List<PostModel>? postList,
    String? message,
    List<PostModel>? searchList,
    String? searchMessage,
  }) {
    return PostState(
      postList: postList ?? this.postList,
      postStatus: postStatus ?? this.postStatus,
      message: message ?? this.message,
      searchList: searchList ?? this.searchList,
      searchMessage: searchMessage ?? this.searchMessage,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        postList,
        postStatus,
        message,
        searchList,
        searchMessage,
      ];
}
