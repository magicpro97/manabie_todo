import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:manabie_todo/bloc/bloc.dart';
import 'package:manabie_todo/data/models/todo.dart';
import 'package:manabie_todo/data/repositories/todo_repository.dart';
import 'package:mockito/mockito.dart';

class MockTodoRepository extends Mock implements TodoRepository {}

void main() {
  List<Todo> source;
  TodoBloc todoBloc;
  MockTodoRepository mockTodoRepository;

  setUp(() {
    source = [
      Todo(1, "A", true),
      Todo(2, "B", true),
      Todo(3, "C", false),
      Todo(4, "D", false),
      Todo(5, "E", true),
    ];
    mockTodoRepository = MockTodoRepository();
    todoBloc = TodoBloc(mockTodoRepository);
  });

  test('initialState should be TodoLoadingState', () {
    expect(todoBloc.initialState, TodoLoadingState());
  });

  group('GetTodo', () {
    blocTest(
      'should emit [TodoLoadingState, TodoLoadedState] when data is gotten sucessfully',
      build: () {
        when(mockTodoRepository.all).thenAnswer((_) => source);
        when(mockTodoRepository.complete)
            .thenAnswer((_) => source.where((e) => e.complete).toList());
        when(mockTodoRepository.inComplete)
            .thenAnswer((_) => source.where((e) => !e.complete).toList());
        return todoBloc;
      },
      act: (bloc) => bloc.add(GetTodo()),
      expect: [
        TodoLoadingState(),
        TodoLoadedState(),
      ],
    );

    blocTest(
      'should emit [TodoLoadingState, TodoLoadedFailState] when data is gotten failure',
      build: () {
        when(mockTodoRepository.all).thenThrow(Exception("Exception"));
        return todoBloc;
      },
      act: (bloc) => bloc.add(GetTodo()),
      expect: [
        TodoLoadingState(),
        TodoLoadedFailState("Exception"),
      ],
    );
  });

  group('UpdateTodo', () {
    blocTest(
      'should emit [TodoLoadingState, TodoUpdatedState] when data is updated sucessfully',
      build: () {
        when(mockTodoRepository.update(any)).thenAnswer((_) => source[0]);
        return todoBloc;
      },
      act: (bloc) => bloc.add(UpdateTodo(source[0])),
      expect: [
        TodoLoadingState(),
        TodoUpdatedState(),
      ],
    );

    blocTest(
      'should emit [TodoLoadingState, TodoLoadedFailState] when data is updated failure',
      build: () {
        when(mockTodoRepository.update(any)).thenThrow(Exception("Exception"));
        return todoBloc;
      },
      act: (bloc) => bloc.add(UpdateTodo(source[0])),
      expect: [
        TodoLoadingState(),
        TodoLoadedFailState("Exception"),
      ],
    );
  });
}
