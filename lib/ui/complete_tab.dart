import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manabie_todo/bloc/bloc.dart';
import 'package:manabie_todo/ui/todo_item.dart';

class CompleteTab extends StatefulWidget {
  @override
  _CompleteTabState createState() => _CompleteTabState();
}

class _CompleteTabState extends State<CompleteTab> {
  TodoBloc _todoBloc;

  @override
  void initState() {
    super.initState();
    _todoBloc = BlocProvider.of<TodoBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    final todoList = _todoBloc.completeList ?? [];
    return SafeArea(
      child: BlocBuilder<TodoBloc, TodoState>(
          bloc: _todoBloc,
          builder: (_, state) {
            return ListView.builder(
              itemCount: todoList.length,
              itemBuilder: (_, index) => TodoItem(
                todo: todoList[index],
                onChecked: () {
                  _todoBloc.add(
                    UpdateTodo(
                      todoList[index].copyWith(complete: false),
                    ),
                  );
                },
              ),
            );
          }),
    );
  }
}
