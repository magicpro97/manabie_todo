import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:manabie_todo/data/models/todo.dart';
import 'package:manabie_todo/data/repositories/todo_repository.dart';

import './bloc.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final List<Todo> allList = [];
  final List<Todo> completeList = [];
  final List<Todo> inCompleteList = [];

  final TodoRepository todoRepository;

  TodoBloc(this.todoRepository);

  @override
  TodoState get initialState => TodoLoadingState();

  @override
  Stream<TodoState> mapEventToState(
    TodoEvent event,
  ) async* {
    if (event is GetTodo) {
      yield TodoLoadingState();
      try {
        allList.clear();
        completeList.clear();
        inCompleteList.clear();
        allList.addAll(todoRepository.all);
        completeList.addAll(todoRepository.complete);
        inCompleteList.addAll(todoRepository.inComplete);
        yield TodoLoadedState();
      } catch (e) {
        yield TodoLoadedFailState(e.toString());
      }
    } else if (event is UpdateTodo) {
      try {
        todoRepository.update(event.todo);
        yield TodoUpdatedState();
      } catch (e) {
        yield TodoLoadedFailState(e.toString());
      }
    }
  }
}
