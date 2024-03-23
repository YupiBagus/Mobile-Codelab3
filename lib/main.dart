import 'package:flutter/material.dart';
import 'package:untitled1/todo.dart';
import 'package:untitled1/fetch.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cek run 4',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Cek Run 4'),
        ),
        body: FutureBuilder<Todo>(
          future: ApiService.fetchTodo(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('User ID: ${snapshot.data!.userId}'),
                    Text('ID: ${snapshot.data!.id}'),
                    Text('Title: ${snapshot.data!.title}'),
                    Text('Completed: ${snapshot.data!.completed}'),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}