import 'package:todo_app_to_track_daily_r/models/todo.dart';
import 'package:todo_app_to_track_daily_r/repositories/todo_repository.dart';

class TodoService {
  final TodoRepository _repository;

  TodoService({TodoRepository? repository})
      : _repository = repository ?? TodoRepository();

  Future<List<Todo>> getTodos() async {
    try {
      return await _repository.getTodos();
    } catch (e) {
      throw Exception(
          'Unable to fetch todos. Please check your connection and try again.');
    }
  }

  Future<void> addTodo(
    String title,
    String description,
    DateTime dueDate,
  ) async {
    try {
      if (title.isEmpty) {
        throw Exception('Title cannot be empty');
      }

      final todo = Todo(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: title,
        description: description,
        dueDate: dueDate,
        createdAt: DateTime.now(),
      );

      await _repository.saveTodo(todo);
    } catch (e) {
      throw Exception('Failed to add todo. Please try again.');
    }
  }

  Future<void> updateTodo(Todo todo) async {
    try {
      if (todo.title.isEmpty) {
        throw Exception('Title cannot be empty');
      }
      await _repository.saveTodo(todo);
    } catch (e) {
      throw Exception('Failed to update todo. Please try again.');
    }
  }

  Future<void> deleteTodo(String id) async {
    try {
      await _repository.deleteTodo(id);
    } catch (e) {
      throw Exception('Failed to delete todo. Please try again.');
    }
  }

  Future<void> toggleTodoCompletion(String id) async {
    try {
      await _repository.toggleTodoCompletion(id);
    } catch (e) {
      throw Exception('Failed to update todo status. Please try again.');
    }
  }
}
