import 'package:equatable/equatable.dart';
import 'package:manabie_todo/data/models/todo.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();
}

class GetTodo extends TodoEvent {
  @override
  List<Object> get props => [];
}

class UpdateTodo extends TodoEvent {
  final Todo todo;

  UpdateTodo(this.todo);

  @override
  List<Object> get props => [todo];
}