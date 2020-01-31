import 'package:equatable/equatable.dart';

abstract class TodoState extends Equatable {
  const TodoState();
}

class TodoLoadingState extends TodoState {
  @override
  List<Object> get props => [];
}

class TodoLoadedState extends TodoState {
  @override
  List<Object> get props => [];
}

class TodoLoadedFailState extends TodoState {
  final String message;

  TodoLoadedFailState(this.message);

  @override
  List<Object> get props => null;
}

class TodoUpdatedState extends TodoState {
  @override
  List<Object> get props => [];
}
