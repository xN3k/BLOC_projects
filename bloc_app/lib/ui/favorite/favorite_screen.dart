import 'package:bloc_app/bloc/favorite/favorite_bloc.dart';
import 'package:bloc_app/bloc/favorite/favorite_event.dart';
import 'package:bloc_app/bloc/favorite/favorite_state.dart';
import 'package:bloc_app/models/favorite_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  void initState() {
    super.initState();
    context.read<FavoriteBloc>().add(FetchFavoriteList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<FavoriteBloc, FavoriteState>(
          builder: (context, state) {
            switch (state.listStatus) {
              case ListStatus.loading:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case ListStatus.failure:
                return const Center(
                  child: Text("Failed to load data"),
                );
              case ListStatus.success:
                return ListView.builder(
                  itemCount: state.favoriteItemList.length,
                  itemBuilder: (context, index) {
                    final item = state.favoriteItemList[index];
                    return Card(
                      child: ListTile(
                        title: Text(item.value.toString()),
                        trailing: IconButton(
                            onPressed: () {
                              FavoriteItemModel itemModel = FavoriteItemModel(
                                id: item.id,
                                value: item.value,
                                isFavorite: item.isFavorite ? false : true,
                              );
                              context
                                  .read<FavoriteBloc>()
                                  .add(FavoriteItem(item: itemModel));
                            },
                            icon: Icon(item.isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border)),
                      ),
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
