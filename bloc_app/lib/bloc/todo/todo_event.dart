import 'package:equatable/equatable.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();
}

class InsertTodo extends TodoEvent {
  final String task;

  const InsertTodo({required this.task});

  @override
  List<Object> get props => [task];
}

class DeleteTodo extends TodoEvent {
  final Object task;

  const DeleteTodo({required this.task});
  @override
  List<Object> get props => [task];
}
