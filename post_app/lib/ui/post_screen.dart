import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_app/bloc/post_bloc.dart';
import 'package:post_app/bloc/post_event.dart';
import 'package:post_app/bloc/post_state.dart';
import 'package:post_app/utils/enums.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<PostBloc>().add(PostFetch());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: BlocBuilder<PostBloc, PostState>(
          builder: (context, state) {
            switch (state.postStatus) {
              case PostStatus.loading:
                return Center(
                  child: CircularProgressIndicator(),
                );
              case PostStatus.failure:
                return Text(state.message.toString());
              case PostStatus.success:
                return ListView.builder(
                  itemCount: state.postList.length,
                  itemBuilder: (context, index) {
                    final item = state.postList[index];
                    return ListTile(
                      title: Text(item.title.toString()),
                      subtitle: Text(item.body.toString()),
                    );
                  },
                );
            }
          },
        ),
      ),
    );
  }
}
