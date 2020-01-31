import 'package:manabie_todo/data/models/todo.dart';

final _todoList = List.generate(
  10,
  (index) => Todo(index, index.toString(), index.isEven),
);

class TodoRepository {
  final List<Todo> source;

  TodoRepository(this.source);

  List<Todo> get all => source;

  List<Todo> get complete => source.where((todo) => todo.complete).toList();

  List<Todo> get inComplete => source.where((todo) => !todo.complete).toList();

  Todo update(Todo todo) {
    source.removeAt(todo.id);
    source.insert(todo.id, todo);
    return todo;
  }
}

final todoRepository = TodoRepository(_todoList);
