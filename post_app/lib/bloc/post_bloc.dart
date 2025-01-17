import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_app/bloc/post_event.dart';
import 'package:post_app/bloc/post_state.dart';
import 'package:post_app/repository/post_repository.dart';
import 'package:post_app/utils/enums.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostRepository postRepository = PostRepository();
  PostBloc() : super(PostState()) {
    on<PostFetch>(fetchPostApi);
  }

  void fetchPostApi(PostFetch event, Emitter<PostState> emit) async {
    await postRepository.fetchPost().then((value) {
      emit(state.copyWith(
        postStatus: PostStatus.success,
        postList: value,
        message: "success",
      ));
    }).onError((error, stackTrace) {
      emit(state.copyWith(
        postStatus: PostStatus.failure,
        message: error.toString(),
      ));
    });
  }
}
