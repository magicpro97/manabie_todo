import 'package:flutter_test/flutter_test.dart';
import 'package:manabie_todo/data/models/todo.dart';
import 'package:manabie_todo/data/repositories/todo_repository.dart';

void main() {
  List<Todo> source;
  TodoRepository todoRepository;
  List<Todo> allList;

  setUp(() {
    source = [
      Todo(1, "A", true),
      Todo(2, "B", true),
      Todo(3, "C", false),
      Todo(4, "D", false),
      Todo(5, "E", true),
    ];
    todoRepository = TodoRepository(source);
    allList = source;
  });
  test('Get all todo list', () {
    expect(todoRepository.all, allList);
  });
  test('Get complete todo list', () {
    expect(todoRepository.complete.contains((e) => !e.complete), false);
  });
  test('Get incomplete todo list', () {
    expect(todoRepository.inComplete.contains((e) => e.complete), false);
  });
  test('Update todo property', () {
    final updatedTodo =
        todoRepository.update(source[0].copyWith(complete: false));
    expect(updatedTodo.complete, !source[0].complete);
  });
}
