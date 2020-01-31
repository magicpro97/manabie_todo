import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manabie_todo/bloc/bloc.dart';
import 'package:manabie_todo/ui/todo_item.dart';

class InCompleteTab extends StatefulWidget {
  @override
  _InCompleteTabState createState() => _InCompleteTabState();
}

class _InCompleteTabState extends State<InCompleteTab> {
  TodoBloc _todoBloc;

  @override
  void initState() {
    super.initState();
    _todoBloc = BlocProvider.of<TodoBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    final todoList = _todoBloc.inCompleteList ?? [];
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
                      todoList[index].copyWith(complete: true),
                    ),
                  );
                },
              ),
            );
          }),
    );
  }
}
