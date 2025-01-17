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
        padding: EdgeInsets.all(25),
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
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.search),
                        hintText: "Search",
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (filterKey) {
                        context.read<PostBloc>().add(SearchPost(filterKey));
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.searchList.isEmpty
                            ? state.postList.length
                            : state.searchList.length,
                        itemBuilder: (context, index) {
                          if (state.searchList.isNotEmpty) {
                            final item = state.searchList[index];
                            return ListTile(
                              title: Text(item.title.toString()),
                              subtitle: Text(item.body.toString()),
                            );
                          } else {
                            final item = state.postList[index];
                            return ListTile(
                              title: Text(item.title.toString()),
                              subtitle: Text(item.body.toString()),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                );
            }
          },
        ),
      ),
    );
  }
}
