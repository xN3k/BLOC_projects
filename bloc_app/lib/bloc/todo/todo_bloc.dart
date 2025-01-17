import 'package:bloc_app/bloc/todo/todo_event.dart';
import 'package:bloc_app/bloc/todo/todo_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final List<String> todoList = [];
  TodoBloc() : super(TodoState()) {
    on<InsertTodo>(_insertTodo);
    on<DeleteTodo>(_removeTodo);
  }

  void _insertTodo(InsertTodo event, Emitter<TodoState> emit) {
    todoList.add(event.task);
    emit(state.copyWith(todoList: List.from(todoList)));
  }

  void _removeTodo(DeleteTodo event, Emitter<TodoState> emit) {
    todoList.remove(event.task);
    emit(state.copyWith(todoList: List.from(todoList)));
  }
}
