import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todo_app/features/todo/models/todo_model.dart';

class TodoService {
  static Future<List<Todo>> getTodos() async {
    var response = await http.get(
      Uri.parse('https://65e584e9d7f0758a76e6917f.mockapi.io/api/v1/posts'),
    );

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);

      List<Todo> todos = data.map((e) => Todo.fromJson(e)).toList();

      return todos;
    }

    if (response.statusCode == 400 ||
        response.statusCode == 403 ||
        response.statusCode == 401) {
      return [];
    }

    return [];
  }

  static Future<bool> deleteTodos(String id) async {
    var response = await http.delete(
      Uri.parse('https://65e584e9d7f0758a76e6917f.mockapi.io/api/v1/posts/$id'),
    );

    if (response.statusCode == 200) {
      return true;
    }

    return false;
  }

  // edit
  static Future<bool> editTodos(
    String id,
    String todo,
    String? description,
  ) async {
    var response = await http.put(
      Uri.parse('https://65e584e9d7f0758a76e6917f.mockapi.io/api/v1/posts/$id'),
      body: {
        'todo': todo,
        'description': description ?? '',
      },
    );

    if (response.statusCode == 200) {
      return true;
    }

    return false;
  }

  // add
  static Future<bool> addTodos(String todo, String? description) async {
    var response = await http.post(
      Uri.parse('https://65e584e9d7f0758a76e6917f.mockapi.io/api/v1/posts'),
      body: {
        'todo': todo,
        'description': description ?? '',
      },
    );

    if (response.statusCode == 201) {
      return true;
    }

    return false;
  }
}
