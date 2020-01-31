import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manabie_todo/bloc/bloc.dart';
import 'package:manabie_todo/ui/todo_item.dart';

class AllTab extends StatefulWidget {
  const AllTab({Key key}) : super(key: key);

  @override
  _AllTabState createState() => _AllTabState();
}

class _AllTabState extends State<AllTab> {
  TodoBloc _todoBloc;

  @override
  void initState() {
    _todoBloc = BlocProvider.of<TodoBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final todoList = _todoBloc.allList ?? [];
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
                      todoList[index]
                          .copyWith(complete: !todoList[index].complete),
                    ),
                  );
                },
              ),
            );
          }),
    );
  }
}
