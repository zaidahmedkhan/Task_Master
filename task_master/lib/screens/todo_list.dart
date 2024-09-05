import 'package:flutter/material.dart';
import 'package:task_master/screens/add_page.dart';
import 'package:task_master/services/task_services.dart';
import 'package:task_master/utils/snackbar_helpers.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  bool isLoading = true;
  List items = [];

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
        label: CircleAvatar(child: Text("Add Task")),
      ),
      body: Visibility(
        visible: isLoading,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
        replacement: RefreshIndicator(
          onRefresh: fetchTodo,
          child: Visibility(
            visible: items.isNotEmpty,
            replacement: const Center(
              child: Text(
                "No Tasks",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            child: ListView.builder(
                itemCount: items.length,
                padding: const EdgeInsets.all(10),
                itemBuilder: (context, index) {
                  final item = items[index] as Map;
                  final id = item['_id'] as String;
                  return Card(
                    child: ListTile(
                      leading: Text("${index + 1}"),
                      title: Text(item['title']),
                      subtitle: Text(item['description']),
                      trailing: PopupMenuButton(
                        onSelected: (value) {
                          if (value == "edit") {
                            navigateToEditPage(item);
                          } else if (value == "delete") {
                            deleteById(id);
                          }
                        },
                        itemBuilder: (context) {
                          return [
                            const PopupMenuItem(
                              value: "edit",
                              child: Text("Edit"),
                            ),
                            const PopupMenuItem(
                              value: "delete",
                              child: Text("Delete"),
                            )
                          ];
                        },
                      ),
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }

  Future<void> navigateToAddPage() async {
    final route = MaterialPageRoute(
      builder: (context) => AddTaskPage(),
    );
    await Navigator.push(context, route);
    setState(() {
      isLoading = true;
    });
    fetchTodo();
  }

  Future<void> navigateToEditPage(Map item) async {
    final route = MaterialPageRoute(
      builder: (context) => AddTaskPage(todo: item),
    );
    await Navigator.push(context, route);

    setState(() {
      isLoading = true;
    });
    fetchTodo();
  }

  Future<void> fetchTodo() async {
    final response = await TaskService.fetchTodos();

    if (response != null) {
      setState(() {
        items = response;
      });
    } else {
      showErrorMessage(context, message: "Something went wrong!");
    }

    setState(() {
      isLoading = false;
    });
  }

  Future<void> deleteById(String id) async {
    final isSuccess = await TaskService.deleteById(id);

    if (isSuccess) {
      final filtered = items.where((element) => element['_id'] != id).toList();

      setState(() {
        items = filtered;
      });
    } else {
      showErrorMessage(context, message: "Deletion Failed");
    }
  }
}
