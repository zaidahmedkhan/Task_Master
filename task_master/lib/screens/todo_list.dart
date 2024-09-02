import 'package:flutter/material.dart';
import 'package:task_master/screens/add_page.dart';
import 'package:http/http.dart' as http;

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {


 @override
  void initState() {

    super.initState();
    fetchTodo();
  }

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



  Future<void> fetchTodo() async{
    final url = 'https://api.nstack.in/v1/todos?page=1&limit=10';
    final uri = Uri.parse(url);

    final response = await http.get(uri);

    print(response.statusCode);
    print(response.body);
  }
}
