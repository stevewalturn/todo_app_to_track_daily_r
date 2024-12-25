import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app_to_track_daily_r/models/todo.dart';

class TodoRepository {
  static const String _todoKey = 'todos';

  Future<List<Todo>> getTodos() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final todosJson = prefs.getStringList(_todoKey) ?? [];
      return todosJson.map((json) => Todo.fromJson(jsonDecode(json))).toList()
        ..sort((a, b) => a.dueDate.compareTo(b.dueDate));
    } catch (e) {
      throw Exception('Failed to load todos. Please try again later.');
    }
  }

  Future<void> saveTodo(Todo todo) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final todos = await getTodos();
      final existingIndex = todos.indexWhere((t) => t.id == todo.id);

      if (existingIndex >= 0) {
        todos[existingIndex] = todo;
      } else {
        todos.add(todo);
      }

      final todosJson = todos.map((todo) => jsonEncode(todo.toJson())).toList();
      await prefs.setStringList(_todoKey, todosJson);
    } catch (e) {
      throw Exception('Failed to save todo. Please try again later.');
    }
  }

  Future<void> deleteTodo(String id) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final todos = await getTodos();
      todos.removeWhere((todo) => todo.id == id);

      final todosJson = todos.map((todo) => jsonEncode(todo.toJson())).toList();
      await prefs.setStringList(_todoKey, todosJson);
    } catch (e) {
      throw Exception('Failed to delete todo. Please try again later.');
    }
  }

  Future<void> toggleTodoCompletion(String id) async {
    try {
      final todos = await getTodos();
      final todoIndex = todos.indexWhere((todo) => todo.id == id);

      if (todoIndex >= 0) {
        final todo = todos[todoIndex];
        final updatedTodo = todo.copyWith(
          isCompleted: !todo.isCompleted,
          completedAt: !todo.isCompleted ? DateTime.now() : null,
        );
        await saveTodo(updatedTodo);
      }
    } catch (e) {
      throw Exception('Failed to update todo status. Please try again later.');
    }
  }
}
