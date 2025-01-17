import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_app/bloc/post_event.dart';
import 'package:post_app/bloc/post_state.dart';
import 'package:post_app/models/model.dart';
import 'package:post_app/repository/post_repository.dart';
import 'package:post_app/utils/enums.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  List<PostModel> searchedList = [];
  PostRepository postRepository = PostRepository();
  PostBloc() : super(PostState()) {
    on<PostFetch>(fetchPostApi);
    on<SearchPost>(_searchedResult);
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

  void _searchedResult(SearchPost event, Emitter<PostState> emit) async {
    if (event.search.isEmpty) {
      emit(state.copyWith(searchList: [], searchMessage: ''));
    } else {
      searchedList = state.postList
          .where((element) =>
              element.title.toString().toLowerCase().contains(event.search))
          .toList();
      if (searchedList.isEmpty) {
        emit(state.copyWith(
            searchList: searchedList,
            searchMessage: "No data found try another phrase"));
      } else {
        emit(state.copyWith(searchList: searchedList, searchMessage: ''));
      }
    }
  }
}
