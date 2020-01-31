import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manabie_todo/bloc/bloc.dart';
import 'package:manabie_todo/ui/all_tab.dart';
import 'package:manabie_todo/ui/complete_tab.dart';
import 'package:manabie_todo/ui/incomplete_tab.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  TodoBloc _todoBloc;
  int _currentTabIndex = 0;
  List<Widget> tabs = [];

  @override
  void initState() {
    super.initState();
    _todoBloc = BlocProvider.of<TodoBloc>(context);
    _todoBloc.add(GetTodo());
    tabs.addAll([
      AllTab(),
      InCompleteTab(),
      CompleteTab(),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TodoBloc, TodoState>(
      bloc: _todoBloc,
      listener: (_, state) {
        if (state is TodoUpdatedState) {
          _todoBloc.add(GetTodo());
        }
      },
      child: Scaffold(
        body: tabs[_currentTabIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.all_inclusive), title: Text('All')),
            BottomNavigationBarItem(
                icon: Icon(Icons.assessment), title: Text('Todo')),
            BottomNavigationBarItem(
                icon: Icon(Icons.done_outline), title: Text('Done')),
          ],
          onTap: (index) {
            setState(() {
              _currentTabIndex = index;
            });
          },
          currentIndex: _currentTabIndex,
        ),
      ),
    );
  }
}
