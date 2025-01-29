import 'package:flutter/material.dart';
import 'package:task_master/screens/todo_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      // theme: ThemeData(
      //   primarySwatch: Colors.blue, // Choose a color scheme
      //   scaffoldBackgroundColor: Colors.grey[100], // Soft background
      //   appBarTheme: AppBarTheme(
      //     backgroundColor: Colors.blueAccent,
      //     centerTitle: true,
      //     titleTextStyle: TextStyle(
      //       color: Colors.white,
      //       fontWeight: FontWeight.bold,
      //       fontSize: 20,
      //     ),
      //   ),
      //   floatingActionButtonTheme: FloatingActionButtonThemeData(
      //     backgroundColor: Colors.blueAccent,
      //     foregroundColor: Colors.white,
      //   ),
      // ),

      debugShowCheckedModeBanner: false,
      home: const TodoListPage(),
    );
  }
}
