class Todo {
  final int id;
  final String content;
  final bool complete;

  Todo(
    this.id,
    this.content,
    this.complete,
  );

  Todo copyWith({String content, bool complete}) =>
      Todo(this.id, content ?? this.content, complete ?? this.complete);
}
