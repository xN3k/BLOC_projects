import 'package:bloc_app/bloc/favorite/favorite_bloc.dart';
import 'package:bloc_app/bloc/image_picker/image_picker_bloc.dart';
import 'package:bloc_app/bloc/switch/switch_bloc.dart';
import 'package:bloc_app/bloc/todo/todo_bloc.dart';
import 'package:bloc_app/repository/favorite_repository.dart';
import 'package:bloc_app/ui/favorite/favorite_screen.dart';
import 'package:bloc_app/utils/image_picker_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/counter/counter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CounterBloc()),
        BlocProvider(create: (_) => SwitchBloc()),
        BlocProvider(
          create: (_) => ImagePickerBloc(ImagePickerUtils()),
        ),
        BlocProvider(create: (_) => TodoBloc()),
        BlocProvider(create: (_) => FavoriteBloc(FavoriteRepository())),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        theme: ThemeData(
          // brightness: Brightness.dark,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: FavoriteScreen(),
      ),
    );
  }
}
