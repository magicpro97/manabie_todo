import 'package:flutter_test/flutter_test.dart';
import 'package:manabie_todo/data/models/todo.dart';

void main() {
  Todo todo;

  setUp((){
    todo = Todo(1, "ABC", true);
  });
  group("copyWith", () {
    test("Should return new Todo with new property", () {
      final newTodo = todo.copyWith(complete: false);
      expect(todo.complete, !newTodo.complete);
    });
  });
}