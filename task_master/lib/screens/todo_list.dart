import 'package:flutter/material.dart';
import 'package:task_master/screens/add_page.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        centerTitle: true,
        title: const Text("Task Master"),
      ),
      floatingActionButton: FloatingActionButton.extended(
      onPressed: navigateToAddPage,
      label: Text("Add Task"),),
    );
  }

  void navigateToAddPage(){
    final route = MaterialPageRoute(builder: (context) => AddTaskPage(),);
    Navigator.push(context, route);
  }
}
