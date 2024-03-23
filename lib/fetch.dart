import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:untitled1/todo.dart';


Todo todoFromJson(String str) => Todo.fromJson(json.decode(str));

String todoToJson(Todo data) => json.encode(data.toJson());

class ApiService {
  static Future<Todo> fetchTodo() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos/5'));
    if (response.statusCode == 200) {
      return Todo.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load todo');
    }
  }
}