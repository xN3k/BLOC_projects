import 'package:bloc_app/bloc/todo/todo_bloc.dart';
import 'package:bloc_app/bloc/todo/todo_event.dart';
import 'package:bloc_app/bloc/todo/todo_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ToDo"),
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state.todoList.isEmpty) {
            return const Center(
              child: Text('Nothing here, please try adding something'),
            );
          } else if (state.todoList.isNotEmpty) {
            return ListView.builder(
              itemCount: state.todoList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    index.toString(),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      context
                          .read<TodoBloc>()
                          .add(DeleteTodo(task: state.todoList[index]));
                    },
                    icon: Icon(Icons.delete),
                  ),
                );
              },
            );
          } else {
            return SizedBox();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          for (int i = 0; i < 5; i++) {
            context
                .read<TodoBloc>()
                .add(InsertTodo(task: 'Task: ' + i.toString()));
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
