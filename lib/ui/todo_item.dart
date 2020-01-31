import 'package:flutter/material.dart';
import 'package:manabie_todo/data/models/todo.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  final Function onChecked;

  const TodoItem({
    Key key,
    @required this.todo,
    @required this.onChecked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: IconButton(
          icon: todo.complete
              ? Icon(Icons.check_circle)
              : Icon(Icons.check_circle_outline),
          onPressed: onChecked,
        ),
        title: Text(todo.content),
      ),
    );
  }
}
