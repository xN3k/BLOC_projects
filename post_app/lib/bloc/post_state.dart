import 'package:equatable/equatable.dart';
import 'package:post_app/models/model.dart';
import 'package:post_app/utils/enums.dart';

class PostState extends Equatable {
  final PostStatus postStatus;

  final List<PostModel> postList;

  final String message;

  const PostState({
    this.message = '',
    this.postList = const [],
    this.postStatus = PostStatus.loading,
  });

  PostState copyWith({
    PostStatus? postStatus,
    List<PostModel>? postList,
    String? message,
  }) {
    return PostState(
      postList: postList ?? this.postList,
      postStatus: postStatus ?? this.postStatus,
      message: message ?? this.message,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [postList, postStatus, message];
}
